import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
class FoodItemModel with _$FoodItemModel {
  const factory FoodItemModel({
    required String foodId,
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
    @Default('custom') String source,
    String? imageUrl,
    @Default(false) bool verified,
  }) = _FoodItemModel;

  factory FoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$FoodItemModelFromJson(json);

  factory FoodItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'foodId': doc.id, ...data};
    return FoodItemModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('foodId');
    return json;
  }
}
