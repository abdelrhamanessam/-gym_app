// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyGoalModelImpl _$$BodyGoalModelImplFromJson(Map<String, dynamic> json) =>
    _$BodyGoalModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      targetWeightKg: (json['targetWeightKg'] as num?)?.toDouble(),
      targetBodyFatPercent: (json['targetBodyFatPercent'] as num?)?.toDouble(),
      startWeightKg: (json['startWeightKg'] as num).toDouble(),
      startDate: json['startDate'] as String,
      targetDate: json['targetDate'] as String?,
      goal: json['goal'] as String,
    );

Map<String, dynamic> _$$BodyGoalModelImplToJson(_$BodyGoalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetWeightKg': instance.targetWeightKg,
      'targetBodyFatPercent': instance.targetBodyFatPercent,
      'startWeightKg': instance.startWeightKg,
      'startDate': instance.startDate,
      'targetDate': instance.targetDate,
      'goal': instance.goal,
    };
