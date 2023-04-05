class AppException implements Exception {
  final_message;
  final_prefix;

  AppException([
    this._message,
    this._prefix,
  ]);

  String toString() {
    return "$_prefix$_message, ";
  }
}

class FetchDataException extends AppException {
  FetchDataException([
    String? message,
  ]) : super(message, "Error During Communication: ")
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request:");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised:");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "Not found:");
}

class RequestTimedoutException extends AppException {
  RequestTimedoutException([String? message])
      : super(message, "Request Timed out:");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message])
      : super(message, "internal Server Error:");
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message])
      : super(message, "Service Unavailable:");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input:");
}