import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gym_app/core/utils/timestamp_converter.dart';

part 'water_log_model.freezed.dart';
part 'water_log_model.g.dart';

@freezed
class WaterLogModel with _$WaterLogModel {
  const factory WaterLogModel({
    required String waterId,
    required String userId,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) required Timestamp date,
    @Default(250) double amountMl,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson) required Timestamp createdAt,
  }) = _WaterLogModel;

  factory WaterLogModel.fromJson(Map<String, dynamic> json) =>
      _$WaterLogModelFromJson(json);

  factory WaterLogModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'waterId': doc.id, ...data};
    return WaterLogModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('waterId');
    return json;
  }
}
