///Used to inherit from parent or redefine values
abstract class InheritVal<T> {}

///Used to inherit from parent or redefine values
class InheritParent<T> implements InheritVal<T> {}

///Used to inherit from parent or redefine values
class InheritOverride<T> implements InheritVal<T> {
  final T value;
  InheritOverride(this.value);
}
