import 'package:adi_helpers/boolH.dart' as H;

extension Bool_E on bool {
  String short() => this == true ? "T" : "F";

  int toInt() => H.toInt(this);
}
