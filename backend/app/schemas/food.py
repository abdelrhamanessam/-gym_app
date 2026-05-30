from pydantic import BaseModel
from typing import Optional

class FoodItemSchema(BaseModel):
    name: str
    quantity: float
    unit: str
    calories: float = 0.0
    protein_g: float = 0.0
    carbs_g: float = 0.0
    fat_g: float = 0.0

class ParsedFoodResponse(BaseModel):
    foods: list[FoodItemSchema]
    total_calories: float
    total_protein: float
    total_carbs: float
    total_fat: float

class ImageAnalysisRequest(BaseModel):
    image_base64: str

class NutritionAdviceRequest(BaseModel):
    daily_calories: float
    daily_protein: float
    daily_carbs: float
    daily_fat: float
    calorie_target: float
    protein_target: float
    carbs_target: float
    fat_target: float
    meals: list[dict]

class FitnessAdviceRequest(BaseModel):
    workouts_last_week: list[dict]
    current_weight: float
    goal: str
    weekly_volume: float

class DailyReportRequest(BaseModel):
    date: str
    calories_consumed: float
    protein_consumed: float
    carbs_consumed: float
    fat_consumed: float
    water_consumed: float
    calorie_target: float
    protein_target: float
    carbs_target: float
    fat_target: float
    water_target: float
    workout_completed: bool
    workout_name: Optional[str] = None
    streak_days: int
