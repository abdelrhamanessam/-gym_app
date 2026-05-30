import 'package:freezed_annotation/freezed_annotation.dart';
import 'meal_food_item.dart';

part 'meal_entry.freezed.dart';
part 'meal_entry.g.dart';

enum MealType {
  @JsonValue('breakfast')
  breakfast,
  @JsonValue('lunch')
  lunch,
  @JsonValue('dinner')
  dinner,
  @JsonValue('snack')
  snack,
}

@freezed
class MealEntry with _$MealEntry {
  const factory MealEntry({
    required String id,
    required String userId,
    required DateTime date,
    required MealType mealType,
    @Default([]) List<MealFoodItem> foods,
    @Default(0) double totalCalories,
    @Default(0) double totalProtein,
    @Default(0) double totalCarbs,
    @Default(0) double totalFat,
    String? imageUrl,
    String? notes,
    required DateTime createdAt,
  }) = _MealEntry;

  factory MealEntry.fromJson(Map<String, dynamic> json) =>
      _$MealEntryFromJson(json);
}
