import 'package:adi_helpers/listH.dart';
import 'package:adi_helpers/types.dart';
import 'package:test/test.dart';

void main() {
  group("mapH", () {
    test("1", () {
      var list = [1, 4, 5, 6, 9];
      var splits = [Percentage(40), Percentage(40), Percentage(20)];

      var result = splitByPercentage(list, splits);

      expect(result.length, 3);
      expect(result[0], [1, 4]);
      expect(result[1], [5, 6]);
      expect(result[2], [9]);
    });
  });
}
