// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealTemplateImpl _$$MealTemplateImplFromJson(Map<String, dynamic> json) =>
    _$MealTemplateImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      mealType: json['mealType'] as String,
      foods: (json['foods'] as List<dynamic>?)
              ?.map((e) => MealTemplateFood.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MealTemplateImplToJson(_$MealTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'mealType': instance.mealType,
      'foods': instance.foods,
      'totalCalories': instance.totalCalories,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$MealTemplateFoodImpl _$$MealTemplateFoodImplFromJson(
        Map<String, dynamic> json) =>
    _$MealTemplateFoodImpl(
      foodId: json['foodId'] as String,
      foodName: json['foodName'] as String,
      quantityG: (json['quantityG'] as num).toDouble(),
    );

Map<String, dynamic> _$$MealTemplateFoodImplToJson(
        _$MealTemplateFoodImpl instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'quantityG': instance.quantityG,
    };
