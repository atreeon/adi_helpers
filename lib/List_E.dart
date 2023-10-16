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

  T? getPrevious<T2>(T Function(T item) getId, T item) => //
      this.getNthInRelationToX(getId, item, -1);

  T? getNext<T2>(T Function(T item) getId, T item) => //
      this.getNthInRelationToX(getId, item, 1);

  T? getNthInRelationToX<T2>(T Function(T item) getId, T item, int nth) {
    var index = this.indexOf(item);
    var nthIndex = index + nth;

    if (nthIndex < 0 || nthIndex >= this.length) //
      return null;

    var previousItem = this.elementAt(nthIndex);
    return previousItem;
  }
}

extension List__E on List {
  bool equalOrderedD(List compareTo) {
    return _listDeepEqualsOrdered(this, compareTo);
  }

  ///Deep equals
  bool equalUnorderedD(List compareTo) {
    return _listDeepEqualsUnordered(this, compareTo);
  }
}
