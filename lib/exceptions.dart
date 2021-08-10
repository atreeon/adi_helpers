import 'package:adi_helpers/typeOf.dart';

class UnexpectedTypeException<T> implements Exception {
  final String? message;

  const UnexpectedTypeException({this.message = null});

  String toString() {
    var typeStr = typeOf<T>().toString();
    var _message = message == null ? "" : " | $message";

    return "An unexpected type occurred: $typeStr$_message";
  }
}

class UnexpectedStateException implements Exception {
  const UnexpectedStateException();
}

class NotImplementedException implements Exception {
  final String? message;

  const NotImplementedException({this.message = null});

  String toString() {
    return "NotImplementedException: ${message ?? ""}";
  }
}
