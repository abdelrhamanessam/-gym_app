import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_category.freezed.dart';
part 'food_category.g.dart';

@freezed
class FoodCategory with _$FoodCategory {
  const factory FoodCategory({
    required String id,
    required String nameEn,
    required String nameAr,
    String? icon,
    @Default([]) List<String> subcategories,
  }) = _FoodCategory;

  factory FoodCategory.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryFromJson(json);
}
