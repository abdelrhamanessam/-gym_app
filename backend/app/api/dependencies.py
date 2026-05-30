from fastapi import Request, HTTPException, status
from app.core.database import get_firestore_client, get_firebase_auth, verify_firebase_token
from app.services.gemini_service import GeminiService
from google.cloud.firestore import Client as FirestoreClient

_gemini_service_instance = None

def get_gemini_service() -> GeminiService:
    global _gemini_service_instance
    if _gemini_service_instance is None:
        _gemini_service_instance = GeminiService()
    return _gemini_service_instance

async def get_db() -> FirestoreClient:
    return get_firestore_client()

async def get_current_user(request: Request) -> dict:
    auth_header = request.headers.get("Authorization")
    if not auth_header or not auth_header.startswith("Bearer "):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Missing or invalid Authorization header",
        )
    token = auth_header.split(" ", 1)[1]
    decoded = verify_firebase_token(token)
    return decoded

async def get_current_admin(request: Request) -> dict:
    auth_header = request.headers.get("Authorization")
    if not auth_header or not auth_header.startswith("Bearer "):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Missing or invalid Authorization header",
        )
    token = auth_header.split(" ", 1)[1]
    try:
        decoded = get_firebase_auth().verify_id_token(token)
        claims = decoded.get("custom_claims", {}) or {}
        if not claims.get("admin", False):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Admin privileges required",
            )
        return decoded
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=f"Invalid token: {str(e)}",
        )
