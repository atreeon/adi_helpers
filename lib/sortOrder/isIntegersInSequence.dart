import 'package:collection/collection.dart';

bool isIntegersInSequence<T>(List<T> list, int Function(T) getInteger) {
  var firstInteger = getInteger(list.first);

  for (var i = 0; i < list.length; ++i) {
    var _int = getInteger(list[i]);
    if (_int != i + firstInteger) //
      return false;
  }

  return true;
}
