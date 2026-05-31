// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyGoalImpl _$$BodyGoalImplFromJson(Map<String, dynamic> json) =>
    _$BodyGoalImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      targetWeightKg: (json['targetWeightKg'] as num?)?.toDouble(),
      targetBodyFatPercent: (json['targetBodyFatPercent'] as num?)?.toDouble(),
      startWeightKg: (json['startWeightKg'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      targetDate: json['targetDate'] == null
          ? null
          : DateTime.parse(json['targetDate'] as String),
      goal: $enumDecode(_$GoalTypeEnumMap, json['goal']),
    );

Map<String, dynamic> _$$BodyGoalImplToJson(_$BodyGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetWeightKg': instance.targetWeightKg,
      'targetBodyFatPercent': instance.targetBodyFatPercent,
      'startWeightKg': instance.startWeightKg,
      'startDate': instance.startDate.toIso8601String(),
      'targetDate': instance.targetDate?.toIso8601String(),
      'goal': _$GoalTypeEnumMap[instance.goal]!,
    };

const _$GoalTypeEnumMap = {
  GoalType.fatLoss: 'fatLoss',
  GoalType.muscleGain: 'muscleGain',
  GoalType.maintain: 'maintain',
};
