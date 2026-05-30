import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_item.dart';

part 'meal_food_item.freezed.dart';
part 'meal_food_item.g.dart';

@freezed
class MealFoodItem with _$MealFoodItem {
  const MealFoodItem._();

  const factory MealFoodItem({
    required FoodItem foodItem,
    required double quantityG,
  }) = _MealFoodItem;

  double get calculatedCalories =>
      (foodItem.calories / foodItem.servingSizeG) * quantityG;

  double get calculatedProtein =>
      (foodItem.proteinG / foodItem.servingSizeG) * quantityG;

  double get calculatedCarbs =>
      (foodItem.carbsG / foodItem.servingSizeG) * quantityG;

  double get calculatedFat =>
      (foodItem.fatG / foodItem.servingSizeG) * quantityG;

  factory MealFoodItem.fromJson(Map<String, dynamic> json) =>
      _$MealFoodItemFromJson(json);
}
