import 'package:adi_helpers/allOptionsIf.dart';
import 'package:test_api/test_api.dart';

enum TwoFruits { orange, peach }

void main() {
  group("allOptionsIf", () {
    test("1", () {
      var valueInput = TwoFruits.orange;
      var result = allOptionsIf(valueInput, {
        TwoFruits.orange: () => "oh, love my oranges",
        TwoFruits.peach: () => "oooo, what a lovely soft peach",
      });
      expect(result, "oh, love my oranges");
    });

    test("2 exception if no option is found", () {
      var valueInput = TwoFruits.peach;

      expect(
          () => allOptionsIf(valueInput, {
                TwoFruits.orange: () => "oh, love my oranges",
              }),
          throwsA(predicate((e) => e is Exception)));
    });

    test("3 default option, if not found", () {
      var valueInput = TwoFruits.peach;

      var result = allOptionsIf(valueInput,
          {TwoFruits.orange: () => "oh, love my oranges"}, "nothing");
      expect(result, "nothing");
    });
  });
}
