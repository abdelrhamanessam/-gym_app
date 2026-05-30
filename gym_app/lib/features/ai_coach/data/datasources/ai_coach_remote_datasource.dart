import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gym_app/core/constants/api_constants.dart';
import 'package:gym_app/core/network/api_client.dart';

part 'ai_coach_remote_datasource.g.dart';

@riverpod
AiCoachRemoteDataSource aiCoachRemoteDataSource(
  AiCoachRemoteDataSourceRef ref,
) {
  final dio = ref.watch(apiClientProvider);
  return AiCoachRemoteDataSource(dio);
}

class AiCoachRemoteDataSource {
  final Dio _dio;

  AiCoachRemoteDataSource(this._dio);

  Future<Map<String, dynamic>> getNutritionAdvice({
    required List<Map<String, dynamic>> meals,
    required Map<String, dynamic> goals,
  }) async {
    final response = await _dio.post(
      '${ApiConstants.baseUrl}/ai/nutrition-advice',
      data: {
        'meals': meals,
        'goals': goals,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getFitnessAdvice({
    required List<Map<String, dynamic>> workouts,
    required Map<String, dynamic> goals,
  }) async {
    final response = await _dio.post(
      '${ApiConstants.baseUrl}/ai/fitness-advice',
      data: {
        'workouts': workouts,
        'goals': goals,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getDailyReport({
    required String userId,
    required String date,
  }) async {
    final response = await _dio.post(
      '${ApiConstants.baseUrl}/ai/daily-report',
      data: {
        'userId': userId,
        'date': date,
      },
    );
    return response.data as Map<String, dynamic>;
  }
}
