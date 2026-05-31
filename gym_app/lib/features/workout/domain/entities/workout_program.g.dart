// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutProgramImpl _$$WorkoutProgramImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutProgramImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      difficulty:
          $enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']) ??
              Difficulty.intermediate,
      goal: $enumDecodeNullable(_$GoalEnumMap, json['goal']) ?? Goal.muscleGain,
      durationWeeks: (json['durationWeeks'] as num?)?.toInt() ?? 4,
      sessionsPerWeek: (json['sessionsPerWeek'] as num?)?.toInt() ?? 4,
      templates: (json['templates'] as List<dynamic>?)
              ?.map((e) => WorkoutTemplate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isBuiltIn: json['isBuiltIn'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WorkoutProgramImplToJson(
        _$WorkoutProgramImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'goal': _$GoalEnumMap[instance.goal]!,
      'durationWeeks': instance.durationWeeks,
      'sessionsPerWeek': instance.sessionsPerWeek,
      'templates': instance.templates,
      'isBuiltIn': instance.isBuiltIn,
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
