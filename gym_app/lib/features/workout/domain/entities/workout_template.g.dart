// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutTemplateImpl _$$WorkoutTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutTemplateImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      difficulty:
          $enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']) ??
              Difficulty.intermediate,
      goal: $enumDecodeNullable(_$GoalEnumMap, json['goal']),
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => TemplateExercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      estimatedDuration: (json['estimatedDuration'] as num?)?.toInt() ?? 45,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WorkoutTemplateImplToJson(
        _$WorkoutTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'goal': _$GoalEnumMap[instance.goal],
      'exercises': instance.exercises,
      'estimatedDuration': instance.estimatedDuration,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'beginner',
  Difficulty.intermediate: 'intermediate',
  Difficulty.advanced: 'advanced',
};

const _$GoalEnumMap = {
  Goal.muscleGain: 'muscleGain',
  Goal.fatLoss: 'fatLoss',
  Goal.strength: 'strength',
  Goal.endurance: 'endurance',
};
