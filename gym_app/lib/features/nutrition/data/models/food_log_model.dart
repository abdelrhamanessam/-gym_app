import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gym_app/core/utils/timestamp_converter.dart';
import 'food_item_model.dart';

part 'food_log_model.freezed.dart';
part 'food_log_model.g.dart';

@freezed
class FoodLogModel with _$FoodLogModel {
  const factory FoodLogModel({
    required String logId,
    required String userId,
    required FoodItemModel foodItem,
    required double quantityG,
    required String mealType,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) required Timestamp date,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) required Timestamp createdAt,
  }) = _FoodLogModel;

  factory FoodLogModel.fromJson(Map<String, dynamic> json) =>
      _$FoodLogModelFromJson(json);

  factory FoodLogModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'logId': doc.id, ...data};
    return FoodLogModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('logId');
    return json;
  }
}
