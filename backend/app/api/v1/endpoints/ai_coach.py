from fastapi import APIRouter, Depends
from app.schemas.food import NutritionAdviceRequest, FitnessAdviceRequest, DailyReportRequest
from app.api.dependencies import get_gemini_service
from app.services.gemini_service import GeminiService

router = APIRouter(prefix="/ai/coach", tags=["AI Coach"])

@router.post("/nutrition")
async def nutrition_advice(
    data: NutritionAdviceRequest,
    gemini: GeminiService = Depends(get_gemini_service),
):
    advice = await gemini.get_nutrition_advice(data)
    return {"advice": advice}

@router.post("/fitness")
async def fitness_advice(
    data: FitnessAdviceRequest,
    gemini: GeminiService = Depends(get_gemini_service),
):
    advice = await gemini.get_fitness_advice(data)
    return {"advice": advice}

@router.post("/daily-report")
async def daily_report(
    data: DailyReportRequest,
    gemini: GeminiService = Depends(get_gemini_service),
):
    report = await gemini.generate_daily_report(data)
    return {"report": report}
