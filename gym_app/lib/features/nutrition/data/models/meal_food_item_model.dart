import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_item_model.dart';

part 'meal_food_item_model.freezed.dart';
part 'meal_food_item_model.g.dart';

@freezed
class MealFoodItemModel with _$MealFoodItemModel {
  const factory MealFoodItemModel({
    required FoodItemModel foodItem,
    required double quantityG,
  }) = _MealFoodItemModel;

  factory MealFoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$MealFoodItemModelFromJson(json);
}
