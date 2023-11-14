import 'package:adi_helpers/sortOrder/isIntegersInSequence.dart';
import 'package:equatable/equatable.dart';
import 'package:test/test.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final int age;

  Person(this.id, this.name, this.age);

  @override
  List<Object?> get props => [id, name, age];
}

void main() {
  group("isIntegersInSequence", () {
    test("0 list", () {
      var list = [
        Person(45, "bob", 19),
        Person(46, "rob", 12),
        Person(47, "bobby", 4),
        Person(48, "bert", 6),
      ];

      var result = isIntegersInSequence(list, (p0) => p0.id);

      expect(result, true);
    });

    test("1 missing one", () {
      var list = [
        Person(45, "bob", 19),
        Person(47, "bobby", 4),
        Person(48, "bert", 6),
      ];

      var result = isIntegersInSequence(list, (p0) => p0.id);

      expect(result, false);
    });

    test("2 minus values", () {
      var list = [
        Person(-2, "bob", 19),
        Person(-1, "bobby", 4),
        Person(0, "bert", 6),
        Person(1, "rob", 12),
      ];

      var result = isIntegersInSequence(list, (p0) => p0.id);

      expect(result, true);
    });

    test("3 duplicates", () {
      var list = [
        Person(1, "bob", 19),
        Person(2, "bobby", 4),
        Person(2, "bert", 6),
        Person(3, "rob", 12),
      ];

      var result = isIntegersInSequence(list, (p0) => p0.id);

      expect(result, false);
    });
  });
}
