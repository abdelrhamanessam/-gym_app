// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiAdviceImpl _$$AiAdviceImplFromJson(Map<String, dynamic> json) =>
    _$AiAdviceImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$AdviceTypeEnumMap, json['type']),
      title: json['title'] as String,
      message: json['message'] as String,
      actionItems: (json['actionItems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AiAdviceImplToJson(_$AiAdviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'type': _$AdviceTypeEnumMap[instance.type]!,
      'title': instance.title,
      'message': instance.message,
      'actionItems': instance.actionItems,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$AdviceTypeEnumMap = {
  AdviceType.nutrition: 'nutrition',
  AdviceType.fitness: 'fitness',
  AdviceType.general: 'general',
};

_$DailySummaryReportImpl _$$DailySummaryReportImplFromJson(
        Map<String, dynamic> json) =>
    _$DailySummaryReportImpl(
      date: DateTime.parse(json['date'] as String),
      caloriesConsumed: (json['caloriesConsumed'] as num?)?.toInt() ?? 0,
      caloriesTarget: (json['caloriesTarget'] as num?)?.toInt() ?? 0,
      proteinConsumed: (json['proteinConsumed'] as num?)?.toInt() ?? 0,
      proteinTarget: (json['proteinTarget'] as num?)?.toInt() ?? 0,
      carbsConsumed: (json['carbsConsumed'] as num?)?.toInt() ?? 0,
      carbsTarget: (json['carbsTarget'] as num?)?.toInt() ?? 0,
      fatConsumed: (json['fatConsumed'] as num?)?.toInt() ?? 0,
      fatTarget: (json['fatTarget'] as num?)?.toInt() ?? 0,
      waterMl: (json['waterMl'] as num?)?.toInt() ?? 0,
      waterTargetMl: (json['waterTargetMl'] as num?)?.toInt() ?? 0,
      workoutCompleted: json['workoutCompleted'] as bool? ?? false,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      aiAdvice: json['aiAdvice'] as String,
    );

Map<String, dynamic> _$$DailySummaryReportImplToJson(
        _$DailySummaryReportImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'caloriesConsumed': instance.caloriesConsumed,
      'caloriesTarget': instance.caloriesTarget,
      'proteinConsumed': instance.proteinConsumed,
      'proteinTarget': instance.proteinTarget,
      'carbsConsumed': instance.carbsConsumed,
      'carbsTarget': instance.carbsTarget,
      'fatConsumed': instance.fatConsumed,
      'fatTarget': instance.fatTarget,
      'waterMl': instance.waterMl,
      'waterTargetMl': instance.waterTargetMl,
      'workoutCompleted': instance.workoutCompleted,
      'streakDays': instance.streakDays,
      'aiAdvice': instance.aiAdvice,
    };
