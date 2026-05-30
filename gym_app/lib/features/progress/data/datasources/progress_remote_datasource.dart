import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/constants/firebase_constants.dart';
import '../models/body_goal_model.dart';
import '../models/body_measurement_model.dart';
import '../models/progress_photo_model.dart';

part 'progress_remote_datasource.g.dart';

class ProgressRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProgressRemoteDataSource(this._firestore);

  CollectionReference<Map<String, dynamic>> get _measurements =>
      _firestore.collection(FirebaseConstants.measurementsCollection);

  CollectionReference<Map<String, dynamic>> get _goals =>
      _firestore.collection(FirebaseConstants.goalsCollection);

  CollectionReference<Map<String, dynamic>> get _photos =>
      _firestore.collection('progressPhotos');

  Future<List<BodyMeasurementModel>> getMeasurements(
      String userId, {int? limit}) async {
    Query query = _measurements
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true);
    if (limit != null) {
      query = query.limit(limit);
    }
    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => BodyMeasurementModel.fromFirestore(doc))
        .toList();
  }

  Future<void> addMeasurement(BodyMeasurementModel measurement) async {
    await _measurements.doc(measurement.id).set(measurement.toFirestore());
  }

  Future<BodyMeasurementModel?> getLatestMeasurement(String userId) async {
    final snapshot = await _measurements
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) return null;
    return BodyMeasurementModel.fromFirestore(snapshot.docs.first);
  }

  Future<List<BodyGoalModel>> getBodyGoals(String userId) async {
    final snapshot = await _goals
        .where('userId', isEqualTo: userId)
        .orderBy('startDate', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => BodyGoalModel.fromFirestore(doc))
        .toList();
  }

  Future<void> saveBodyGoal(BodyGoalModel goal) async {
    await _goals.doc(goal.id).set(goal.toFirestore());
  }

  Future<List<ProgressPhotoModel>> getProgressPhotos(String userId) async {
    final snapshot = await _photos
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => ProgressPhotoModel.fromFirestore(doc))
        .toList();
  }

  Future<void> addProgressPhoto(ProgressPhotoModel photo) async {
    await _photos.doc(photo.id).set(photo.toFirestore());
  }

  Future<void> deleteProgressPhoto(String id) async {
    await _photos.doc(id).delete();
  }
}

@riverpod
ProgressRemoteDataSource progressRemoteDataSource(
    ProgressRemoteDataSourceRef ref) {
  return ProgressRemoteDataSource(FirebaseFirestore.instance);
}
