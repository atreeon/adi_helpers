import 'package:adi_helpers/stringE.dart';
import 'package:test/test.dart';

void main() {
  group("toIntOrError", () {
    test("1", () {
      var data = "";
      var result = data.toIntOrNull();

      expect(result, null);
    });

    test("2", () {
      var data = "blah";
      expect(() => data.toIntOrNull(), throwsA(TypeMatcher<Exception>()));
    });

    test("3", () {
      var data = "1";
      var result = data.toIntOrNull();

      expect(result, 1);
    });
  });

  group("getMaxIntegerOfAString", () {
    test("0 getMaxIntegerInAString", () {
      var result = "blah 1 blah".getMaxIntegerOfAString();
      expect(result, 1);
    });

    test("1 getMaxIntegerInAString", () {
      var result = "blah 1 blah2 9 3".getMaxIntegerOfAString();
      expect(result, 9);
    });
  });
}
