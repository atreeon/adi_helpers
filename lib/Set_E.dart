import 'package:collection/collection.dart';

// ignore: top_level_instance_method
var _setDeepEqualsOrdered = const DeepCollectionEquality().equals;

// ignore: top_level_instance_method
var _setDeepEqualsUnordered = const DeepCollectionEquality.unordered().equals;

extension Set_E<T> on Set<T> {
  bool equalOrdered(Set<T> compareTo) {
    return _setDeepEqualsOrdered(this, compareTo);
  }

  bool equalUnordered(List<T> compareTo) {
    return _setDeepEqualsUnordered(this, compareTo);
  }
}
