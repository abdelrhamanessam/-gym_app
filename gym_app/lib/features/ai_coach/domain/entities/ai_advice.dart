import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_advice.freezed.dart';
part 'ai_advice.g.dart';

enum AdviceType {
  @JsonValue('nutrition')
  nutrition,
  @JsonValue('fitness')
  fitness,
  @JsonValue('general')
  general,
}

@freezed
class AiAdvice with _$AiAdvice {
  const factory AiAdvice({
    required String id,
    required String userId,
    required DateTime date,
    required AdviceType type,
    required String title,
    required String message,
    @Default([]) List<String> actionItems,
    required DateTime createdAt,
  }) = _AiAdvice;

  factory AiAdvice.fromJson(Map<String, dynamic> json) =>
      _$AiAdviceFromJson(json);
}

@freezed
class DailySummaryReport with _$DailySummaryReport {
  const factory DailySummaryReport({
    required DateTime date,
    @Default(0) int caloriesConsumed,
    @Default(0) int caloriesTarget,
    @Default(0) int proteinConsumed,
    @Default(0) int proteinTarget,
    @Default(0) int carbsConsumed,
    @Default(0) int carbsTarget,
    @Default(0) int fatConsumed,
    @Default(0) int fatTarget,
    @Default(0) int waterMl,
    @Default(0) int waterTargetMl,
    @Default(false) bool workoutCompleted,
    @Default(0) int streakDays,
    required String aiAdvice,
  }) = _DailySummaryReport;

  factory DailySummaryReport.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryReportFromJson(json);
}
