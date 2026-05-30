import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise.dart';
import 'workout_set.dart';

part 'workout_history.freezed.dart';
part 'workout_history.g.dart';

@freezed
class WorkoutHistory with _$WorkoutHistory {
  const factory WorkoutHistory({
    required String id,
    required String workoutSessionId,
    required DateTime date,
    required String exerciseName,
    required MuscleGroup muscleGroup,
    required List<WorkoutSet> sets,
    @Default(0.0) double volumeKg,
    required DateTime createdAt,
  }) = _WorkoutHistory;

  factory WorkoutHistory.fromJson(Map<String, dynamic> json) =>
      _$WorkoutHistoryFromJson(json);
}
