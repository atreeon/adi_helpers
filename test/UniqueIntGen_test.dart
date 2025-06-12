import 'package:adi_helpers/UniqueIntGen.dart';
import 'package:test/test.dart';

void main() {
  group("uniqueIntGen", () {
    test("1", () {
      expect(UniqueIntGen().uniqueId, 0);
      expect(UniqueIntGen().uniqueId, 1);
      expect(UniqueIntGen().uniqueId, 2);
    });
  });
}