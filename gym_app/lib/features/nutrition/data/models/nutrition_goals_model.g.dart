// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_goals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionGoalsModelImpl _$$NutritionGoalsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutritionGoalsModelImpl(
      dailyCalories: (json['dailyCalories'] as num).toInt(),
      dailyProtein: (json['dailyProtein'] as num).toInt(),
      dailyCarbs: (json['dailyCarbs'] as num).toInt(),
      dailyFat: (json['dailyFat'] as num).toInt(),
      dailyWaterMl: (json['dailyWaterMl'] as num).toDouble(),
    );

Map<String, dynamic> _$$NutritionGoalsModelImplToJson(
        _$NutritionGoalsModelImpl instance) =>
    <String, dynamic>{
      'dailyCalories': instance.dailyCalories,
      'dailyProtein': instance.dailyProtein,
      'dailyCarbs': instance.dailyCarbs,
      'dailyFat': instance.dailyFat,
      'dailyWaterMl': instance.dailyWaterMl,
    };
