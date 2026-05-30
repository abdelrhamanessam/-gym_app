import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_item.dart';

part 'food_log.freezed.dart';
part 'food_log.g.dart';

@freezed
class FoodLog with _$FoodLog {
  const factory FoodLog({
    required String id,
    required String userId,
    required FoodItem foodItem,
    required double quantityG,
    required String mealType,
    required DateTime date,
    required DateTime createdAt,
  }) = _FoodLog;

  factory FoodLog.fromJson(Map<String, dynamic> json) =>
      _$FoodLogFromJson(json);
}
