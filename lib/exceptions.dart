import 'package:adi_helpers/typeOf.dart';

class UnexpectedTypeException<T> implements Exception {
  final String message;

  const UnexpectedTypeException({this.message = null});

  String toString() => 'An unexpected type occurred:' + //
              typeOf<T>().toString() +
              message ==
          null
      ? ""
      : " | $message";
}

class UnexpectedStateException implements Exception {
  const UnexpectedStateException();
}

class NotImplementedException {}
