sealed class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    required super.message,
    this.statusCode,
  });
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class AuthFailure extends Failure {
  final String? code;

  const AuthFailure({
    required super.message,
    this.code,
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;

  const ValidationFailure({
    required super.message,
    this.fieldErrors,
  });
}

class UnexpectedFailure extends Failure {
  final dynamic error;

  const UnexpectedFailure({
    required super.message,
    this.error,
  });
}
