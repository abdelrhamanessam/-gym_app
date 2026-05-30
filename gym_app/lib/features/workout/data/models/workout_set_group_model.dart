import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/workout_set_group.dart';
import 'workout_set_model.dart';

part 'workout_set_group_model.freezed.dart';
part 'workout_set_group_model.g.dart';

@freezed
class WorkoutSetGroupModel with _$WorkoutSetGroupModel {
  const factory WorkoutSetGroupModel({
    required String exerciseId,
    required String exerciseName,
    required List<WorkoutSetModel> sets,
    @Default(60) int restSeconds,
  }) = _WorkoutSetGroupModel;

  factory WorkoutSetGroupModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetGroupModelFromJson(json);

  factory WorkoutSetGroupModel.fromDomain(WorkoutSetGroup group) =>
      WorkoutSetGroupModel(
        exerciseId: group.exerciseId,
        exerciseName: group.exerciseName,
        sets: group.sets.map((s) => WorkoutSetModel.fromDomain(s)).toList(),
        restSeconds: group.restSeconds,
      );

  WorkoutSetGroup toDomain() => WorkoutSetGroup(
        exerciseId: exerciseId,
        exerciseName: exerciseName,
        sets: sets.map((s) => s.toDomain()).toList(),
        restSeconds: restSeconds,
      );
}
