import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_template_model.freezed.dart';
part 'meal_template_model.g.dart';

@freezed
class MealTemplateModel with _$MealTemplateModel {
  const factory MealTemplateModel({
    required String templateId,
    required String userId,
    required String name,
    required String mealType,
    @Default([]) List<MealTemplateFoodModel> foods,
    @Default(0) double totalCalories,
    required Timestamp createdAt,
  }) = _MealTemplateModel;

  factory MealTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$MealTemplateModelFromJson(json);

  factory MealTemplateModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'templateId': doc.id, ...data};
    return MealTemplateModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('templateId');
    return json;
  }
}

@freezed
class MealTemplateFoodModel with _$MealTemplateFoodModel {
  const factory MealTemplateFoodModel({
    required String foodId,
    required String foodName,
    required double quantityG,
  }) = _MealTemplateFoodModel;

  factory MealTemplateFoodModel.fromJson(Map<String, dynamic> json) =>
      _$MealTemplateFoodModelFromJson(json);
}
