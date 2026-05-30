import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/exercise.dart';
import 'template_exercise.dart';

part 'workout_template.freezed.dart';
part 'workout_template.g.dart';

@freezed
class WorkoutTemplate with _$WorkoutTemplate {
  const factory WorkoutTemplate({
    required String id,
    required String userId,
    required String name,
    String? description,
    @Default(Difficulty.intermediate) Difficulty difficulty,
    Goal? goal,
    @Default([]) List<TemplateExercise> exercises,
    @Default(45) int estimatedDuration,
    required DateTime createdAt,
  }) = _WorkoutTemplate;

  factory WorkoutTemplate.fromJson(Map<String, dynamic> json) =>
      _$WorkoutTemplateFromJson(json);
}

enum Goal {
  muscleGain,
  fatLoss,
  strength,
  endurance,
}
