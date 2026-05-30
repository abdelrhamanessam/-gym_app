import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_prediction.freezed.dart';
part 'goal_prediction.g.dart';

@freezed
class GoalPrediction with _$GoalPrediction {
  const factory GoalPrediction({
    required double currentWeight,
    required double goalWeight,
    required DateTime targetDate,
    required DateTime estimatedCompletionDate,
    required double progressPercent,
    @Default(0) int dailyCalorieTarget,
    @Default(0) int weeksRemaining,
  }) = _GoalPrediction;

  factory GoalPrediction.fromJson(Map<String, dynamic> json) =>
      _$GoalPredictionFromJson(json);
}
