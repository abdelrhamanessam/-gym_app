import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_summary.freezed.dart';
part 'daily_summary.g.dart';

@freezed
class DailySummary with _$DailySummary {
  const factory DailySummary({
    required String id,
    required String userId,
    required DateTime date,
    @Default(0) double totalCalories,
    @Default(0) double totalProtein,
    @Default(0) double totalCarbs,
    @Default(0) double totalFat,
    @Default(0) double totalWaterMl,
    @Default(false) bool workoutCompleted,
    String? aiReport,
    required DateTime createdAt,
  }) = _DailySummary;

  factory DailySummary.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryFromJson(json);
}
