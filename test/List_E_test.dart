import 'package:adi_helpers/List_E.dart';
import 'package:test/test.dart';

void main() {
  group("List_H equals", () {
    test("0 list", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 2, 3];

      var result = list1.equalOrderedD(list2);

      expect(result, true);
    });

    test("1 order differs", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 3, 2];

      var result = list1.equalOrderedD(list2);

      expect(result, false);
    });

    test("2 order differs using unordered", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 3, 2];

      var result = list1.equalUnorderedD(list2);

      expect(result, true);
    });

    test("3 content differs", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 3, 2, 3];

      var result = list1.equalOrderedD(list2);

      expect(result, false);
    });
  });

  group("List_H getNth", () {
    test("a 0 previous", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getPrevious((x) => x, 2);

      expect(result, 0);
    });

    test("a 1 no previous item", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getPrevious((x) => x, 7);

      expect(result, null);
    });

    test("a 2 next", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getNext((x) => x, 0);

      expect(result, 2);
    });

    test("a 3 no next item", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getNext((x) => x, 3);

      expect(result, null);
    });

    test("a 4 getNthInRelationToX", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getNthInRelationToX((x) => x, 7, 3);

      expect(result, 3);
    });
  });
}
