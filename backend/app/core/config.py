import os
from dotenv import load_dotenv

load_dotenv()

class Settings:
    GEMINI_API_KEY: str = os.getenv("GEMINI_API_KEY", "")
    FIREBASE_SERVICE_ACCOUNT_PATH: str = os.getenv("FIREBASE_SERVICE_ACCOUNT_PATH", "./serviceAccountKey.json")
    BACKEND_SECRET_KEY: str = os.getenv("BACKEND_SECRET_KEY", "default-secret-key-change-in-production")
    GEMINI_MODEL: str = os.getenv("GEMINI_MODEL", "gemini-1.5-flash")
    ADMIN_UID: str = os.getenv("ADMIN_UID", "")
    PROJECT_NAME: str = "Gym AI Backend"
    API_V1_PREFIX: str = "/api/v1"
    FIREBASE_DATABASE_URL: str = os.getenv("FIREBASE_DATABASE_URL", "")

settings = Settings()
