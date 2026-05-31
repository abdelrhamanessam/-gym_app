// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutTemplateModelImpl _$$WorkoutTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutTemplateModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String? ?? 'intermediate',
      goal: json['goal'] as String?,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) =>
                  TemplateExerciseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      estimatedDuration: (json['estimatedDuration'] as num?)?.toInt() ?? 45,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$WorkoutTemplateModelImplToJson(
        _$WorkoutTemplateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'goal': instance.goal,
      'exercises': instance.exercises,
      'estimatedDuration': instance.estimatedDuration,
      'createdAt': instance.createdAt,
    };
