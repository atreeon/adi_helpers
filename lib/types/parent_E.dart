import 'package:adi_helpers/types/Parent.dart';

extension parent_E<T> on Parent<T> {
  String toString2(String Function(T) fnGetString) {
    return this.toT2(fnGetString).toString();
  }

  Parent<T2> toT2<T2>(T2 Function(T) fnGetT2) {
    if (this.parent == null) {
      return Parent(value: fnGetT2(this.value));
    }

    return Parent(value: fnGetT2(this.value), parent: this.parent!.toT2(fnGetT2));
  }
}
