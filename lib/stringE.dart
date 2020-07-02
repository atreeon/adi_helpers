import 'package:basic_utils/basic_utils.dart';

//extension methods for string
extension String_AdiHelpers on String {
  bool isNullOrEmpty() {
    return StringUtils.isNullOrEmpty(this);
  }

  bool isNotNullOrEmpty() {
    return StringUtils.isNotNullOrEmpty(this);
  }

  ///in: "myString".getCharsAfter("tr")
  ///out: "ing";
  String getCharsAfter(String str) {
    return this.substring(this.indexOf(str) + str.length);
  }
}
