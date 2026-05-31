import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/template_exercise.dart';

part 'template_exercise_model.freezed.dart';
part 'template_exercise_model.g.dart';

@freezed
class TemplateExerciseModel with _$TemplateExerciseModel {
  const factory TemplateExerciseModel({
    required String exerciseId,
    required String exerciseName,
    @Default(3) int targetSets,
    @Default(10) int targetReps,
    @Default(60) int restSeconds,
    required int order,
  }) = _TemplateExerciseModel;

  factory TemplateExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateExerciseModelFromJson(json);

  factory TemplateExerciseModel.fromDomain(TemplateExercise exercise) =>
      TemplateExerciseModel(
        exerciseId: exercise.exerciseId,
        exerciseName: exercise.exerciseName,
        targetSets: exercise.targetSets,
        targetReps: exercise.targetReps,
        restSeconds: exercise.restSeconds,
        order: exercise.order,
      );

}

extension TemplateExerciseModelX on TemplateExerciseModel {
  TemplateExercise toDomain() => TemplateExercise(
        exerciseId: exerciseId,
        exerciseName: exerciseName,
        targetSets: targetSets,
        targetReps: targetReps,
        restSeconds: restSeconds,
        order: order,
      );
}
