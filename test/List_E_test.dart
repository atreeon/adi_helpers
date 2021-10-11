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
}
