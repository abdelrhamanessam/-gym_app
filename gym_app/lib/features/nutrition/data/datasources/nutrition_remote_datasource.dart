import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/core/constants/firebase_constants.dart';

class NutritionRemoteDataSource {
  final FirebaseFirestore _firestore;

  NutritionRemoteDataSource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> searchFoods(String query) async {
    final snapshot = await _firestore
        .collection(FirebaseConstants.foodDatabaseCollection)
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .limit(50)
        .get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<Map<String, dynamic>?> getFoodByBarcode(String barcode) async {
    final snapshot = await _firestore
        .collection(FirebaseConstants.foodDatabaseCollection)
        .where('barcode', isEqualTo: barcode)
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    return {'id': doc.id, ...doc.data()};
  }

  Future<Map<String, dynamic>?> getFoodById(String id) async {
    final doc =
        await _firestore.collection(FirebaseConstants.foodDatabaseCollection).doc(id).get();
    if (!doc.exists) return null;
    return {'id': doc.id, ...doc.data()!};
  }

  Future<void> addCustomFood(Map<String, dynamic> data) {
    return _firestore
        .collection(FirebaseConstants.foodDatabaseCollection)
        .doc(data['id'])
        .set(data);
  }

  Future<void> logMeal(Map<String, dynamic> data) {
    return _firestore
        .collection(FirebaseConstants.mealsCollection)
        .doc(data['id'])
        .set(data);
  }

  Future<List<Map<String, dynamic>>> getMealsForDate(
      String userId, DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(hours: 24));
    final snapshot = await _firestore
        .collection(FirebaseConstants.mealsCollection)
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .orderBy('date', descending: false)
        .get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<void> logWater(Map<String, dynamic> data) {
    return _firestore
        .collection(FirebaseConstants.waterLogsCollection)
        .doc(data['id'])
        .set(data);
  }

  Future<List<Map<String, dynamic>>> getWaterLogsForDate(
      String userId, DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(hours: 24));
    final snapshot = await _firestore
        .collection(FirebaseConstants.waterLogsCollection)
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<Map<String, dynamic>?> getDailySummary(
      String userId, DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final snapshot = await _firestore
        .collection(FirebaseConstants.dailySummariesCollection)
        .where('userId', isEqualTo: userId)
        .where('date', isEqualTo: Timestamp.fromDate(start))
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    return {'id': doc.id, ...doc.data()};
  }

  Future<void> saveDailySummary(Map<String, dynamic> data) {
    return _firestore
        .collection(FirebaseConstants.dailySummariesCollection)
        .doc(data['id'])
        .set(data, SetOptions(merge: true));
  }

  Future<List<Map<String, dynamic>>> getMealTemplates(String userId) async {
    final snapshot = await _firestore
        .collection(FirebaseConstants.mealTemplatesCollection)
        .where('userId', isEqualTo: userId)
        .get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<void> saveMealTemplate(Map<String, dynamic> data) {
    return _firestore
        .collection(FirebaseConstants.mealTemplatesCollection)
        .doc(data['id'])
        .set(data);
  }

  Future<List<Map<String, dynamic>>> getFoodCategories() async {
    final snapshot = await _firestore
        .collection(FirebaseConstants.foodCategoriesCollection)
        .get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (!doc.exists) return null;
    return {'id': doc.id, ...doc.data()!};
  }
}
