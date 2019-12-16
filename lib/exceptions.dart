import 'package:adi_helpers/typeOf.dart';

class UnexpectedTypeException<T> implements Exception {
  const UnexpectedTypeException();

  String toString() => 'An unexpected type occurred:' + typeOf<T>().toString();
}

class UnexpectedStateException implements Exception {
  const UnexpectedStateException();
}
