// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

extension MoveItems<T> on List<T> {
  List<T> moveUp(int indexFrom, int indexTo) {
    var insertIndex = indexFrom - 1;
    var result = moveItems(indexFrom, indexTo, insertIndex: insertIndex);
    return result;
  }

  List<T> moveDown(int indexFrom, int indexTo) {
    var insertIndex = indexFrom + 1;
    var result = moveItems(indexFrom, indexTo, insertIndex: insertIndex);
    return result;
  }

  List<T> moveItems(
    int indexFrom,
    int indexTo, {
    required int insertIndex,
  }) {
    if (indexFrom < 0 || indexTo > this.length - 1 || insertIndex < 0 || insertIndex > this.length - 1) {
      throw RangeError('Invalid arguments.');
    }

    var newList = [...this];
    final itemsToMove = newList.sublist(indexFrom, indexTo + 1);

    newList.removeRange(indexFrom, indexTo + 1);
    newList.insertAll(insertIndex, itemsToMove);
    return newList;
  }
}

// extension Splice<T> on List<T> {
//   void splice(int index1, int length) {
//     // Check for boundary conditions.
//     if (index1 < 0 || length < 0 || index1 + length > this.length) {
//       throw RangeError('Invalid splice arguments.');
//     }
//
//     // Create a temporary list to store the spliced items.
//     var temp = this.sublist(index1, index1 + length);
//
//     // Remove the spliced items from the original list.
//     this.removeRange(index1, index1 + length);
//
//     // Insert the spliced items at the end of the original list.
//     this.addAll(temp);
//   }
// }

// extension Splice<T> on List<T> {
//   Iterable<T> splice(int start, int count, [List<T>? insert]) {
//     final result = [...getRange(start, start + count)];
//     replaceRange(start, start + count, insert ?? []);
//     return result;
//   }
// }

// //python version
// def splice(list1, index1, length):
// """Removes the length items starting at the given index in the given list and inserts them at the end of the list."""
// temp = list1[index1:index1 + length]
// list1 = list1[:index1] + list1[index1 + length:] + temp
