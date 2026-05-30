import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/firebase_constants.dart';
import '../../domain/entities/goal_prediction.dart';

part 'analytics_providers.g.dart';

enum ChartPeriod { daily, weekly, monthly, yearly }

@riverpod
class WeightChartData extends _$WeightChartData {
  @override
  Future<List<FlSpot>> build(ChartPeriod period) async {
    final data = await _fetchData(
      FirebaseConstants.bodyMetricsCollection,
      'weightKg',
      period,
    );
    return data;
  }

  Future<List<FlSpot>> _fetchData(
    String collection,
    String field,
    ChartPeriod period,
  ) async {
    final now = DateTime.now();
    DateTime start;
    switch (period) {
      case ChartPeriod.daily:
        start = now.subtract(const Duration(days: 7));
      case ChartPeriod.weekly:
        start = now.subtract(const Duration(days: 56));
      case ChartPeriod.monthly:
        start = now.subtract(const Duration(days: 365));
      case ChartPeriod.yearly:
        start = now.subtract(const Duration(days: 730));
    }

    final snapshot = await FirebaseFirestore.instance
        .collection(collection)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .orderBy('date', descending: false)
        .get();

    final spots = <FlSpot>[];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final value = (data[field] as num?)?.toDouble() ?? 0;
      spots.add(FlSpot(i.toDouble(), value));
    }

    if (spots.isEmpty) {
      return [FlSpot(0, 0)];
    }
    return spots;
  }
}

@riverpod
class CaloriesChartData extends _$CaloriesChartData {
  @override
  Future<List<FlSpot>> build(ChartPeriod period) async {
    return await _fetchData(FirebaseConstants.nutritionCollection, 'calories', period);
  }

  Future<List<FlSpot>> _fetchData(String collection, String field, ChartPeriod period) async {
    final now = DateTime.now();
    DateTime start;
    switch (period) {
      case ChartPeriod.daily:
        start = now.subtract(const Duration(days: 7));
      case ChartPeriod.weekly:
        start = now.subtract(const Duration(days: 56));
      case ChartPeriod.monthly:
        start = now.subtract(const Duration(days: 365));
      case ChartPeriod.yearly:
        start = now.subtract(const Duration(days: 730));
    }

    final snapshot = await FirebaseFirestore.instance
        .collection(collection)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .orderBy('date', descending: false)
        .get();

    final spots = <FlSpot>[];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final value = (data[field] as num?)?.toDouble() ?? 0;
      spots.add(FlSpot(i.toDouble(), value));
    }

    if (spots.isEmpty) {
      return [FlSpot(0, 0)];
    }
    return spots;
  }
}

@riverpod
class ProteinChartData extends _$ProteinChartData {
  @override
  Future<List<FlSpot>> build(ChartPeriod period) async {
    final now = DateTime.now();
    DateTime start;
    switch (period) {
      case ChartPeriod.daily:
        start = now.subtract(const Duration(days: 7));
      case ChartPeriod.weekly:
        start = now.subtract(const Duration(days: 56));
      case ChartPeriod.monthly:
        start = now.subtract(const Duration(days: 365));
      case ChartPeriod.yearly:
        start = now.subtract(const Duration(days: 730));
    }

    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.nutritionCollection)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .orderBy('date', descending: false)
        .get();

    final spots = <FlSpot>[];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final value = (data['proteinG'] as num?)?.toDouble() ?? 0;
      spots.add(FlSpot(i.toDouble(), value));
    }

    if (spots.isEmpty) {
      return [FlSpot(0, 0)];
    }
    return spots;
  }
}

@riverpod
class BodyFatChartData extends _$BodyFatChartData {
  @override
  Future<List<FlSpot>> build(ChartPeriod period) async {
    final now = DateTime.now();
    DateTime start;
    switch (period) {
      case ChartPeriod.daily:
        start = now.subtract(const Duration(days: 7));
      case ChartPeriod.weekly:
        start = now.subtract(const Duration(days: 56));
      case ChartPeriod.monthly:
        start = now.subtract(const Duration(days: 365));
      case ChartPeriod.yearly:
        start = now.subtract(const Duration(days: 730));
    }

    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.bodyMetricsCollection)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .orderBy('date', descending: false)
        .get();

    final spots = <FlSpot>[];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final value = (data['bodyFatPercent'] as num?)?.toDouble() ?? 0;
      spots.add(FlSpot(i.toDouble(), value));
    }

    if (spots.isEmpty) {
      return [FlSpot(0, 0)];
    }
    return spots;
  }
}

@riverpod
class MuscleMassChartData extends _$MuscleMassChartData {
  @override
  Future<List<FlSpot>> build(ChartPeriod period) async {
    final now = DateTime.now();
    DateTime start;
    switch (period) {
      case ChartPeriod.daily:
        start = now.subtract(const Duration(days: 7));
      case ChartPeriod.weekly:
        start = now.subtract(const Duration(days: 56));
      case ChartPeriod.monthly:
        start = now.subtract(const Duration(days: 365));
      case ChartPeriod.yearly:
        start = now.subtract(const Duration(days: 730));
    }

    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.bodyMetricsCollection)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .orderBy('date', descending: false)
        .get();

    final spots = <FlSpot>[];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final value = (data['muscleMassKg'] as num?)?.toDouble() ?? 0;
      spots.add(FlSpot(i.toDouble(), value));
    }

    if (spots.isEmpty) {
      return [FlSpot(0, 0)];
    }
    return spots;
  }
}

@riverpod
class StrengthProgress extends _$StrengthProgress {
  @override
  Future<List<FlSpot>> build(String exerciseId, ChartPeriod period) async {
    final now = DateTime.now();
    DateTime start;
    switch (period) {
      case ChartPeriod.daily:
        start = now.subtract(const Duration(days: 7));
      case ChartPeriod.weekly:
        start = now.subtract(const Duration(days: 56));
      case ChartPeriod.monthly:
        start = now.subtract(const Duration(days: 365));
      case ChartPeriod.yearly:
        start = now.subtract(const Duration(days: 730));
    }

    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.workoutsCollection)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .orderBy('date', descending: false)
        .get();

    final spots = <FlSpot>[];
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final exercises = data['exercises'] as List<dynamic>? ?? [];
      for (final ex in exercises) {
        if ((ex as Map<String, dynamic>)['exerciseId'] == exerciseId) {
          final maxWeight = (ex['weight'] as num?)?.toDouble() ?? 0;
          spots.add(FlSpot(i.toDouble(), maxWeight));
        }
      }
    }

    if (spots.isEmpty) {
      return [FlSpot(0, 0)];
    }
    return spots;
  }
}

@riverpod
class GoalPredictionProvider extends _$GoalPredictionProvider {
  @override
  Future<GoalPrediction> build() async {
    final userDoc = await FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .doc('current')
        .get();

    final data = userDoc.data() ?? {};
    final currentWeight = (data['weightKg'] as num?)?.toDouble() ?? 70.0;
    final goalWeight = (data['goalWeight'] as num?)?.toDouble() ?? 65.0;
    final targetDateStr = data['goalDate'] as String?;
    final targetDate = targetDateStr != null
        ? DateTime.parse(targetDateStr)
        : DateTime.now().add(const Duration(days: 90));

    final diff = currentWeight - goalWeight;
    final weeks = (diff.abs() * 5).round();
    final estimatedCompletion = DateTime.now().add(Duration(days: weeks * 7));
    final totalDiff = currentWeight - goalWeight;
    final progressSoFar = totalDiff != 0
        ? ((currentWeight - currentWeight) / totalDiff).abs().clamp(0.0, 1.0)
        : 0.0;

    return GoalPrediction(
      currentWeight: currentWeight,
      goalWeight: goalWeight,
      targetDate: targetDate,
      estimatedCompletionDate: estimatedCompletion,
      progressPercent: progressSoFar * 100,
      dailyCalorieTarget: (diff.abs() * 500).round(),
      weeksRemaining: weeks,
    );
  }
}
