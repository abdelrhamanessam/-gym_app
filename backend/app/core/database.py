import firebase_admin
from firebase_admin import credentials, firestore, auth
from app.core.config import settings
from fastapi import Request, HTTPException, status

_firebase_app = None
_firestore_client = None
_auth_client = None

def initialize_firebase():
    global _firebase_app, _firestore_client, _auth_client
    if _firebase_app is None:
        cred = credentials.Certificate(settings.FIREBASE_SERVICE_ACCOUNT_PATH)
        _firebase_app = firebase_admin.initialize_app(cred)
        _firestore_client = firestore.client()
        _auth_client = auth

def get_firestore_client():
    if _firestore_client is None:
        initialize_firebase()
    return _firestore_client

def get_firebase_auth():
    if _auth_client is None:
        initialize_firebase()
    return _auth_client

def verify_firebase_token(id_token: str) -> dict:
    try:
        decoded = get_firebase_auth().verify_id_token(id_token)
        return decoded
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=f"Invalid Firebase token: {str(e)}",
        )

def verify_admin(request: Request) -> bool:
    auth_header = request.headers.get("Authorization")
    if not auth_header or not auth_header.startswith("Bearer "):
        return False
    token = auth_header.split(" ", 1)[1]
    try:
        decoded = get_firebase_auth().verify_id_token(token)
        claims = decoded.get("custom_claims", {}) or {}
        return claims.get("admin", False) or decoded.get("admin", False)
    except Exception:
        return False
