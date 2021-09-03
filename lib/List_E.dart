import 'package:collection/collection.dart';

// ignore: top_level_instance_method
var _listDeepEqualsOrdered = const DeepCollectionEquality().equals;

// ignore: top_level_instance_method
var _listDeepEqualsUnordered = const DeepCollectionEquality.unordered().equals;

extension List_E<T> on List<T> {
  bool equalOrdered(List<T> compareTo) {
    return _listDeepEqualsOrdered(this, compareTo);
  }

  bool equalUnordered(List<T> compareTo) {
    return _listDeepEqualsUnordered(this, compareTo);
  }
}
