import 'package:adi_helpers/sortOrder/resetOrderIds.dart';
import 'package:test/test.dart';


void main() {
  group("resetOrderIds", () {
    test("a0", () {
      var personList = [
        Person("bob", 1),
        Person("rob", 2),
        Person("bobby", 5),
        Person("bert", 3),
      ];

      var result = resetOrderIds(
        personList,
        (x) => x.orderId,
        (x, newOrderId) => Person(x.name, newOrderId),
      );

      var expected = [
        Person("bob", 1),
        Person("rob", 2),
        Person("bert", 3),
        Person("bobby", 4),
      ];

      expect(result.toString(), expected.toString());
    });
  });
}

class Person {
  final String name;
  final double orderId;

  Person(this.name, this.orderId);
}
