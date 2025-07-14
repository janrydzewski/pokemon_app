class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final String? details;

  const NetworkException({
    required this.message,
    this.statusCode,
    this.details,
  });

  @override
  String toString() {
    return 'NetworkException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}

class NoInternetException extends NetworkException {
  const NoInternetException() : super(message: 'No internet connection');
}

class TimeoutException extends NetworkException {
  const TimeoutException() : super(message: 'Request timeout');
}

class ServerException extends NetworkException {
  const ServerException({String? details})
    : super(message: 'Server error', statusCode: 500, details: details);
}

class UnauthorizedException extends NetworkException {
  const UnauthorizedException()
    : super(message: 'Unauthorized', statusCode: 401);
}

class NotFoundException extends NetworkException {
  const NotFoundException({String? details})
    : super(message: 'Resource not found', statusCode: 404, details: details);
}

class BadRequestException extends NetworkException {
  const BadRequestException({String? details})
    : super(message: 'Bad request', statusCode: 400, details: details);
}
