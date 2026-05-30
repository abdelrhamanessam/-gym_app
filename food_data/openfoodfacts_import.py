"""
Fetches common food products from OpenFoodFacts API.
Saves to openfoodfacts_products.json for review, then can be imported via seed_firestore.py
"""
import requests
import json
import time

CATEGORIES = [
    'snacks', 'beverages', 'dairy', 'bread', 'meat', 'cereals',
    'sauces', 'desserts', 'fruits', 'vegetables', 'pasta', 'rice'
]


def fetch_products(category, page=1, limit=100):
    url = f"https://world.openfoodfacts.org/category/{category}/{page}.json"
    params = {
        'fields': 'product_name,brands,code,nutriments,serving_size,image_url',
        'page_size': limit
    }
    resp = requests.get(url, params=params)
    if resp.status_code == 200:
        return resp.json().get('products', [])
    return []


def main():
    all_products = []
    for cat in CATEGORIES:
        print(f"Fetching {cat}...")
        products = fetch_products(cat, page=1, limit=50)
        for p in products:
            nut = p.get('nutriments', {})
            all_products.append({
                'name': p.get('product_name', 'Unknown'),
                'brand': p.get('brands', ''),
                'barcode': p.get('code', ''),
                'category': cat,
                'servingSizeG': nut.get('serving_quantity', 100) or 100,
                'calories': nut.get('energy-kcal_100g', 0) or 0,
                'proteinG': nut.get('proteins_100g', 0) or 0,
                'carbsG': nut.get('carbohydrates_100g', 0) or 0,
                'fatG': nut.get('fat_100g', 0) or 0,
                'fiberG': nut.get('fiber_100g', 0) or 0,
                'sugarG': nut.get('sugars_100g', 0) or 0,
                'source': 'openfoodfacts',
                'imageUrl': p.get('image_url', ''),
                'searchKeywords': [p.get('product_name', '').lower()]
            })
        time.sleep(0.5)

    with open('openfoodfacts_products.json', 'w', encoding='utf-8') as f:
        json.dump(all_products, f, indent=2, ensure_ascii=False)
    print(f"Saved {len(all_products)} products")


if __name__ == '__main__':
    main()
