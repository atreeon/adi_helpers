import 'package:adi_helpers/types.dart';

class IdWithPercentage {
  final int id;
  final int percentage;

  IdWithPercentage(
    this.id,
    this.percentage,
  ) : assert(id != null && percentage != null);
}

///Takes a list of ids and values
/// takes the count and assigns a percentage based on where they are in list
///1,2,3,4  = 25, 50, 75, 100
List<IdWithPercentage> indexPercentage(List<int> ids) {
  var value = (100 / ids.length);

  var result = List<IdWithPercentage>();
  for (var i = 0; i < ids.length; ++i) {
    result.add(IdWithPercentage(ids[i], ((i + 1) * value).round()));
  }

  return result;
}

///Takes a list and splits it based by the percentage values contained
/// inside splits.
///1,2,4,5,6 - [40%,40%,20%] = [[1,2], [4,5], [6]]
List<List<T>> splitByPercentage<T>(
    List<T> list, List<Percentage> splitPercentages) {
  var result = [<T>[]];
  var splitIndexes =
      splitPercentages.map((x) => list.length * (x() / 100)).toList();
  var stopAtIIndex = splitIndexes[0];
  splitIndexes.removeAt(0);
  var currentGroup = 0;

  for (var i = 0; i < list.length; ++i) {
    if (i >= stopAtIIndex) {
      stopAtIIndex += splitIndexes[0];
      splitIndexes.removeAt(0);
      currentGroup++;
      result.add(List<T>());
    }

    result[currentGroup].add(list[i]);
  }

  return result;
}
