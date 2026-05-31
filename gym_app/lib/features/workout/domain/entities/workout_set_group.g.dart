// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetGroupImpl _$$WorkoutSetGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutSetGroupImpl(
      exerciseId: json['exerciseId'] as String,
      exerciseName: json['exerciseName'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$$WorkoutSetGroupImplToJson(
        _$WorkoutSetGroupImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exerciseName': instance.exerciseName,
      'sets': instance.sets,
      'restSeconds': instance.restSeconds,
    };
