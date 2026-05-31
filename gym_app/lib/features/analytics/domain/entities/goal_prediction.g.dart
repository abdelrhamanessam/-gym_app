// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalPredictionImpl _$$GoalPredictionImplFromJson(Map<String, dynamic> json) =>
    _$GoalPredictionImpl(
      currentWeight: (json['currentWeight'] as num).toDouble(),
      goalWeight: (json['goalWeight'] as num).toDouble(),
      targetDate: DateTime.parse(json['targetDate'] as String),
      estimatedCompletionDate:
          DateTime.parse(json['estimatedCompletionDate'] as String),
      progressPercent: (json['progressPercent'] as num).toDouble(),
      dailyCalorieTarget: (json['dailyCalorieTarget'] as num?)?.toInt() ?? 0,
      weeksRemaining: (json['weeksRemaining'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GoalPredictionImplToJson(
        _$GoalPredictionImpl instance) =>
    <String, dynamic>{
      'currentWeight': instance.currentWeight,
      'goalWeight': instance.goalWeight,
      'targetDate': instance.targetDate.toIso8601String(),
      'estimatedCompletionDate':
          instance.estimatedCompletionDate.toIso8601String(),
      'progressPercent': instance.progressPercent,
      'dailyCalorieTarget': instance.dailyCalorieTarget,
      'weeksRemaining': instance.weeksRemaining,
    };
