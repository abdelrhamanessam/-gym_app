from fastapi import APIRouter, Depends, HTTPException, Query
from typing import Optional
from app.api.dependencies import get_current_admin, get_db
from google.cloud.firestore import Client as FirestoreClient
from google.cloud.firestore_v1 import SERVER_TIMESTAMP

router = APIRouter(prefix="/admin", tags=["Admin"])

USERS_COLLECTION = "users"
FOOD_DB_COLLECTION = "foodDatabase"
MEALS_COLLECTION = "meals"

@router.get("/users")
async def list_users(
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
):
    users_ref = db.collection(USERS_COLLECTION)
    query = users_ref.limit(limit).offset(offset).stream()
    users = []
    for doc in query:
        data = doc.to_dict()
        data["uid"] = doc.id
        users.append(data)
    return {"users": users, "count": len(users)}

@router.get("/users/{uid}")
async def get_user(
    uid: str,
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    doc = db.collection(USERS_COLLECTION).document(uid).get()
    if not doc.exists:
        raise HTTPException(status_code=404, detail="User not found")
    data = doc.to_dict()
    data["uid"] = doc.id
    return data

@router.delete("/users/{uid}", status_code=204)
async def delete_user(
    uid: str,
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    doc_ref = db.collection(USERS_COLLECTION).document(uid)
    if not doc_ref.get().exists:
        raise HTTPException(status_code=404, detail="User not found")
    meal_docs = db.collection(MEALS_COLLECTION).where("userId", "==", uid).stream()
    for meal in meal_docs:
        meal.reference.delete()
    doc_ref.delete()

@router.get("/food-database")
async def list_foods(
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
    search: Optional[str] = Query(None),
):
    query = db.collection(FOOD_DB_COLLECTION)
    if search:
        query = query.where("nameLower", ">=", search.lower()).where("nameLower", "<=", search.lower() + "\uf8ff")
    query = query.limit(limit).offset(offset)
    foods = []
    for doc in query.stream():
        data = doc.to_dict()
        data["id"] = doc.id
        foods.append(data)
    return {"foods": foods, "count": len(foods)}

@router.post("/food-database", status_code=201)
async def add_food(
    food_data: dict,
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    if "name" not in food_data:
        raise HTTPException(status_code=400, detail="Field 'name' is required")
    food_data["nameLower"] = food_data["name"].lower().strip()
    doc_ref = db.collection(FOOD_DB_COLLECTION).document()
    doc_ref.set(food_data)
    food_data["id"] = doc_ref.id
    return food_data

@router.put("/food-database/{food_id}")
async def update_food(
    food_id: str,
    food_data: dict,
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    doc_ref = db.collection(FOOD_DB_COLLECTION).document(food_id)
    if not doc_ref.get().exists:
        raise HTTPException(status_code=404, detail="Food item not found")
    if "name" in food_data:
        food_data["nameLower"] = food_data["name"].lower().strip()
    doc_ref.update(food_data)
    food_data["id"] = food_id
    return food_data

@router.delete("/food-database/{food_id}", status_code=204)
async def delete_food(
    food_id: str,
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    doc_ref = db.collection(FOOD_DB_COLLECTION).document(food_id)
    if not doc_ref.get().exists:
        raise HTTPException(status_code=404, detail="Food item not found")
    doc_ref.delete()

@router.post("/notifications")
async def send_notification(
    notification_data: dict,
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    title = notification_data.get("title", "Gym AI Update")
    body = notification_data.get("body", "")
    target_users = notification_data.get("targetUsers", None)

    if not body:
        raise HTTPException(status_code=400, detail="Notification body is required")

    notifications_ref = db.collection("notifications")
    count = 0
    if target_users:
        for uid in target_users:
            notifications_ref.add({
                "userId": uid,
                "title": title,
                "body": body,
                "read": False,
                "createdAt": SERVER_TIMESTAMP,
            })
            count += 1
    else:
        users = db.collection(USERS_COLLECTION).stream()
        for user in users:
            notifications_ref.add({
                "userId": user.id,
                "title": title,
                "body": body,
                "read": False,
                "createdAt": SERVER_TIMESTAMP,
            })
            count += 1

    return {"message": f"Notification sent to {count} users", "count": count}

@router.get("/stats")
async def get_stats(
    admin: dict = Depends(get_current_admin),
    db: FirestoreClient = Depends(get_db),
):
    users_count = 0
    for _ in db.collection(USERS_COLLECTION).stream():
        users_count += 1

    meals_count = 0
    for _ in db.collection(MEALS_COLLECTION).stream():
        meals_count += 1

    foods_count = 0
    for _ in db.collection(FOOD_DB_COLLECTION).stream():
        foods_count += 1

    return {
        "totalUsers": users_count,
        "totalMealsLogged": meals_count,
        "totalFoodsInDatabase": foods_count,
    }
