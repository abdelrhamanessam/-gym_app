import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_set.dart';

part 'workout_set_group.freezed.dart';
part 'workout_set_group.g.dart';

@freezed
class WorkoutSetGroup with _$WorkoutSetGroup {
  const factory WorkoutSetGroup({
    required String exerciseId,
    required String exerciseName,
    required List<WorkoutSet> sets,
    @Default(60) int restSeconds,
  }) = _WorkoutSetGroup;

  factory WorkoutSetGroup.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetGroupFromJson(json);
}
