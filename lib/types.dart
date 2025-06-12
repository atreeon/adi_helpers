class Percentage {
  final int value;

  int call() => value;

  Percentage(
    this.value,
  ) : assert(value >= 0 && value <= 100);
}
