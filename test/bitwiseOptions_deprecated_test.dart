import 'package:adi_helpers/bitwiseOptions_deprecated.dart';
import 'package:test/test.dart';

class Settings {
  static const ShowFlashImageOnTests = 1;
  static const AutoProgressOnCorrect = 2;
  static const ShowStars = 4;
}

void main() {
  group("bitwiseOptions", () {
    test("0. set all options", () {
      var result = setAllOptions([Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);

      expect(result, 3);
    });

    test("1. isSet", () {
      var initial = setAllOptions([Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);

      expect(isSet(initial, Settings.AutoProgressOnCorrect), true);
    });

    test("2. isSet", () {
      var initial = setAllOptions([Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);

      expect(isSet(initial, Settings.ShowStars), false);
    });

    test("3. optionToTrue", () {
      final initial = setAllOptions([Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);
      final result = optionToTrue(initial, Settings.ShowStars);

      expect(isSet(result, Settings.ShowStars), true);
    });

    test("4. optionToFalse", () {
      final initial = setAllOptions([Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);
      final result = optionToFalse(initial, Settings.AutoProgressOnCorrect);

      expect(isSet(result, Settings.AutoProgressOnCorrect), false);
    });
  });
}
