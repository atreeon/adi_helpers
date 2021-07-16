import 'package:adi_helpers/stringE.dart';
import 'package:test/test.dart';

void main() {
  final fnDef5 = "f5() → String";

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
}
