import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_set_group.dart';

part 'workout_session.freezed.dart';
part 'workout_session.g.dart';

@freezed
class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required String id,
    required String userId,
    required DateTime date,
    required String name,
    @Default(0) int durationMinutes,
    @Default([]) List<WorkoutSetGroup> exercises,
    @Default(0.0) double totalVolumeKg,
    String? notes,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
  }) = _WorkoutSession;

  factory WorkoutSession.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionFromJson(json);
}
