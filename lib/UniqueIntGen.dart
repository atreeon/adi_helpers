///Call to get a unique number 9223372036854775807 x2 possibilities (64 bit)
class UniqueIntGen {
  int _uniqueId = 0;

  int get uniqueId => _uniqueId++;

  UniqueIntGen._privateConstructor();
  static final UniqueIntGen _instance = UniqueIntGen._privateConstructor();
  factory UniqueIntGen() {
    return _instance;
  }
}