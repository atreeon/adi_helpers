import 'package:adi_helpers/allOptionsIf.dart';
import 'package:adi_helpers/bitwiseOptions.dart';
import 'package:test_api/test_api.dart';

class Settings {
  static const ShowFlashImageOnTests = 1;
  static const AutoProgressOnCorrect = 2;
  static const ShowStars = 4;
}

void main() {
  group("bitwiseOptions", () {
    test("0. set all options", () {
      var result = setAllOptions(
          [Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);

      expect(result, 3);
    });

    test("1. isSet", () {
      var initial = setAllOptions(
          [Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);

      expect(isSet(initial, Settings.AutoProgressOnCorrect), true);
    });

    test("2. isSet", () {
      var initial = setAllOptions(
          [Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);

      expect(isSet(initial, Settings.ShowStars), false);
    });

    test("3. optionToTrue", () {
      final initial = setAllOptions(
          [Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);
      final result = optionToTrue(initial, Settings.ShowStars);

      expect(isSet(result, Settings.ShowStars), true);
    });

    test("4. optionToFalse", () {
      final initial = setAllOptions(
          [Settings.AutoProgressOnCorrect, Settings.ShowFlashImageOnTests]);
      final result = optionToFalse(initial, Settings.AutoProgressOnCorrect);

      expect(isSet(result, Settings.AutoProgressOnCorrect), false);
    });
  });
}

//var selectedOptions = Settings.ShowStars | Settings.ShowFlashImageOnTests;
//
//if (Settings().isSet(selectedOptions, Settings.ShowStars)) {
//print("ShowStars!");
//}
//
//if (Settings().isSet(selectedOptions, Settings.AutoProgressOnCorrect)) {
//print("AutoProgressOnCorrect!");
//}
//
//selectedOptions =
//Settings().trueOption(selectedOptions, Settings.AutoProgressOnCorrect);
//
//print(selectedOptions);
//
//selectedOptions =
//Settings().trueOption(selectedOptions, Settings.AutoProgressOnCorrect);
//
//print(selectedOptions);
//
//selectedOptions =
//Settings().falseOption(selectedOptions, Settings.AutoProgressOnCorrect);
//
//print(selectedOptions);
