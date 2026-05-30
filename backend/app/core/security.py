from datetime import datetime, timedelta, timezone
from jose import JWTError, jwt
from app.core.config import settings

ALGORITHM = "HS256"

def create_admin_token(uid: str) -> str:
    expire = datetime.now(timezone.utc) + timedelta(hours=24)
    payload = {
        "uid": uid,
        "role": "admin",
        "exp": expire,
        "iat": datetime.now(timezone.utc),
    }
    return jwt.encode(payload, settings.BACKEND_SECRET_KEY, algorithm=ALGORITHM)

def verify_admin_token(token: str) -> dict | None:
    try:
        payload = jwt.decode(token, settings.BACKEND_SECRET_KEY, algorithms=[ALGORITHM])
        if payload.get("role") != "admin":
            return None
        return payload
    except JWTError:
        return None
