// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetGroupModelImpl _$$WorkoutSetGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutSetGroupModelImpl(
      exerciseId: json['exerciseId'] as String,
      exerciseName: json['exerciseName'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$$WorkoutSetGroupModelImplToJson(
        _$WorkoutSetGroupModelImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exerciseName': instance.exerciseName,
      'sets': instance.sets,
      'restSeconds': instance.restSeconds,
    };
