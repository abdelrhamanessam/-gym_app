// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_goals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionGoalsImpl _$$NutritionGoalsImplFromJson(Map<String, dynamic> json) =>
    _$NutritionGoalsImpl(
      dailyCalories: (json['dailyCalories'] as num).toInt(),
      dailyProtein: (json['dailyProtein'] as num).toInt(),
      dailyCarbs: (json['dailyCarbs'] as num).toInt(),
      dailyFat: (json['dailyFat'] as num).toInt(),
      dailyWaterMl: (json['dailyWaterMl'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutritionGoalsImplToJson(
        _$NutritionGoalsImpl instance) =>
    <String, dynamic>{
      'dailyCalories': instance.dailyCalories,
      'dailyProtein': instance.dailyProtein,
      'dailyCarbs': instance.dailyCarbs,
      'dailyFat': instance.dailyFat,
      'dailyWaterMl': instance.dailyWaterMl,
    };
