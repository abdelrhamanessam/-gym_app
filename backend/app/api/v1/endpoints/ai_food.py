import base64
import io
import tempfile
import os
from fastapi import APIRouter, UploadFile, File, Form, Depends, HTTPException
from app.schemas.food import FoodItemSchema, ParsedFoodResponse
from app.api.dependencies import get_gemini_service, get_db
from app.services.gemini_service import GeminiService
from google.cloud.firestore import Client as FirestoreClient

router = APIRouter(prefix="/ai/food", tags=["AI Food Analysis"])

FOOD_DB_COLLECTION = "foodDatabase"

async def _lookup_or_estimate(food_name: str, quantity: float, unit: str, gemini: GeminiService, db: FirestoreClient) -> FoodItemSchema:
    food_lower = food_name.lower().strip()
    docs = db.collection(FOOD_DB_COLLECTION).where("nameLower", "==", food_lower).limit(1).get()
    if docs:
        data = docs[0].to_dict()
        scale = 1.0
        if data.get("servingSize", 0) > 0 and data.get("servingUnit", "") == unit:
            scale = quantity / data["servingSize"]
        elif data.get("servingSize", 0) > 0:
            scale = quantity / data["servingSize"]
        return FoodItemSchema(
            name=food_name,
            quantity=quantity,
            unit=unit,
            calories=data.get("calories", 0) * scale,
            protein_g=data.get("proteinG", 0) * scale,
            carbs_g=data.get("carbsG", 0) * scale,
            fat_g=data.get("fatG", 0) * scale,
        )
    nutrition = await gemini.estimate_nutrition(food_name, quantity, unit)
    return FoodItemSchema(
        name=food_name,
        quantity=quantity,
        unit=unit,
        calories=nutrition.get("calories", 0),
        protein_g=nutrition.get("protein_g", 0),
        carbs_g=nutrition.get("carbs_g", 0),
        fat_g=nutrition.get("fat_g", 0),
    )

def _compute_totals(foods: list[FoodItemSchema]) -> dict:
    return {
        "foods": foods,
        "total_calories": round(sum(f.calories for f in foods), 2),
        "total_protein": round(sum(f.protein_g for f in foods), 2),
        "total_carbs": round(sum(f.carbs_g for f in foods), 2),
        "total_fat": round(sum(f.fat_g for f in foods), 2),
    }

@router.post("/analyze-text", response_model=ParsedFoodResponse)
async def analyze_text(
    text: str = Form(...),
    gemini: GeminiService = Depends(get_gemini_service),
    db: FirestoreClient = Depends(get_db),
):
    raw_foods = await gemini.extract_food_from_text(text)
    if not raw_foods:
        raise HTTPException(status_code=400, detail="Could not parse any food items from text")

    foods = []
    for item in raw_foods:
        food = await _lookup_or_estimate(
            item.get("name", "unknown"),
            float(item.get("quantity", 100)),
            item.get("unit", "g"),
            gemini,
            db,
        )
        foods.append(food)

    return _compute_totals(foods)

@router.post("/analyze-image", response_model=ParsedFoodResponse)
async def analyze_image(
    file: UploadFile = File(...),
    gemini: GeminiService = Depends(get_gemini_service),
    db: FirestoreClient = Depends(get_db),
):
    contents = await file.read()
    image_base64 = base64.b64encode(contents).decode("utf-8")

    raw_foods = await gemini.analyze_food_image(image_base64)
    if not raw_foods:
        raise HTTPException(status_code=400, detail="Could not identify any food items in image")

    foods = []
    for item in raw_foods:
        food = await _lookup_or_estimate(
            item.get("name", "unknown"),
            float(item.get("quantity", 100)),
            item.get("unit", "g"),
            gemini,
            db,
        )
        foods.append(food)

    return _compute_totals(foods)

@router.post("/analyze-voice", response_model=ParsedFoodResponse)
async def analyze_voice(
    file: UploadFile = File(...),
    gemini: GeminiService = Depends(get_gemini_service),
    db: FirestoreClient = Depends(get_db),
):
    contents = await file.read()
    suffix = ".ogg"
    if file.filename:
        _, ext = os.path.splitext(file.filename)
        if ext:
            suffix = ext

    with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as tmp:
        tmp.write(contents)
        tmp_path = tmp.name

    try:
        audio_base64 = base64.b64encode(contents).decode("utf-8")
        prompt = f"""
Transcribe this audio and extract food items from it.
Return ONLY valid JSON array, no markdown.
Format: [{{"name": "rice", "quantity": 200, "unit": "g"}}]
Units can be: g, ml, piece, cup, tbsp, tsp, slice, bowl
"""
        audio_data = {"mime_type": f"audio/{suffix[1:] if suffix.startswith('.') else suffix}", "data": audio_base64}
        response = gemini.model.generate_content([prompt, audio_data])
        raw_foods = gemini._parse_json_list(response.text)
    finally:
        os.unlink(tmp_path)

    if not raw_foods:
        raise HTTPException(status_code=400, detail="Could not parse any food items from voice input")

    foods = []
    for item in raw_foods:
        food = await _lookup_or_estimate(
            item.get("name", "unknown"),
            float(item.get("quantity", 100)),
            item.get("unit", "g"),
            gemini,
            db,
        )
        foods.append(food)

    return _compute_totals(foods)
