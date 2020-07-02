import 'package:adi_helpers/dateE.dart';
import 'package:test/test.dart';

void main() {
  var dt = DateTime.utc(1997, 9, 7, 8, 54);

  group("createSpaces", () {
    test("1", () {
      var result = dt.format("yyyy/M/d");
      expect(result, "1997/9/7");
    });

    test("2", () {
      var result = dt.dd$MM$yyyy();
      expect(result, "07/09/1997");
    });

    test("3", () {
      var result = dt.d$M$yyyy();
      expect(result, "7/9/1997");
    });

    test("4", () {
      var result = dt.d$M$yyyy_HH$mm();
      expect(result, "7/9/1997 08:54");
    });
  });
}
