// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_food_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealFoodItemModelImpl _$$MealFoodItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MealFoodItemModelImpl(
      foodItem:
          FoodItemModel.fromJson(json['foodItem'] as Map<String, dynamic>),
      quantityG: (json['quantityG'] as num).toDouble(),
    );

Map<String, dynamic> _$$MealFoodItemModelImplToJson(
        _$MealFoodItemModelImpl instance) =>
    <String, dynamic>{
      'foodItem': instance.foodItem,
      'quantityG': instance.quantityG,
    };
