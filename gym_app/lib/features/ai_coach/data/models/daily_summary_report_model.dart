import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/ai_advice.dart';

extension DailySummaryReportModel on DailySummaryReport {
  Map<String, dynamic> toFirestore() {
    return {
      'date': date.toIso8601String(),
      'caloriesConsumed': caloriesConsumed,
      'caloriesTarget': caloriesTarget,
      'proteinConsumed': proteinConsumed,
      'proteinTarget': proteinTarget,
      'carbsConsumed': carbsConsumed,
      'carbsTarget': carbsTarget,
      'fatConsumed': fatConsumed,
      'fatTarget': fatTarget,
      'waterMl': waterMl,
      'waterTargetMl': waterTargetMl,
      'workoutCompleted': workoutCompleted,
      'streakDays': streakDays,
      'aiAdvice': aiAdvice,
    };
  }

  static DailySummaryReport fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DailySummaryReport(
      date: DateTime.parse(data['date'] as String),
      caloriesConsumed: data['caloriesConsumed'] as int? ?? 0,
      caloriesTarget: data['caloriesTarget'] as int? ?? 0,
      proteinConsumed: data['proteinConsumed'] as int? ?? 0,
      proteinTarget: data['proteinTarget'] as int? ?? 0,
      carbsConsumed: data['carbsConsumed'] as int? ?? 0,
      carbsTarget: data['carbsTarget'] as int? ?? 0,
      fatConsumed: data['fatConsumed'] as int? ?? 0,
      fatTarget: data['fatTarget'] as int? ?? 0,
      waterMl: data['waterMl'] as int? ?? 0,
      waterTargetMl: data['waterTargetMl'] as int? ?? 0,
      workoutCompleted: data['workoutCompleted'] as bool? ?? false,
      streakDays: data['streakDays'] as int? ?? 0,
      aiAdvice: data['aiAdvice'] as String? ?? '',
    );
  }
}
