import 'package:adi_helpers/exceptions.dart';
import "package:test/test.dart";

void main() {
  group("UnexpectedTypeException", () {
    test("UnexpectedTypeException error", () {
      String result;

      try {
        throw UnexpectedTypeException<int>();
      } catch (x) {
        result = x.toString();
      }

      expect(result, 'An unexpected type occurred:int');
    });
  });
}
