from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.database import initialize_firebase
from app.api.v1.endpoints import health, ai_food, ai_coach, admin

app = FastAPI(
    title="Gym AI Backend",
    description="Backend for Gym AI application with AI-powered food analysis, coaching, and admin operations",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health.router, prefix="/api", tags=["Health"])
app.include_router(ai_food.router, prefix="/api/v1", tags=["AI Food Analysis"])
app.include_router(ai_coach.router, prefix="/api/v1", tags=["AI Coach"])
app.include_router(admin.router, prefix="/api/v1", tags=["Admin"])

@app.on_event("startup")
async def startup():
    initialize_firebase()

@app.get("/")
async def root():
    return {
        "name": "Gym AI Backend",
        "version": "1.0.0",
        "docs": "/docs",
        "health": "/api/health",
    }
