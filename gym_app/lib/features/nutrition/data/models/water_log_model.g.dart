// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterLogModelImpl _$$WaterLogModelImplFromJson(Map<String, dynamic> json) =>
    _$WaterLogModelImpl(
      waterId: json['waterId'] as String,
      userId: json['userId'] as String,
      date: timestampFromJson(json['date']),
      amountMl: (json['amountMl'] as num?)?.toDouble() ?? 250,
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$WaterLogModelImplToJson(_$WaterLogModelImpl instance) =>
    <String, dynamic>{
      'waterId': instance.waterId,
      'userId': instance.userId,
      'date': timestampToJson(instance.date),
      'amountMl': instance.amountMl,
      'createdAt': timestampToJson(instance.createdAt),
    };
