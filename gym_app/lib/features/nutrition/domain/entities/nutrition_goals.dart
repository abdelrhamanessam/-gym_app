import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_goals.freezed.dart';
part 'nutrition_goals.g.dart';

@freezed
class NutritionGoals with _$NutritionGoals {
  const factory NutritionGoals({
    required int dailyCalories,
    required int dailyProtein,
    required int dailyCarbs,
    required int dailyFat,
    required double dailyWaterMl,
  }) = _NutritionGoals;

  factory NutritionGoals.fromJson(Map<String, dynamic> json) =>
      _$NutritionGoalsFromJson(json);
}
