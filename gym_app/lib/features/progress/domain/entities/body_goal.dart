import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_goal.freezed.dart';
part 'body_goal.g.dart';

enum GoalType {
  fatLoss,
  muscleGain,
  maintain,
}

@freezed
class BodyGoal with _$BodyGoal {
  const factory BodyGoal({
    required String id,
    required String userId,
    double? targetWeightKg,
    double? targetBodyFatPercent,
    required double startWeightKg,
    required DateTime startDate,
    DateTime? targetDate,
    required GoalType goal,
  }) = _BodyGoal;

  factory BodyGoal.fromJson(Map<String, dynamic> json) =>
      _$BodyGoalFromJson(json);
}
