import 'package:adi_helpers/typeOf.dart';

class UnexpectedTypeException<T> implements Exception {
  const UnexpectedTypeException();

  @override
  String toString() => 'An unexpected type occurred:' + typeOf<T>().toString();
}
