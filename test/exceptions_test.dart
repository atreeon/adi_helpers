import 'package:adi_helpers/exceptions.dart';
import "package:test/test.dart";

void main() {
  group("UnexpectedTypeException", () {
    test("1 UnexpectedTypeException error", () {
      String result;

      try {
        throw UnexpectedTypeException<int>();
      } catch (x) {
        result = x.toString();
      }

      expect(result, 'An unexpected type occurred: int');
    });

    test("2 with message", () {
      String result;

      try {
        throw UnexpectedTypeException<int>(message: "error details here");
      } catch (x) {
        result = x.toString();
      }

      expect(result, 'An unexpected type occurred: int | error details here');
    });
  });
}
