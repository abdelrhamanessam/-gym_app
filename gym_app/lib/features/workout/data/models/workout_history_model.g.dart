// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutHistoryModelImpl _$$WorkoutHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutHistoryModelImpl(
      id: json['id'] as String,
      workoutSessionId: json['workoutSessionId'] as String,
      date: json['date'] as String,
      exerciseName: json['exerciseName'] as String,
      muscleGroup: json['muscleGroup'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeKg: (json['volumeKg'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$WorkoutHistoryModelImplToJson(
        _$WorkoutHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workoutSessionId': instance.workoutSessionId,
      'date': instance.date,
      'exerciseName': instance.exerciseName,
      'muscleGroup': instance.muscleGroup,
      'sets': instance.sets,
      'volumeKg': instance.volumeKg,
      'createdAt': instance.createdAt,
    };
