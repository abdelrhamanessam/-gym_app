import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/body_goal.dart';

part 'body_goal_model.freezed.dart';
part 'body_goal_model.g.dart';

@freezed
class BodyGoalModel with _$BodyGoalModel {
  const factory BodyGoalModel({
    required String id,
    required String userId,
    double? targetWeightKg,
    double? targetBodyFatPercent,
    required double startWeightKg,
    required String startDate,
    String? targetDate,
    required String goal,
  }) = _BodyGoalModel;

  factory BodyGoalModel.fromJson(Map<String, dynamic> json) =>
      _$BodyGoalModelFromJson(json);

  factory BodyGoalModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BodyGoalModel.fromJson({...data, 'id': doc.id});
  }

  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  factory BodyGoalModel.fromDomain(BodyGoal g) => BodyGoalModel(
        id: g.id,
        userId: g.userId,
        targetWeightKg: g.targetWeightKg,
        targetBodyFatPercent: g.targetBodyFatPercent,
        startWeightKg: g.startWeightKg,
        startDate: g.startDate.toIso8601String(),
        targetDate: g.targetDate?.toIso8601String(),
        goal: g.goal.name,
      );

  BodyGoal toDomain() => BodyGoal(
        id: id,
        userId: userId,
        targetWeightKg: targetWeightKg,
        targetBodyFatPercent: targetBodyFatPercent,
        startWeightKg: startWeightKg,
        startDate: DateTime.parse(startDate),
        targetDate: targetDate != null ? DateTime.parse(targetDate!) : null,
        goal: GoalType.values.byName(goal),
      );
}
