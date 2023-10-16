import 'package:adi_helpers/listH.dart';
import 'package:adi_helpers/types.dart';
import 'package:test/test.dart';

void main() {
  group("splitByPercentage", () {
    test("1", () {
      var list = [1, 4, 5, 6, 9];
      var splits = [Percentage(40), Percentage(40), Percentage(20)];

      var result = splitByPercentage(list, splits);

      expect(result.length, 3);
      expect(result[0], [1, 4]);
      expect(result[1], [5, 6]);
      expect(result[2], [9]);
    });

    test("2", () {
      var list = [1, 2, 3];
      var splits = [Percentage(50), Percentage(50)];

      var result = splitByPercentage(list, splits);

      expect(result.length, 2);
      expect(result[0], [1, 2]);
      expect(result[1], [3]);
    });

    test("3", () {
      var list = [1, 2, 3, 4, 5, 6, 7];
      var splits = [Percentage(12), Percentage(35), Percentage(53)];

      var result = splitByPercentage(list, splits);

      expect(result.length, 3);
      expect(result[0], [1]);
      expect(result[1], [2, 3, 4]);
      expect(result[2], [5, 6, 7]);
    });
  });

  group("indexPercentage", () {
    test("1b", () {
      var list = [1, 2, 3, 4];

      var result = indexPercentage(list);

      var r = result.map((x) => x.percentage).toList();

      expect(r, [25, 50, 75, 100]);
    });
  });
}
