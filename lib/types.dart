

class Percentage {
  final int value;

  int call() => value;

  Percentage(
    this.value,
  ) : assert(value != null && value >= 0 && value <= 100);
}
