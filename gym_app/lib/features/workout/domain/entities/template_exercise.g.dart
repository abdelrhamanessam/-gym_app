// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateExerciseImpl _$$TemplateExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateExerciseImpl(
      exerciseId: json['exerciseId'] as String,
      exerciseName: json['exerciseName'] as String,
      targetSets: (json['targetSets'] as num?)?.toInt() ?? 3,
      targetReps: (json['targetReps'] as num?)?.toInt() ?? 10,
      restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 60,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$TemplateExerciseImplToJson(
        _$TemplateExerciseImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exerciseName': instance.exerciseName,
      'targetSets': instance.targetSets,
      'targetReps': instance.targetReps,
      'restSeconds': instance.restSeconds,
      'order': instance.order,
    };
