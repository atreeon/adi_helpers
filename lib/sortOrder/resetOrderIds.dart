import 'package:collection/collection.dart';

List<T> resetOrderIds<T>(
  List<T> list,
  double Function(T) getOrderId,
  T Function(T, double) setOrderId,
) {
  var orderedList = list.sortedBy<num>((T x) => getOrderId(x));

  var newList = orderedList.mapIndexed((i, element) {
    return setOrderId(element, i.toDouble());
  }).toList();

  return newList;
}
