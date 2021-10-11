class Parent<T> {
  final T value;
  final Parent<T>? parent;

  Parent({
    required this.value,
    this.parent,
  });

  @override
  String toString() {
    if (this.parent == null) {
      return "[${this.value.toString()}]";
    }

    return "[$value${this.parent.toString()}]";
  }
}
