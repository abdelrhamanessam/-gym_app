import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/workout_session.dart';
import 'workout_set_group_model.dart';

part 'workout_session_model.freezed.dart';
part 'workout_session_model.g.dart';

@freezed
class WorkoutSessionModel with _$WorkoutSessionModel {
  const factory WorkoutSessionModel({
    required String id,
    required String userId,
    required String date,
    required String name,
    @Default(0) int durationMinutes,
    @Default([]) List<WorkoutSetGroupModel> exercises,
    @Default(0.0) double totalVolumeKg,
    String? notes,
    @Default(false) bool isCompleted,
    required String createdAt,
  }) = _WorkoutSessionModel;

  factory WorkoutSessionModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionModelFromJson(json);

  factory WorkoutSessionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WorkoutSessionModel.fromJson({...data, 'id': doc.id});
  }

  factory WorkoutSessionModel.fromDomain(WorkoutSession session) =>
      WorkoutSessionModel(
        id: session.id,
        userId: session.userId,
        date: session.date.toIso8601String(),
        name: session.name,
        durationMinutes: session.durationMinutes,
        exercises: session.exercises
            .map((e) => WorkoutSetGroupModel.fromDomain(e))
            .toList(),
        totalVolumeKg: session.totalVolumeKg,
        notes: session.notes,
        isCompleted: session.isCompleted,
        createdAt: session.createdAt.toIso8601String(),
      );
}

extension WorkoutSessionModelX on WorkoutSessionModel {
  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  WorkoutSession toDomain() => WorkoutSession(
        id: id,
        userId: userId,
        date: DateTime.parse(date),
        name: name,
        durationMinutes: durationMinutes,
        exercises: exercises.map((e) => e.toDomain()).toList(),
        totalVolumeKg: totalVolumeKg,
        notes: notes,
        isCompleted: isCompleted,
        createdAt: DateTime.parse(createdAt),
      );
}
