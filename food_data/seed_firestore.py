"""
Usage: python seed_firestore.py --project-id my-project --service-account ../backend/serviceAccountKey.json

Uploads food data to Firestore collections:
- foodDatabase/{barcode} (or auto-id for non-barcode items)
- foodCategories/{categoryId}
"""
import json
import argparse
import os
from google.cloud import firestore


def seed_food_database(db, foods, batch_size=500):
    """Upload food items in batches."""
    batch = db.batch()
    count = 0

    for food in foods:
        doc_ref = db.collection('foodDatabase').document()
        if food.get('barcode'):
            doc_ref = db.collection('foodDatabase').document(food['barcode'])
        batch.set(doc_ref, food)
        count += 1

        if count % batch_size == 0:
            batch.commit()
            batch = db.batch()

    if count % batch_size != 0:
        batch.commit()

    print(f"Seeded {count} food items")


def seed_categories(db, categories):
    """Upload food categories."""
    for cat in categories:
        db.collection('foodCategories').document(cat['id']).set(cat)
    print(f"Seeded {len(categories)} categories")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--project-id', required=True)
    parser.add_argument('--service-account', required=True)
    args = parser.parse_args()

    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = args.service_account
    db = firestore.Client(project=args.project_id)

    with open('egyptian_foods.json', encoding='utf-8') as f:
        egyptian_foods = json.load(f)
    with open('usda_common_foods.json', encoding='utf-8') as f:
        usda_foods = json.load(f)
    with open('food_categories.json', encoding='utf-8') as f:
        categories = json.load(f)

    seed_food_database(db, egyptian_foods + usda_foods)
    seed_categories(db, categories)
