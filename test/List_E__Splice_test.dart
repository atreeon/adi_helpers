import 'package:adi_helpers/List_E__Splice.dart';
import 'package:test/test.dart';

void main() {
  group("List_H equals", () {
    test("b0 moveDown", () {
      var cars = ['A', 'B', 'C', 'D'];

      var result = cars.moveDown(1, 2);
      var expected = ['A', 'D', 'B', 'C'];

      expect(result, expected);
    });

    test("b1 moveDown - Out of range", () {
      var cars = ['A', 'B', 'C', 'D'];

      expect(
        () => cars.moveDown(2, 3),
        throwsA(isA<RangeError>()),
      );
    });
  });

  group("List_H equals", () {
    test("b0 moveUp", () {
      var cars = ['A', 'B', 'C', 'D'];

      var result = cars.moveUp(1, 2);
      var expected = ['B', 'C', 'A', 'D'];

      expect(result, expected);
    });

    test("b1 moveUp - Out of range", () {
      var cars = ['A', 'B', 'C', 'D'];

      expect(
        () => cars.moveUp(0, 1),
        throwsA(isA<RangeError>()),
      );
    });
  });

  group("List_H equals", () {
    test("a0 list", () {
      var cars = ['A', 'B', 'C', 'D'];

      var result = cars.moveItems(1, 2, insertIndex: 0);
      var expected = ['B', 'C', 'A', 'D'];

      expect(result, expected);
    });

    test("a1 from too small", () {
      var cars = ['A', 'B', 'C', 'D'];

      expect(
        () => cars.moveItems(-1, 3, insertIndex: 0),
        throwsA(isA<RangeError>()),
      );
    });

    test("a2 to too big", () {
      var cars = ['A', 'B', 'C', 'D'];

      expect(
        () => cars.moveItems(0, 4, insertIndex: 0),
        throwsA(isA<RangeError>()),
      );
    });

    test("a3 index too big", () {
      var cars = ['A', 'B', 'C', 'D'];

      expect(
        () => cars.moveItems(0, 2, insertIndex: 2),
        throwsA(isA<RangeError>()),
      );
    });
  });
}
