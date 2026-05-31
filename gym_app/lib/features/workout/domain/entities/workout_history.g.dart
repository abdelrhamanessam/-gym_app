// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutHistoryImpl _$$WorkoutHistoryImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutHistoryImpl(
      id: json['id'] as String,
      workoutSessionId: json['workoutSessionId'] as String,
      date: DateTime.parse(json['date'] as String),
      exerciseName: json['exerciseName'] as String,
      muscleGroup: $enumDecode(_$MuscleGroupEnumMap, json['muscleGroup']),
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeKg: (json['volumeKg'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WorkoutHistoryImplToJson(
        _$WorkoutHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workoutSessionId': instance.workoutSessionId,
      'date': instance.date.toIso8601String(),
      'exerciseName': instance.exerciseName,
      'muscleGroup': _$MuscleGroupEnumMap[instance.muscleGroup]!,
      'sets': instance.sets,
      'volumeKg': instance.volumeKg,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$MuscleGroupEnumMap = {
  MuscleGroup.chest: 'chest',
  MuscleGroup.back: 'back',
  MuscleGroup.shoulders: 'shoulders',
  MuscleGroup.biceps: 'biceps',
  MuscleGroup.triceps: 'triceps',
  MuscleGroup.legs: 'legs',
  MuscleGroup.abs: 'abs',
  MuscleGroup.cardio: 'cardio',
};
