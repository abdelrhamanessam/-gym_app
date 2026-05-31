// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutProgramModelImpl _$$WorkoutProgramModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutProgramModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String? ?? 'intermediate',
      goal: json['goal'] as String? ?? 'muscleGain',
      durationWeeks: (json['durationWeeks'] as num?)?.toInt() ?? 4,
      sessionsPerWeek: (json['sessionsPerWeek'] as num?)?.toInt() ?? 4,
      templates: (json['templates'] as List<dynamic>?)
              ?.map((e) =>
                  WorkoutTemplateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isBuiltIn: json['isBuiltIn'] as bool? ?? false,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$WorkoutProgramModelImplToJson(
        _$WorkoutProgramModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'goal': instance.goal,
      'durationWeeks': instance.durationWeeks,
      'sessionsPerWeek': instance.sessionsPerWeek,
      'templates': instance.templates,
      'isBuiltIn': instance.isBuiltIn,
      'createdAt': instance.createdAt,
    };
