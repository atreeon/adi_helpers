//import 'package:basic_utils/basic_utils.dart';

//extension methods for nullable strings
extension String_nullable_E on String? {
  bool isNullOrEmpty() {
    return (this == null || this?.length == 0);
  }

  bool isNotNullOrEmpty() {
    return !this.isNullOrEmpty();
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
}
