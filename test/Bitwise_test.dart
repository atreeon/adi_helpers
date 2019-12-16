import 'package:adi_helpers/Bitwise.dart';
import 'package:test_api/test_api.dart';

enum FrontEndOptionType {
  showStars,
  showFlashOnTypedTest,
  autoProgressOnCorrect,
}

var wadFrontEndOptions = Bitwise<FrontEndOptionType>([
  BitwiseOption<FrontEndOptionType>(FrontEndOptionType.showStars, 1),
  BitwiseOption<FrontEndOptionType>(FrontEndOptionType.showFlashOnTypedTest, 2),
  BitwiseOption<FrontEndOptionType>(
      FrontEndOptionType.autoProgressOnCorrect, 4),
]);

void main() {
  group("bitwiseOptions", () {
    test("0. set all options", () {
      var result = wadFrontEndOptions.setAllOptions([
        FrontEndOptionType.autoProgressOnCorrect,
        FrontEndOptionType.showFlashOnTypedTest,
      ]);

      expect(result, 6);
    });

    test("1. isSet", () {
      var initial = wadFrontEndOptions.setAllOptions([
        FrontEndOptionType.autoProgressOnCorrect,
        FrontEndOptionType.showFlashOnTypedTest,
      ]);

      expect(wadFrontEndOptions.isSet(initial, FrontEndOptionType.showStars),
          false);
      expect(
          wadFrontEndOptions.isSet(
              initial, FrontEndOptionType.showFlashOnTypedTest),
          true);
    });

    test("2. optionToFalse", () {
      var initial = wadFrontEndOptions.setAllOptions([
        FrontEndOptionType.autoProgressOnCorrect,
        FrontEndOptionType.showFlashOnTypedTest,
      ]);

      final changed = wadFrontEndOptions.optionToFalse(
          initial, FrontEndOptionType.autoProgressOnCorrect);

      expect(
          wadFrontEndOptions.isSet(
              changed, FrontEndOptionType.autoProgressOnCorrect),
          false);
    });

    test("3. optionToTrue", () {
      var initial = wadFrontEndOptions.setAllOptions([
        FrontEndOptionType.showFlashOnTypedTest,
      ]);

      final changed = wadFrontEndOptions.optionToTrue(
          initial, FrontEndOptionType.autoProgressOnCorrect);

      expect(
          wadFrontEndOptions.isSet(
              changed, FrontEndOptionType.autoProgressOnCorrect),
          true);
    });

    test("3. toggleOption", () {
      var initial = wadFrontEndOptions.setAllOptions([
        FrontEndOptionType.showFlashOnTypedTest,
      ]);

      final changed = wadFrontEndOptions.toggleOption(
          initial, FrontEndOptionType.autoProgressOnCorrect);

      expect(
          wadFrontEndOptions.isSet(
              changed, FrontEndOptionType.autoProgressOnCorrect),
          true);
    });
  });
}
