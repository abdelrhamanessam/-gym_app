import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_template.dart';
import 'template_exercise_model.dart';

part 'workout_template_model.freezed.dart';
part 'workout_template_model.g.dart';

@freezed
class WorkoutTemplateModel with _$WorkoutTemplateModel {
  const factory WorkoutTemplateModel({
    required String id,
    required String userId,
    required String name,
    String? description,
    @Default('intermediate') String difficulty,
    String? goal,
    @Default([]) List<TemplateExerciseModel> exercises,
    @Default(45) int estimatedDuration,
    required String createdAt,
  }) = _WorkoutTemplateModel;

  factory WorkoutTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutTemplateModelFromJson(json);

  factory WorkoutTemplateModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WorkoutTemplateModel.fromJson({...data, 'id': doc.id});
  }

  factory WorkoutTemplateModel.fromDomain(WorkoutTemplate template) =>
      WorkoutTemplateModel(
        id: template.id,
        userId: template.userId,
        name: template.name,
        description: template.description,
        difficulty: template.difficulty.name,
        goal: template.goal?.name,
        exercises: template.exercises
            .map((e) => TemplateExerciseModel.fromDomain(e))
            .toList(),
        estimatedDuration: template.estimatedDuration,
        createdAt: template.createdAt.toIso8601String(),
      );
}

extension WorkoutTemplateModelX on WorkoutTemplateModel {
  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  WorkoutTemplate toDomain() => WorkoutTemplate(
        id: id,
        userId: userId,
        name: name,
        description: description,
        difficulty: Difficulty.values.byName(difficulty),
        goal: goal != null ? Goal.values.byName(goal!) : null,
        exercises: exercises.map((e) => e.toDomain()).toList(),
        estimatedDuration: estimatedDuration,
        createdAt: DateTime.parse(createdAt),
      );
}
