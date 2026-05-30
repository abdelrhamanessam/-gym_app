import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_goals_model.freezed.dart';
part 'nutrition_goals_model.g.dart';

@freezed
class NutritionGoalsModel with _$NutritionGoalsModel {
  const factory NutritionGoalsModel({
    required int dailyCalories,
    required int dailyProtein,
    required int dailyCarbs,
    required int dailyFat,
    required double dailyWaterMl,
  }) = _NutritionGoalsModel;

  factory NutritionGoalsModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionGoalsModelFromJson(json);
}
