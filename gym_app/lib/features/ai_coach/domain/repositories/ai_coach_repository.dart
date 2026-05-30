import '../entities/ai_advice.dart';

abstract class AiCoachRepository {
  Future<AiAdvice?> getDailyAiAdvice(String userId, DateTime date);
  Future<String> getNutritionAdvice(
    List<Map<String, dynamic>> meals,
    Map<String, dynamic> goals,
  );
  Future<String> getFitnessAdvice(
    List<Map<String, dynamic>> workouts,
    Map<String, dynamic> goals,
  );
  Future<DailySummaryReport> getDailySummaryReport(
    String userId,
    DateTime date,
  );
}
