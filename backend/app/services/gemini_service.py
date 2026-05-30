import json
import re
import google.generativeai as genai
from app.core.config import settings
from app.schemas.food import NutritionAdviceRequest, FitnessAdviceRequest, DailyReportRequest

class GeminiService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel(settings.GEMINI_MODEL)

    async def extract_food_from_text(self, text: str) -> list[dict]:
        prompt = f"""
Extract food items from this text. Return ONLY valid JSON array, no markdown, no code fences.
Text: "{text}"
Format: [{{"name": "rice", "quantity": 200, "unit": "g"}}]
Units can be: g, ml, piece, cup, tbsp, tsp, slice, bowl, oz, lb, serving
"""
        response = self.model.generate_content(prompt)
        return self._parse_json_list(response.text)

    async def analyze_food_image(self, image_base64: str) -> list[dict]:
        image_data = {"mime_type": "image/jpeg", "data": image_base64}
        prompt = """
Identify all food items in this image and estimate their quantities.
Return ONLY valid JSON array, no markdown, no code fences.
Format: [{"name": "chicken breast", "quantity": 200, "unit": "g"}]
Units can be: g, ml, piece, cup, tbsp, tsp, slice, bowl
"""
        response = self.model.generate_content([prompt, image_data])
        return self._parse_json_list(response.text)

    async def estimate_nutrition(self, food_name: str, quantity: float, unit: str) -> dict:
        prompt = f"""
Estimate nutrition for {quantity} {unit} of {food_name}.
Return ONLY valid JSON, no markdown, no code fences.
Format: {{"calories": 250, "protein_g": 25, "carbs_g": 0, "fat_g": 15}}
Use reasonable estimates for standard portions.
"""
        response = self.model.generate_content(prompt)
        return self._parse_json_dict(response.text)

    async def get_nutrition_advice(self, data: NutritionAdviceRequest) -> str:
        prompt = f"""
As an AI nutrition coach, analyze this daily nutrition data and give concise, actionable advice (2-3 sentences):

Calories: {data.daily_calories}/{data.calorie_target}
Protein: {data.daily_protein}/{data.protein_target}g
Carbs: {data.daily_carbs}/{data.carbs_target}g
Fat: {data.daily_fat}/{data.fat_target}g

Meals summary: {data.meals}

Focus on what to improve tomorrow. Be specific and encouraging.
"""
        response = self.model.generate_content(prompt)
        return response.text

    async def get_fitness_advice(self, data: FitnessAdviceRequest) -> str:
        prompt = f"""
As an AI fitness coach, analyze this weekly workout data and give advice (2-3 sentences):

Workouts this week: {data.workouts_last_week}
Current weight: {data.current_weight}kg
Goal: {data.goal}
Weekly training volume: {data.weekly_volume}kg

Give specific advice on training intensity, recovery, or progression.
"""
        response = self.model.generate_content(prompt)
        return response.text

    async def generate_daily_report(self, data: DailyReportRequest) -> str:
        prompt = f"""
Generate a friendly daily fitness report and advice (3-4 sentences).

Today's stats:
- Calories: {data.calories_consumed}/{data.calorie_target}
- Protein: {data.protein_consumed}/{data.protein_target}g
- Carbs: {data.carbs_consumed}/{data.carbs_target}g
- Fat: {data.fat_consumed}/{data.fat_target}g
- Water: {data.water_consumed}/{data.water_target}L
- Workout: {"Completed: " + data.workout_name if data.workout_completed else "Not completed"}
- Streak: {data.streak_days} days

Start with "Great job!" or "Good effort!" based on how well they did vs targets.
Include one specific tip for tomorrow.
"""
        response = self.model.generate_content(prompt)
        return response.text

    def _parse_json_list(self, text: str) -> list[dict]:
        cleaned = re.sub(r'```(?:json)?\s*', '', text).strip()
        cleaned = cleaned.strip()
        if cleaned.startswith("["):
            cleaned = cleaned[:cleaned.rindex("]") + 1]
        elif cleaned.startswith("{"):
            cleaned = "[" + cleaned + "]"
        try:
            result = json.loads(cleaned)
            if isinstance(result, dict):
                return [result]
            return result if isinstance(result, list) else []
        except json.JSONDecodeError:
            return []

    def _parse_json_dict(self, text: str) -> dict:
        cleaned = re.sub(r'```(?:json)?\s*', '', text).strip()
        cleaned = cleaned.strip()
        start = cleaned.find("{")
        end = cleaned.rfind("}")
        if start != -1 and end != -1:
            cleaned = cleaned[start:end+1]
        try:
            result = json.loads(cleaned)
            return result if isinstance(result, dict) else {}
        except json.JSONDecodeError:
            return {}
