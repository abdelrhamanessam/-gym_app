import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_summary_model.freezed.dart';
part 'daily_summary_model.g.dart';

@freezed
class DailySummaryModel with _$DailySummaryModel {
  const factory DailySummaryModel({
    required String summaryId,
    required String userId,
    required Timestamp date,
    @Default(0) double totalCalories,
    @Default(0) double totalProtein,
    @Default(0) double totalCarbs,
    @Default(0) double totalFat,
    @Default(0) double totalWaterMl,
    @Default(false) bool workoutCompleted,
    String? aiReport,
    required Timestamp createdAt,
  }) = _DailySummaryModel;

  factory DailySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryModelFromJson(json);

  factory DailySummaryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final map = {'summaryId': doc.id, ...data};
    return DailySummaryModel.fromJson(map);
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('summaryId');
    return json;
  }
}
