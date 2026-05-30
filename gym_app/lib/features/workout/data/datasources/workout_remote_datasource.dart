import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import '../../../core/constants/firebase_constants.dart';
import '../models/exercise_model.dart';
import '../models/workout_history_model.dart';
import '../models/workout_program_model.dart';
import '../models/workout_session_model.dart';
import '../models/workout_template_model.dart';

part 'workout_remote_datasource.g.dart';

class WorkoutRemoteDataSource {
  final FirebaseFirestore _firestore;

  WorkoutRemoteDataSource(this._firestore);

  CollectionReference<Map<String, dynamic>> get _exercises =>
      _firestore.collection(FirebaseConstants.exercisesCollection);

  CollectionReference<Map<String, dynamic>> get _sessions =>
      _firestore.collection(FirebaseConstants.workoutsCollection);

  CollectionReference<Map<String, dynamic>> get _templates =>
      _firestore.collection(FirebaseConstants.templatesCollection);

  CollectionReference<Map<String, dynamic>> get _programs =>
      _firestore.collection('workoutPrograms');

  CollectionReference<Map<String, dynamic>> get _history =>
      _firestore.collection('workoutHistory');

  Future<List<ExerciseModel>> getExercises({MuscleGroup? muscleGroup}) async {
    Query query = _exercises;
    if (muscleGroup != null) {
      query = query.where('muscleGroup', isEqualTo: muscleGroup.name);
    }
    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => ExerciseModel.fromFirestore(doc))
        .toList();
  }

  Future<ExerciseModel?> getExerciseById(String id) async {
    final doc = await _exercises.doc(id).get();
    if (!doc.exists) return null;
    return ExerciseModel.fromFirestore(doc);
  }

  Future<void> saveWorkoutSession(WorkoutSessionModel session) async {
    await _sessions.doc(session.id).set(session.toFirestore());
  }

  Future<List<WorkoutSessionModel>> getWorkoutSessions(
    String userId, {
    DateTime? date,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    Query query = _sessions.where('userId', isEqualTo: userId);
    if (date != null) {
      final start = DateTime(date.year, date.month, date.day);
      final end = start.add(const Duration(days: 1));
      query = query
          .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
          .where('date', isLessThan: end.toIso8601String());
    } else if (startDate != null) {
      query = query.where('date',
          isGreaterThanOrEqualTo: startDate.toIso8601String());
      if (endDate != null) {
        query =
            query.where('date', isLessThanOrEqualTo: endDate.toIso8601String());
      }
    }
    query = query.orderBy('date', descending: true);
    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => WorkoutSessionModel.fromFirestore(doc))
        .toList();
  }

  Future<WorkoutSessionModel?> getWorkoutSessionById(String id) async {
    final doc = await _sessions.doc(id).get();
    if (!doc.exists) return null;
    return WorkoutSessionModel.fromFirestore(doc);
  }

  Future<void> deleteWorkoutSession(String id) async {
    await _sessions.doc(id).delete();
  }

  Future<void> saveWorkoutTemplate(WorkoutTemplateModel template) async {
    await _templates.doc(template.id).set(template.toFirestore());
  }

  Future<List<WorkoutTemplateModel>> getWorkoutTemplates(
      String userId) async {
    final snapshot = await _templates
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => WorkoutTemplateModel.fromFirestore(doc))
        .toList();
  }

  Future<void> deleteWorkoutTemplate(String id) async {
    await _templates.doc(id).delete();
  }

  Future<List<WorkoutProgramModel>> getBuiltInPrograms() async {
    final snapshot = await _programs
        .where('isBuiltIn', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => WorkoutProgramModel.fromFirestore(doc))
        .toList();
  }

  Future<void> saveCustomProgram(WorkoutProgramModel program) async {
    await _programs.doc(program.id).set(program.toFirestore());
  }

  Future<List<WorkoutHistoryModel>> getWorkoutHistory(
    String userId, {
    MuscleGroup? muscleGroup,
    int? limit,
  }) async {
    Query query = _history.where('userId', isEqualTo: userId);
    if (muscleGroup != null) {
      query = query.where('muscleGroup', isEqualTo: muscleGroup.name);
    }
    query = query.orderBy('date', descending: true);
    if (limit != null) {
      query = query.limit(limit);
    }
    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => WorkoutHistoryModel.fromFirestore(doc))
        .toList();
  }
}

@riverpod
WorkoutRemoteDataSource workoutRemoteDataSource(
    WorkoutRemoteDataSourceRef ref) {
  return WorkoutRemoteDataSource(FirebaseFirestore.instance);
}
