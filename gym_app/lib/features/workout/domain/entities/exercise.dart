import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

enum MuscleGroup {
  chest,
  back,
  shoulders,
  biceps,
  triceps,
  legs,
  abs,
  cardio,
}

enum Difficulty {
  beginner,
  intermediate,
  advanced,
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required MuscleGroup muscleGroup,
    @Default([]) List<String> instructions,
    @Default([]) List<String> commonMistakes,
    required Difficulty difficulty,
    String? imageUrl,
    @Default([]) List<String> equipment,
    @Default(false) bool isCardio,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
