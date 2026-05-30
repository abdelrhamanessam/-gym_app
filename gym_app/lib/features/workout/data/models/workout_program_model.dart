import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/entities/workout_template.dart';
import 'workout_template_model.dart';

part 'workout_program_model.freezed.dart';
part 'workout_program_model.g.dart';

@freezed
class WorkoutProgramModel with _$WorkoutProgramModel {
  const factory WorkoutProgramModel({
    required String id,
    required String name,
    String? description,
    @Default('intermediate') String difficulty,
    @Default('muscleGain') String goal,
    @Default(4) int durationWeeks,
    @Default(4) int sessionsPerWeek,
    @Default([]) List<WorkoutTemplateModel> templates,
    @Default(false) bool isBuiltIn,
    required String createdAt,
  }) = _WorkoutProgramModel;

  factory WorkoutProgramModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutProgramModelFromJson(json);

  factory WorkoutProgramModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WorkoutProgramModel.fromJson({...data, 'id': doc.id});
  }

  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  factory WorkoutProgramModel.fromDomain(WorkoutProgram program) =>
      WorkoutProgramModel(
        id: program.id,
        name: program.name,
        description: program.description,
        difficulty: program.difficulty.name,
        goal: program.goal.name,
        durationWeeks: program.durationWeeks,
        sessionsPerWeek: program.sessionsPerWeek,
        templates: program.templates
            .map((t) => WorkoutTemplateModel.fromDomain(t))
            .toList(),
        isBuiltIn: program.isBuiltIn,
        createdAt: program.createdAt.toIso8601String(),
      );

  WorkoutProgram toDomain() => WorkoutProgram(
        id: id,
        name: name,
        description: description,
        difficulty: Difficulty.values.byName(difficulty),
        goal: Goal.values.byName(goal),
        durationWeeks: durationWeeks,
        sessionsPerWeek: sessionsPerWeek,
        templates: templates.map((t) => t.toDomain()).toList(),
        isBuiltIn: isBuiltIn,
        createdAt: DateTime.parse(createdAt),
      );
}
