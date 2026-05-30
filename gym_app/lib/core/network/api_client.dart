import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/api_constants.dart';

part 'api_client.g.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = ApiConstants.connectTimeout;
    options.receiveTimeout = ApiConstants.receiveTimeout;
    options.sendTimeout = ApiConstants.sendTimeout;
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}

@riverpod
Dio apiClient(ApiClientRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );
  dio.interceptors.addAll([
    ApiInterceptor(),
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  ]);
  return dio;
}
