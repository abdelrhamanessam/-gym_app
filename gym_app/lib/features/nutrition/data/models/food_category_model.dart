import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_category_model.freezed.dart';
part 'food_category_model.g.dart';

@freezed
class FoodCategoryModel with _$FoodCategoryModel {
  const factory FoodCategoryModel({
    required String categoryId,
    required String nameEn,
    required String nameAr,
    String? icon,
    @Default([]) List<String> subcategories,
  }) = _FoodCategoryModel;

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryModelFromJson(json);

  factory FoodCategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'categoryId': doc.id, ...data};
    return FoodCategoryModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('categoryId');
    return json;
  }
}
