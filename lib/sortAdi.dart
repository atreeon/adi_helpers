import 'package:dartx/dartx.dart';

///Adi sort involves updating one id but there is a small chance that the ids can clash and a
///
///Easier to implement than bubble sort
///
/// orderIds [1,5,9,14] -> up number 9 -> [1,5,10000,14]
class SortAdi<T> {
  final int Function(T) fnGetOrderId;
  final int Function(T) fnGetId;
  final List<T> Function(List<T>) fnGetSubList;
  final T Function(T item, int newOrderId) copyWithUpdateOrderId;
  final int numberInterval;

  SortAdi({
    required this.fnGetOrderId,
    required this.fnGetId,
    required this.fnGetSubList,
    required this.copyWithUpdateOrderId,
    this.numberInterval = 10000,
  });

  T call({
    required int id,
    required SortDirection sortDirection,
    required List<T> existingList,
  }) {
    var list = fnGetSubList(existingList).sortedBy((element) => fnGetOrderId(element));
    if (!list.any((element) => fnGetId(element) == id)) //
      throw Exception("item with id not found in list");

    var item = list.firstWhere((element) => fnGetId(element) == id);
    if (list.length <= 1) //
      return item; //no need to update, only one item in list
    var maxOrderId = list.map((e) => fnGetOrderId(e)).max();
    var minOrderId = list.map((e) => fnGetOrderId(e)).min();

    int? currentIndex = null;
    int? nextIndex = null;
    int? previousIndex = null;

    var maxIndex = list.length - 1;
    for (var i = 0; i <= maxIndex; ++i) {
      if (fnGetId(list[i]) == id) {
        currentIndex = i;
        nextIndex = i == maxIndex ? null : i + 1;
        previousIndex = i == 0 ? null : i - 1;
      }
    }

    if (nextIndex == null && sortDirection == SortDirection.up) //
      return item;

    if (previousIndex == null && sortDirection == SortDirection.down) //
      return item;

    if (sortDirection == SortDirection.up && nextIndex == maxIndex) //
      return copyWithUpdateOrderId(item, maxOrderId! + numberInterval);

    if (sortDirection == SortDirection.down && previousIndex == 0) //
      return copyWithUpdateOrderId(item, minOrderId! - numberInterval);

    if (sortDirection == SortDirection.up) {
      var orderIdMin = fnGetOrderId(list[currentIndex! + 1]);
      var orderIdMax = fnGetOrderId(list[currentIndex + 2]);

      if (orderIdMax - orderIdMin <= 1) //
        return copyWithUpdateOrderId(item, orderIdMax + numberInterval);

      var newOrderId = orderIdMin + ((orderIdMax - orderIdMin) / 2);

      return copyWithUpdateOrderId(item, newOrderId.toInt());
    }

    if (sortDirection == SortDirection.down) {
      var orderIdMin = fnGetOrderId(list[currentIndex! - 2]);
      var orderIdMax = fnGetOrderId(list[currentIndex - 1]);
      var newOrderId = orderIdMin + ((orderIdMax - orderIdMin) / 2);

      if (orderIdMax - orderIdMin <= 1) //
        return copyWithUpdateOrderId(item, orderIdMax + numberInterval);

      return copyWithUpdateOrderId(item, newOrderId.toInt());
    }

    return item;
  }
}

enum SortDirection { up, down }

//action should have the language & everything

//use random number lower than last, higher than other
//(get count, if current index is one less than max -> add 10000 to max)
//MoveUp => newIndexOfMove != count ? index + 1 + (((index + 2) - (index + 1)) / 2)
//MoveDown => newIndexOfMove != 0 ? index - 2 + (((index - 2) - (index 1 1)) / 2)
//  list of two, move one higher
//  0, 10000 -> 10000, 20000
//
//  multiple, move one to highest
//  0, 10000, 20000, 30000 -> 0, 10000, 30000, 40000
//
//  multiple, move one higher than another but neither top nor bottom
//  0, 10000, 20000, 30000
//
//  0, 10000, 20000, 30000 -> 0, 20000, 25000, 30000 :
//  0, 10000, 20000, 30000 -> 0, 20000, 30000, 40000
//  0, 10000, 20000, 30000 -> 0, 10000, 25000, 30000
//
//  insert new
//
//  insert
