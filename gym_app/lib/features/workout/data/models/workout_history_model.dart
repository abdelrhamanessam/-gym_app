import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_history.dart';
import 'workout_set_model.dart';

part 'workout_history_model.freezed.dart';
part 'workout_history_model.g.dart';

@freezed
class WorkoutHistoryModel with _$WorkoutHistoryModel {
  const factory WorkoutHistoryModel({
    required String id,
    required String workoutSessionId,
    required String date,
    required String exerciseName,
    required String muscleGroup,
    required List<WorkoutSetModel> sets,
    @Default(0.0) double volumeKg,
    required String createdAt,
  }) = _WorkoutHistoryModel;

  factory WorkoutHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutHistoryModelFromJson(json);

  factory WorkoutHistoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WorkoutHistoryModel.fromJson({...data, 'id': doc.id});
  }

  factory WorkoutHistoryModel.fromDomain(WorkoutHistory history) =>
      WorkoutHistoryModel(
        id: history.id,
        workoutSessionId: history.workoutSessionId,
        date: history.date.toIso8601String(),
        exerciseName: history.exerciseName,
        muscleGroup: history.muscleGroup.name,
        sets: history.sets.map((s) => WorkoutSetModel.fromDomain(s)).toList(),
        volumeKg: history.volumeKg,
        createdAt: history.createdAt.toIso8601String(),
      );
}

extension WorkoutHistoryModelX on WorkoutHistoryModel {
  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  WorkoutHistory toDomain() => WorkoutHistory(
        id: id,
        workoutSessionId: workoutSessionId,
        date: DateTime.parse(date),
        exerciseName: exerciseName,
        muscleGroup: MuscleGroup.values.byName(muscleGroup),
        sets: sets.map((s) => s.toDomain()).toList(),
        volumeKg: volumeKg,
        createdAt: DateTime.parse(createdAt),
      );
}
