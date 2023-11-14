import 'package:adi_helpers/sortOrder/changePositionInList.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  group("changePositionInListUp", () {
    test("a0 up", () {
      var personList = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      var result = changePositionInListUp(
        personList,
        [98651, 12345],
        (x) => x.id,
        (x) => x.orderId,
        (x, newOrderId) => Person(x.id, x.name, newOrderId),
      );

      var expected = [
        Person(98651, "rob", 0),
        Person(12345, "bobby", 1),
        Person(65481, "bob", 2),
        Person(45321, "bert", 3),
      ];

      expect(result.toString(), expected.toString());
    });

    test("a1 down", () {
      var personList = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      var result = changePositionInListDown(
        personList,
        [98651, 12345],
        (x) => x.id,
        (x) => x.orderId,
        (x, newOrderId) => Person(x.id, x.name, newOrderId),
        // direction: eDirection.down,
      );

      var expected = [
        Person(65481, "bob", 0),
        Person(45321, "bert", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
      ];

      expect(result.toString(), expected.toString());
    });

    test("a2 can't go further up", () {
      var personList = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      var result = changePositionInListUp(
        personList,
        [98651, 65481],
        (x) => x.id,
        (x) => x.orderId,
        (x, newOrderId) => Person(x.id, x.name, newOrderId),
      );

      var expected = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      expect(result.toString(), expected.toString());
    });

    test("a3 can't go further up down", () {
      var personList = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      var result = changePositionInListDown(
        personList,
        [45321, 12345],
        (x) => x.id,
        (x) => x.orderId,
        (x, newOrderId) => Person(x.id, x.name, newOrderId),
        // direction: eDirection.down,
      );

      var expected = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      expect(result.toString(), expected.toString());
    });

    test("a4 one selected down", () {
      var personList = [
        Person(65481, "bob", 1),
        Person(98651, "rob", 2),
        Person(12345, "bobby", 3),
        Person(45321, "bert", 4),
      ];

      var result = changePositionInListDown(
        personList,
        [98651],
        (x) => x.id,
        (x) => x.orderId,
        (x, newOrderId) => Person(x.id, x.name, newOrderId),
        // direction: eDirection.down,
      );

      var expected = [
        Person(65481, "bob", 0),
        Person(12345, "bobby", 1),
        Person(98651, "rob", 2),
        Person(45321, "bert", 3),
      ];

      expect(result.toString(), expected.toString());
    });

    test("a5 immutable example", () {
      var todoList = [
        Todo("a8R", "Dan", 0.0),
        Todo("EEF", "Alison", 1.0),
        Todo("YVZ", "Sam", 2.0),
        Todo("p7H", "Dave", 3.0),
      ];

      var result = changePositionInListDown(
        todoList,
        ["EEF"],
        (x) => x.id,
        (x) => x.orderId,
        (x, newOrderId) => Todo(x.id, x.description, newOrderId),
        // direction: eDirection.down,
      );

      var expected = [
        Todo("a8R", "Dan", 0.0),
        Todo("YVZ", "Sam", 1.0),
        Todo("EEF", "Alison", 2.0),
        Todo("p7H", "Dave", 3.0),
      ];

      expect(result.toString(), expected.toString());
    });
  });
}

@immutable
class Todo extends Equatable {
  final String id;
  final String description;
  final double orderId;

  Todo(this.id, this.description, this.orderId);

  @override
  List<Object> get props => [id, description, orderId];
}

class Person {
  final int id;
  final String name;
  final double orderId;

  Person(this.id, this.name, this.orderId);

  @override
  String toString() {
    return 'Person{id: $id, name: $name, orderId: $orderId}';
  }
}
