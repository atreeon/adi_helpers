//import 'package:basic_utils/basic_utils.dart';

//extension methods for nullable strings
extension String_nullable_E on String? {
  bool isNullOrEmpty() {
    return (this == null || this?.length == 0);
  }

  bool isNotNullOrEmpty() {
    return !this.isNullOrEmpty();
  }

  ///if string is empty then return null, else return string
  ///
  /// "blah" => "blah"
  /// "" => null
  /// null => null
  String? ifEmptyNull() {
    if (this == "") //
      return null;

    return this;
  }

  int? toIntOrNull() {
    if (this == "" || this == null) //
      return null;

    return int.parse(this!);
  }
}

//extension methods for nullable strings
extension String_E on String {
  bool isNullOrEmpty() {
    return (this.length == 0);
  }

  bool isNotNullOrEmpty() {
    return !this.isNullOrEmpty();
  }

  ///in: "myString".getCharsAfter("tr")
  ///out: "ing";
  String getCharsAfter(String str) {
    return this.substring(this.indexOf(str) + str.length);
  }

  ///if string is empty then return null, else return string
  ///
  /// "blah" => "blah"
  /// "" => null
  /// null => null
  String? ifEmptyNull() {
    if (this == "") //
      return null;

    return this;
  }

  int? toIntOrNull() {
    if (this == "") //
      return null;

    return int.parse(this);
  }

  //("blah 1 blah2 9 3") == 9
  int? getMaxIntegerOfAString() {
    var maxNumber = this //
        .split('')
        .fold<int>(
      0,
      (previousValue, element) {
        var value = int.tryParse(element);

        if (value == null || value <= previousValue) //
          return previousValue;

        return value;
      },
    );
    return maxNumber;
  }
}
