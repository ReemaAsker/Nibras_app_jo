// class AppException implements Exception {
//   final _message;
//   final _prefix;

//   AppException([this._message, this._prefix]);

//   @override
//   String toString() {
//     return "$_prefix$_message";
//   }
// }

// class FetchDataException extends AppException {
//   FetchDataException([message])
//       : super(message, "Error During Communication: ");
// }

// class BadRequestException extends AppException {
//   BadRequestException([message]) : super(message, "Invalid Request: ");
// }

// class UnauthorisedException extends AppException {
//   UnauthorisedException([message]) : super(message, "Unauthorised: ");
// }

// class InvalidInputException extends AppException {
//   InvalidInputException([message]) : super(message, "Invalid Input: ");
// }

// Custom Exception Classes
class AppException implements Exception {
  final String message;
  AppException(this.message);
  @override
  String toString() => 'AppException: $message';
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message) : super(message);
}

class FetchDataException extends AppException {
  FetchDataException(String message) : super(message);
}
