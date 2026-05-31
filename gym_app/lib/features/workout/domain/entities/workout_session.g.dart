// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSessionImpl _$$WorkoutSessionImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSessionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => WorkoutSetGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalVolumeKg: (json['totalVolumeKg'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WorkoutSessionImplToJson(
        _$WorkoutSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'name': instance.name,
      'durationMinutes': instance.durationMinutes,
      'exercises': instance.exercises,
      'totalVolumeKg': instance.totalVolumeKg,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt.toIso8601String(),
    };
