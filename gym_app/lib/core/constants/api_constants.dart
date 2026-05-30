class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.gymai.app/v1';
  static const String geminiApiKey = 'YOUR_GEMINI_API_KEY_HERE';
  static const String geminiModel = 'gemini-2.0-flash';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 20);

  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
}
