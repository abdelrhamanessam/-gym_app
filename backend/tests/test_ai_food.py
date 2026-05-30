import pytest
from fastapi.testclient import TestClient
from app.main import app
from app.services.gemini_service import GeminiService
from app.api.dependencies import get_gemini_service

client = TestClient(app)

class MockGeminiService:
    async def extract_food_from_text(self, text: str) -> list[dict]:
        return [{"name": "rice", "quantity": 200, "unit": "g"}, {"name": "chicken breast", "quantity": 150, "unit": "g"}]

    async def analyze_food_image(self, image_base64: str) -> list[dict]:
        return [{"name": "apple", "quantity": 1, "unit": "piece"}]

    async def estimate_nutrition(self, food_name: str, quantity: float, unit: str) -> dict:
        nutrition_map = {
            "rice": {"calories": 260, "protein_g": 5, "carbs_g": 58, "fat_g": 0.4},
            "chicken breast": {"calories": 247, "protein_g": 46, "carbs_g": 0, "fat_g": 5.3},
            "apple": {"calories": 95, "protein_g": 0.5, "carbs_g": 25, "fat_g": 0.3},
        }
        return nutrition_map.get(food_name.lower(), {"calories": 100, "protein_g": 5, "carbs_g": 10, "fat_g": 3})

    async def get_nutrition_advice(self, data) -> str:
        return "Great progress today! Consider adding more protein to your breakfast."

    async def get_fitness_advice(self, data) -> str:
        return "Good work this week. Try increasing your training volume by 10%."

    async def generate_daily_report(self, data) -> str:
        return "Great job! You hit all your targets. Keep up the momentum tomorrow."

@pytest.fixture(autouse=True)
def override_dependencies():
    app.dependency_overrides[get_gemini_service] = lambda: MockGeminiService()
    yield
    app.dependency_overrides.clear()

class TestAnalyzeText:
    def test_valid_text_input(self):
        response = client.post("/api/v1/ai/food/analyze-text", data={"text": "I ate 200g of rice and 150g of chicken"})
        assert response.status_code == 200
        data = response.json()
        assert "foods" in data
        assert len(data["foods"]) == 2
        assert data["total_calories"] > 0
        assert data["total_protein"] > 0
        assert data["total_carbs"] > 0
        assert data["total_fat"] > 0

    def test_empty_text(self):
        response = client.post("/api/v1/ai/food/analyze-text", data={"text": ""})
        assert response.status_code == 200

    def test_missing_text_field(self):
        response = client.post("/api/v1/ai/food/analyze-text")
        assert response.status_code == 422

class TestAnalyzeImage:
    def test_with_image_upload(self):
        response = client.post("/api/v1/ai/food/analyze-image", files={"file": ("test.jpg", b"fake_image_data", "image/jpeg")})
        assert response.status_code == 200
        data = response.json()
        assert "foods" in data
        assert len(data["foods"]) > 0

    def test_without_file(self):
        response = client.post("/api/v1/ai/food/analyze-image")
        assert response.status_code == 422

class TestAnalyzeVoice:
    def test_with_audio_upload(self):
        response = client.post("/api/v1/ai/food/analyze-voice", files={"file": ("test.ogg", b"fake_audio_data", "audio/ogg")})
        assert response.status_code == 200
        data = response.json()
        assert "foods" in data

    def test_without_file(self):
        response = client.post("/api/v1/ai/food/analyze-voice")
        assert response.status_code == 422

class TestNutritionAdvice:
    def test_get_advice(self):
        payload = {
            "daily_calories": 1800,
            "daily_protein": 80,
            "daily_carbs": 200,
            "daily_fat": 50,
            "calorie_target": 2000,
            "protein_target": 120,
            "carbs_target": 220,
            "fat_target": 55,
            "meals": [{"name": "Lunch", "calories": 600}],
        }
        response = client.post("/api/v1/ai/coach/nutrition", json=payload)
        assert response.status_code == 200
        assert "advice" in response.json()

class TestFitnessAdvice:
    def test_get_advice(self):
        payload = {
            "workouts_last_week": [{"name": "Push Day", "volume": 5000}],
            "current_weight": 75,
            "goal": "build muscle",
            "weekly_volume": 15000,
        }
        response = client.post("/api/v1/ai/coach/fitness", json=payload)
        assert response.status_code == 200
        assert "advice" in response.json()

class TestDailyReport:
    def test_get_report(self):
        payload = {
            "date": "2026-05-30",
            "calories_consumed": 1900,
            "protein_consumed": 100,
            "carbs_consumed": 200,
            "fat_consumed": 55,
            "water_consumed": 2.0,
            "calorie_target": 2000,
            "protein_target": 120,
            "carbs_target": 220,
            "fat_target": 60,
            "water_target": 2.5,
            "workout_completed": True,
            "workout_name": "Upper Body",
            "streak_days": 5,
        }
        response = client.post("/api/v1/ai/coach/daily-report", json=payload)
        assert response.status_code == 200
        assert "report" in response.json()
