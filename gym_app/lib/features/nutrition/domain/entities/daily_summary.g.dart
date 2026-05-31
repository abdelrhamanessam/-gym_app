// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailySummaryImpl _$$DailySummaryImplFromJson(Map<String, dynamic> json) =>
    _$DailySummaryImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
      totalProtein: (json['totalProtein'] as num?)?.toDouble() ?? 0,
      totalCarbs: (json['totalCarbs'] as num?)?.toDouble() ?? 0,
      totalFat: (json['totalFat'] as num?)?.toDouble() ?? 0,
      totalWaterMl: (json['totalWaterMl'] as num?)?.toDouble() ?? 0,
      workoutCompleted: json['workoutCompleted'] as bool? ?? false,
      aiReport: json['aiReport'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DailySummaryImplToJson(_$DailySummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'totalCalories': instance.totalCalories,
      'totalProtein': instance.totalProtein,
      'totalCarbs': instance.totalCarbs,
      'totalFat': instance.totalFat,
      'totalWaterMl': instance.totalWaterMl,
      'workoutCompleted': instance.workoutCompleted,
      'aiReport': instance.aiReport,
      'createdAt': instance.createdAt.toIso8601String(),
    };
