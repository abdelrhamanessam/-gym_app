import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

enum FoodSource {
  @JsonValue('usda')
  usda,
  @JsonValue('openfoodfacts')
  openfoodfacts,
  @JsonValue('egyptian')
  egyptian,
  @JsonValue('custom')
  custom,
  @JsonValue('ai')
  ai,
}

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String id,
    required String name,
    String? brand,
    String? category,
    required double servingSizeG,
    required double calories,
    required double proteinG,
    required double carbsG,
    required double fatG,
    @Default(0) double fiberG,
    @Default(0) double sugarG,
    String? barcode,
    @Default(FoodSource.custom) FoodSource source,
    String? imageUrl,
    @Default(false) bool verified,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}
