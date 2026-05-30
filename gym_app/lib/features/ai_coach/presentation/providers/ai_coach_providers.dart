import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/ai_coach_repository_impl.dart';
import '../../domain/entities/ai_advice.dart';

part 'ai_coach_providers.g.dart';

@riverpod
class DailyAiAdviceProvider extends _$DailyAiAdviceProvider {
  @override
  Future<AiAdvice?> build(String userId, DateTime date) async {
    final repo = ref.watch(aiCoachRepositoryProvider);
    return repo.getDailyAiAdvice(userId, date);
  }
}

@riverpod
class DailySummaryReportProvider extends _$DailySummaryReportProvider {
  @override
  Future<DailySummaryReport> build(String userId, DateTime date) async {
    final repo = ref.watch(aiCoachRepositoryProvider);
    return repo.getDailySummaryReport(userId, date);
  }
}

@riverpod
class AiCoachMessageProvider extends _$AiCoachMessageProvider {
  @override
  List<Map<String, dynamic>> build() {
    return [];
  }

  void addMessage(String role, String content) {
    state = [
      ...state,
      {'role': role, 'content': content, 'timestamp': DateTime.now().toIso8601String()},
    ];
  }

  void clearMessages() {
    state = [];
  }
}
