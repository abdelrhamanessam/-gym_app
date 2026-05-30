import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_exercise.freezed.dart';
part 'template_exercise.g.dart';

@freezed
class TemplateExercise with _$TemplateExercise {
  const factory TemplateExercise({
    required String exerciseId,
    required String exerciseName,
    @Default(3) int targetSets,
    @Default(10) int targetReps,
    @Default(60) int restSeconds,
    required int order,
  }) = _TemplateExercise;

  factory TemplateExercise.fromJson(Map<String, dynamic> json) =>
      _$TemplateExerciseFromJson(json);
}
