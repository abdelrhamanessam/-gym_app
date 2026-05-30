import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_log_model.freezed.dart';
part 'water_log_model.g.dart';

@freezed
class WaterLogModel with _$WaterLogModel {
  const factory WaterLogModel({
    required String waterId,
    required String userId,
    required Timestamp date,
    @Default(250) double amountMl,
    required Timestamp createdAt,
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
