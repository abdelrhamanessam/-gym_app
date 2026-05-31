// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterLogImpl _$$WaterLogImplFromJson(Map<String, dynamic> json) =>
    _$WaterLogImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      amountMl: (json['amountMl'] as num?)?.toDouble() ?? 250,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WaterLogImplToJson(_$WaterLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'amountMl': instance.amountMl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
