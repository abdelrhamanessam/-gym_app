// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailySummaryModelImpl _$$DailySummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailySummaryModelImpl(
      summaryId: json['summaryId'] as String,
      userId: json['userId'] as String,
      date: timestampFromJson(json['date']),
      totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
      totalProtein: (json['totalProtein'] as num?)?.toDouble() ?? 0,
      totalCarbs: (json['totalCarbs'] as num?)?.toDouble() ?? 0,
      totalFat: (json['totalFat'] as num?)?.toDouble() ?? 0,
      totalWaterMl: (json['totalWaterMl'] as num?)?.toDouble() ?? 0,
      workoutCompleted: json['workoutCompleted'] as bool? ?? false,
      aiReport: json['aiReport'] as String?,
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$DailySummaryModelImplToJson(
        _$DailySummaryModelImpl instance) =>
    <String, dynamic>{
      'summaryId': instance.summaryId,
      'userId': instance.userId,
      'date': timestampToJson(instance.date),
      'totalCalories': instance.totalCalories,
      'totalProtein': instance.totalProtein,
      'totalCarbs': instance.totalCarbs,
      'totalFat': instance.totalFat,
      'totalWaterMl': instance.totalWaterMl,
      'workoutCompleted': instance.workoutCompleted,
      'aiReport': instance.aiReport,
      'createdAt': timestampToJson(instance.createdAt),
    };
