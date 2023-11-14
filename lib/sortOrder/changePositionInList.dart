//*move up
//  get the previous item in list before selection
//  get the last selected item
//  set the previous item's sortOrderId to last selected items sortOrderId + 0.5
//  resetOrderIds

import 'package:adi_helpers/sortOrder/resetOrderIds.dart';

enum eDirection { up, down }

/// Takes a list and a number of selected items and moves them up, reseting the sort order
/// We assume the list is already sorted by it's orderId
List<TItem> changePositionInListUp<TItem, TId>(
  List<TItem> list,
  List<TId> selectedIds,
  TId Function(TItem) getId,
  double Function(TItem) getOrderId,
  TItem Function(TItem, double) setOrderId,
) {
  var _selectedIds = [...selectedIds];
  var _list = [...list];

  TItem? priorToSelected;
  TItem? lastSelected;

  //loop through list until first 'selectedId' has been found
  //eDirection predicate to determine which way to loop
  for (var i = 0; i < _list.length && _selectedIds.length > 0; ++i) {
    var item = _list[i];
    var itemId = getId(item);
    if (_selectedIds.any((selectedId) => selectedId == itemId)) {
      if (priorToSelected == null) {
        if (i == 0) //
          return _list;

        //save previous item
        priorToSelected = _list[i - 1];
      }

      //keep looping through until we find the last selectedId
      lastSelected = item;
      _selectedIds = _selectedIds.where((x) => x != itemId).toList();
    }
  }

  if (priorToSelected == null || lastSelected == null) //
    return _list;

  var newList = _list.map((item) {
    //get sortOrderId of last selected
    //set previous item to last sortOrderId + 0.5
    if (getId(item) == getId(priorToSelected!)) //
      return setOrderId(item, getOrderId(lastSelected!) + 0.5);

    return item;
  }).toList();

  var reOrderedList = resetOrderIds(
    newList,
    getOrderId,
    setOrderId,
  );

  return reOrderedList;
}

List<TItem> changePositionInListDown<TItem, TId>(
  List<TItem> list,
  List<TId> selectedIds,
  TId Function(TItem) getId,
  double Function(TItem) getOrderId,
  TItem Function(TItem, double) setOrderId,
) {
  var _selectedIds = [...selectedIds];
  var _list = [...list];

  TItem? afterSelected;
  TItem? lastSelected;

  //loop through list until first 'selectedId' has been found
  //eDirection predicate to determine which way to loop
  for (var i = _list.length - 1; i >= 0 && _selectedIds.length > 0; --i) {
    var item = _list[i];
    var itemId = getId(item);
    if (_selectedIds.any((selectedId) => selectedId == itemId)) {
      if (afterSelected == null) {
        if (i == _list.length - 1) //
          return _list;

        //save previous item
        afterSelected = _list[i + 1];
      }

      //keep looping through until we find the last selectedId
      lastSelected = item;
      _selectedIds = _selectedIds.where((x) => x != itemId).toList();
    }
  }

  if (afterSelected == null || lastSelected == null) //
    return _list;

  var newList = _list.map((item) {
    //get sortOrderId of last selected
    //set previous item to last sortOrderId + 0.5
    if (getId(item) == getId(afterSelected!)) //
      return setOrderId(item, getOrderId(lastSelected!) - 0.5);

    return item;
  }).toList();

  var reOrderedList = resetOrderIds(
    newList,
    getOrderId,
    setOrderId,
  );

  return reOrderedList;
}
