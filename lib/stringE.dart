import 'package:basic_utils/basic_utils.dart';

//extension methods for string
extension String_AdiHelpers on String {
  bool isNullOrEmpty() {
    return StringUtils.isNullOrEmpty(this);
  }

  bool isNotNullOrEmpty() {
    return StringUtils.isNotNullOrEmpty(this);
  }
}
