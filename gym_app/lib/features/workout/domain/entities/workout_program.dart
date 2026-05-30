import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/exercise.dart';
import 'workout_template.dart';

part 'workout_program.freezed.dart';
part 'workout_program.g.dart';

@freezed
class WorkoutProgram with _$WorkoutProgram {
  const factory WorkoutProgram({
    required String id,
    required String name,
    String? description,
    @Default(Difficulty.intermediate) Difficulty difficulty,
    @Default(Goal.muscleGain) Goal goal,
    @Default(4) int durationWeeks,
    @Default(4) int sessionsPerWeek,
    @Default([]) List<WorkoutTemplate> templates,
    @Default(false) bool isBuiltIn,
    required DateTime createdAt,
  }) = _WorkoutProgram;

  factory WorkoutProgram.fromJson(Map<String, dynamic> json) =>
      _$WorkoutProgramFromJson(json);
}
