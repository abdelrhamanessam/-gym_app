import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:gym_app/core/constants/firebase_constants.dart';
import '../../domain/entities/ai_advice.dart';
import '../../domain/repositories/ai_coach_repository.dart';
import '../datasources/ai_coach_remote_datasource.dart';
import '../models/ai_advice_model.dart';
import '../models/daily_summary_report_model.dart';

part 'ai_coach_repository_impl.g.dart';

@riverpod
AiCoachRepository aiCoachRepository(AiCoachRepositoryRef ref) {
  final dataSource = ref.watch(aiCoachRemoteDataSourceProvider);
  return AiCoachRepositoryImpl(
    dataSource: dataSource,
    firestore: FirebaseFirestore.instance,
  );
}

class AiCoachRepositoryImpl implements AiCoachRepository {
  final AiCoachRemoteDataSource dataSource;
  final FirebaseFirestore firestore;

  AiCoachRepositoryImpl({
    required this.dataSource,
    required this.firestore,
  });

  CollectionReference get _aiAdvice =>
      firestore.collection('${FirebaseConstants.chatHistoryCollection}_ai');

  CollectionReference get _dailySummaries =>
      firestore.collection(FirebaseConstants.dailySummariesCollection);

  @override
  Future<AiAdvice?> getDailyAiAdvice(String userId, DateTime date) async {
    final dateStr = date.toIso8601String().substring(0, 10);
    final query = await _aiAdvice
        .where('userId', isEqualTo: userId)
        .where('date', isEqualTo: dateStr)
        .limit(1)
        .get();
    if (query.docs.isEmpty) return null;
    return AiAdviceModel.fromFirestore(query.docs.first);
  }

  @override
  Future<String> getNutritionAdvice(
    List<Map<String, dynamic>> meals,
    Map<String, dynamic> goals,
  ) async {
    final response = await dataSource.getNutritionAdvice(
      meals: meals,
      goals: goals,
    );
    return response['advice'] as String? ?? '';
  }

  @override
  Future<String> getFitnessAdvice(
    List<Map<String, dynamic>> workouts,
    Map<String, dynamic> goals,
  ) async {
    final response = await dataSource.getFitnessAdvice(
      workouts: workouts,
      goals: goals,
    );
    return response['advice'] as String? ?? '';
  }

  @override
  Future<DailySummaryReport> getDailySummaryReport(
    String userId,
    DateTime date,
  ) async {
    final dateStr = date.toIso8601String().substring(0, 10);
    final query = await _dailySummaries
        .where('userId', isEqualTo: userId)
        .where('date', isEqualTo: dateStr)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return DailySummaryReportModel.fromFirestore(query.docs.first);
    }

    final remoteData = await dataSource.getDailyReport(
      userId: userId,
      date: dateStr,
    );

    final report = DailySummaryReport(
      date: date,
      caloriesConsumed: remoteData['caloriesConsumed'] as int? ?? 0,
      caloriesTarget: remoteData['caloriesTarget'] as int? ?? 0,
      proteinConsumed: remoteData['proteinConsumed'] as int? ?? 0,
      proteinTarget: remoteData['proteinTarget'] as int? ?? 0,
      carbsConsumed: remoteData['carbsConsumed'] as int? ?? 0,
      carbsTarget: remoteData['carbsTarget'] as int? ?? 0,
      fatConsumed: remoteData['fatConsumed'] as int? ?? 0,
      fatTarget: remoteData['fatTarget'] as int? ?? 0,
      waterMl: remoteData['waterMl'] as int? ?? 0,
      waterTargetMl: remoteData['waterTargetMl'] as int? ?? 0,
      workoutCompleted: remoteData['workoutCompleted'] as bool? ?? false,
      streakDays: remoteData['streakDays'] as int? ?? 0,
      aiAdvice: remoteData['aiAdvice'] as String? ?? '',
    );

    await _dailySummaries.add(report.toFirestore()..['userId'] = userId);
    return report;
  }
}
