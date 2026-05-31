// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealTemplateModelImpl _$$MealTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MealTemplateModelImpl(
      templateId: json['templateId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      mealType: json['mealType'] as String,
      foods: (json['foods'] as List<dynamic>?)
              ?.map((e) =>
                  MealTemplateFoodModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$MealTemplateModelImplToJson(
        _$MealTemplateModelImpl instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'userId': instance.userId,
      'name': instance.name,
      'mealType': instance.mealType,
      'foods': instance.foods,
      'totalCalories': instance.totalCalories,
      'createdAt': timestampToJson(instance.createdAt),
    };

_$MealTemplateFoodModelImpl _$$MealTemplateFoodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MealTemplateFoodModelImpl(
      foodId: json['foodId'] as String,
      foodName: json['foodName'] as String,
      quantityG: (json['quantityG'] as num).toDouble(),
    );

Map<String, dynamic> _$$MealTemplateFoodModelImplToJson(
        _$MealTemplateFoodModelImpl instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'quantityG': instance.quantityG,
    };
