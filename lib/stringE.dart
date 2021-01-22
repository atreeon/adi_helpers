import 'package:adi_helpers/exceptions.dart';
//import 'package:basic_utils/basic_utils.dart';

//extension methods for string
extension String_E on String {
  bool isNullOrEmpty() {
    throw NotImplementedException();
//    return StringUtils.isNullOrEmpty(this);
  }

  bool isNotNullOrEmpty() {
    throw NotImplementedException();
//    return StringUtils.isNotNullOrEmpty(this);
  }

  ///in: "myString".getCharsAfter("tr")
  ///out: "ing";
  String getCharsAfter(String str) {
    return this.substring(this.indexOf(str) + str.length);
  }
}
