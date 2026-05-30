import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_template.freezed.dart';
part 'meal_template.g.dart';

@freezed
class MealTemplate with _$MealTemplate {
  const factory MealTemplate({
    required String id,
    required String userId,
    required String name,
    required String mealType,
    @Default([]) List<MealTemplateFood> foods,
    @Default(0) double totalCalories,
    required DateTime createdAt,
  }) = _MealTemplate;

  factory MealTemplate.fromJson(Map<String, dynamic> json) =>
      _$MealTemplateFromJson(json);
}

@freezed
class MealTemplateFood with _$MealTemplateFood {
  const factory MealTemplateFood({
    required String foodId,
    required String foodName,
    required double quantityG,
  }) = _MealTemplateFood;

  factory MealTemplateFood.fromJson(Map<String, dynamic> json) =>
      _$MealTemplateFoodFromJson(json);
}
