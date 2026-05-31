// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetModelImpl _$$WorkoutSetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutSetModelImpl(
      setNumber: (json['setNumber'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      weightKg: (json['weightKg'] as num).toDouble(),
      isWarmup: json['isWarmup'] as bool? ?? false,
      isDropset: json['isDropset'] as bool? ?? false,
      rpe: (json['rpe'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$WorkoutSetModelImplToJson(
        _$WorkoutSetModelImpl instance) =>
    <String, dynamic>{
      'setNumber': instance.setNumber,
      'reps': instance.reps,
      'weightKg': instance.weightKg,
      'isWarmup': instance.isWarmup,
      'isDropset': instance.isDropset,
      'rpe': instance.rpe,
      'notes': instance.notes,
    };
