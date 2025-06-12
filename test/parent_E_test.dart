import 'package:adi_helpers/types/Parent.dart';
import 'package:adi_helpers/types/parent_E.dart';
import 'package:test/test.dart';

class Person {
  final int id;
  final String name;
  final int age;

  Person(this.id, this.name, this.age);
}

void main() {
  group("toString", () {
    test("0 no parent", () {
      var parent = Parent(value: 1);
      var result = parent.toString();

      var expected = "[1]";
      expect(result, expected);
    });

    test("1 one parent", () {
      var parent = Parent(value: 2, parent: Parent(value: 1));
      var result = parent.toString();

      var expected = "[2[1]]";
      expect(result, expected);
    });

    test("2 parents", () {
      var parent = Parent(value: 3, parent: Parent(value: 2, parent: Parent(value: 1)));
      var result = parent.toString();

      var expected = "[3[2[1]]]";
      expect(result, expected);
    });

    test("3 parents", () {
      var parent = Parent(value: 4, parent: Parent(value: 3, parent: Parent(value: 2, parent: Parent(value: 1))));
      var result = parent.toString();

      var expected = "[4[3[2[1]]]]";
      expect(result, expected);
    });
  });

  group("toString2", () {
    test("0a no parent", () {
      var parent = Parent(value: Person(1, "Bob", 77));
      var result = parent.toString2((x) => x.id.toString());

      var expected = "[1]";
      expect(result, expected);
    });

    test("1a one parent", () {
      var parent = Parent(value: Person(2, "Colin", 79), parent: Parent(value: Person(1, "Bob", 77)));
      var result = parent.toString2((x) => x.id.toString());

      var expected = "[2[1]]";
      expect(result, expected);
    });

    test("2a parents", () {
      var parent = Parent(value: Person(3, "Dave", 84), parent: Parent(value: Person(2, "Colin", 79), parent: Parent(value: Person(1, "Bob", 77))));
      var result = parent.toString2((x) => x.id.toString());

      var expected = "[3[2[1]]]";
      expect(result, expected);
    });

    test("3a parents", () {
      var parent = Parent(value: Person(4, "Erol", 67), parent: Parent(value: Person(3, "Dave", 84), parent: Parent(value: Person(2, "Colin", 79), parent: Parent(value: Person(1, "Bob", 77)))));
      var result = parent.toString2((x) => x.id.toString());

      var expected = "[4[3[2[1]]]]";
      expect(result, expected);
    });
  });

  group("toT2", () {
    test("0b no parent", () {
      var parent = Parent(value: Person(1, "Bob", 77));
      var result = parent.toT2((x) => x.id);

      var expected = "[1]";
      expect(result.toString(), expected);
    });

    test("1b one parent", () {
      var parent = Parent(value: Person(2, "Colin", 79), parent: Parent(value: Person(1, "Bob", 77)));
      var result = parent.toT2((x) => x.id);

      var expected = "[2[1]]";
      expect(result.toString(), expected);
    });

    test("2b parents", () {
      var parent = Parent(value: Person(3, "Dave", 84), parent: Parent(value: Person(2, "Colin", 79), parent: Parent(value: Person(1, "Bob", 77))));
      var result = parent.toT2((x) => x.id);

      var expected = "[3[2[1]]]";
      expect(result.toString(), expected);
    });

    test("3b parents", () {
      var parent = Parent(value: Person(4, "Erol", 67), parent: Parent(value: Person(3, "Dave", 84), parent: Parent(value: Person(2, "Colin", 79), parent: Parent(value: Person(1, "Bob", 77)))));
      var result = parent.toT2((x) => x.id);

      var expected = "[4[3[2[1]]]]";
      expect(result.toString(), expected);
    });
  });
}
