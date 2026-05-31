// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSessionModelImpl _$$WorkoutSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutSessionModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: json['date'] as String,
      name: json['name'] as String,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) =>
                  WorkoutSetGroupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalVolumeKg: (json['totalVolumeKg'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$WorkoutSessionModelImplToJson(
        _$WorkoutSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date,
      'name': instance.name,
      'durationMinutes': instance.durationMinutes,
      'exercises': instance.exercises,
      'totalVolumeKg': instance.totalVolumeKg,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt,
    };
