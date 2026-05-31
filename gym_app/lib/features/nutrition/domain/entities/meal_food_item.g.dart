// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealFoodItemImpl _$$MealFoodItemImplFromJson(Map<String, dynamic> json) =>
    _$MealFoodItemImpl(
      foodItem: FoodItem.fromJson(json['foodItem'] as Map<String, dynamic>),
      quantityG: (json['quantityG'] as num).toDouble(),
    );

Map<String, dynamic> _$$MealFoodItemImplToJson(_$MealFoodItemImpl instance) =>
    <String, dynamic>{
      'foodItem': instance.foodItem,
      'quantityG': instance.quantityG,
    };
