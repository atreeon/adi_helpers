import 'package:adi_helpers/allOptionsIf.dart';
import 'package:test_api/test_api.dart';

enum TwoFruits { orange, peach }

enum ThreeFruits { orange, peach, banana }

class Fruit {}

class Orange implements Fruit {}

class Peach implements Fruit {}

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
          {TwoFruits.orange: () => "oh, love my oranges"}, null, "nothing");
      expect(result, "nothing");
    });

    test("4 fall through...multiple options with the same result", () {
      var valueInput = ThreeFruits.orange;
      var result = allOptionsIf(
        valueInput,
        {ThreeFruits.peach: () => "eat it"},
        {
          [ThreeFruits.orange, ThreeFruits.banana]: () => "peel it"
        },
      );
      expect(result, "peel it");
    });
  });

  group("case2", () {
    test("1", () {
      var valueInput = TwoFruits.orange;
      var result = //
          case2(valueInput, {
        TwoFruits.orange: "oh, love my oranges",
        TwoFruits.peach: "oooo, what a lovely soft peach",
      });
      expect(result, "oh, love my oranges");
    });

    test("2 exception if no option is found", () {
      var valueInput = TwoFruits.peach;

      expect(
          () => //
              case2(valueInput, {
                TwoFruits.orange: "oh, love my oranges",
              }),
          throwsA(predicate((e) => e is Exception)));
    });
  });

  group("caseByType", () {
    test("1", () {
      var valueInput = Orange();
      var result = //
          caseByType<Fruit, String>(valueInput, {
        Orange: "oh, love my oranges",
        Peach: "oooo, what a lovely soft peach",
      });
      expect(result, "oh, love my oranges");
    });

    test("2", () {
      var valueInput = Peach();
      var result = //
          caseByType<Fruit, String>(valueInput, {
        Orange: "oh, love my oranges",
        Peach: "oooo, what a lovely soft peach",
      });
      expect(result, "oooo, what a lovely soft peach");
    });

    test("3", () {
      var valueInput = Fruit();
      var result = //
          caseByType<Fruit, String>(valueInput, //
              {
            Orange: "oh, love my oranges",
            Peach: "oooo, what a lovely soft peach",
          });
      expect(result, null);
    });
  });
}
