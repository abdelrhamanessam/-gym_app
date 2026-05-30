import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'meal_food_item_model.dart';

part 'meal_entry_model.freezed.dart';
part 'meal_entry_model.g.dart';

@freezed
class MealEntryModel with _$MealEntryModel {
  const factory MealEntryModel({
    required String mealId,
    required String userId,
    required Timestamp date,
    required String mealType,
    @Default([]) List<MealFoodItemModel> foods,
    @Default(0) double totalCalories,
    @Default(0) double totalProtein,
    @Default(0) double totalCarbs,
    @Default(0) double totalFat,
    String? imageUrl,
    String? notes,
    required Timestamp createdAt,
  }) = _MealEntryModel;

  factory MealEntryModel.fromJson(Map<String, dynamic> json) =>
      _$MealEntryModelFromJson(json);

  factory MealEntryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'mealId': doc.id, ...data};
    return MealEntryModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('mealId');
    return json;
  }
}
