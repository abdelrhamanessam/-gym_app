// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyMeasurementImpl _$$BodyMeasurementImplFromJson(
        Map<String, dynamic> json) =>
    _$BodyMeasurementImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      weightKg: (json['weightKg'] as num).toDouble(),
      bodyFatPercent: (json['bodyFatPercent'] as num?)?.toDouble(),
      leanBodyMassKg: (json['leanBodyMassKg'] as num?)?.toDouble(),
      muscleMassKg: (json['muscleMassKg'] as num?)?.toDouble(),
      waistCm: (json['waistCm'] as num?)?.toDouble(),
      chestCm: (json['chestCm'] as num?)?.toDouble(),
      armCm: (json['armCm'] as num?)?.toDouble(),
      legCm: (json['legCm'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$BodyMeasurementImplToJson(
        _$BodyMeasurementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'weightKg': instance.weightKg,
      'bodyFatPercent': instance.bodyFatPercent,
      'leanBodyMassKg': instance.leanBodyMassKg,
      'muscleMassKg': instance.muscleMassKg,
      'waistCm': instance.waistCm,
      'chestCm': instance.chestCm,
      'armCm': instance.armCm,
      'legCm': instance.legCm,
      'notes': instance.notes,
    };
