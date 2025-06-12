import 'package:adi_helpers/sortAdi.dart';
import 'package:test/test.dart';

class Person {
  final String name;
  final int id;
  final int orderId;
  final String type;

  Person({
    required this.name,
    required this.id,
    required this.orderId,
    required this.type,
  });

  Person copyWithOrderId(int newOrderId) {
    return Person(
      name: this.name,
      id: this.id,
      orderId: newOrderId,
      type: this.type,
    );
  }
}

void main() {
  group("emptyList", () {
    var sut = SortAdi<Person>(
      fnGetOrderId: (x) => x.orderId,
      fnGetId: (x) => x.id,
      fnGetSubList: (x) => x.where((element) => element.type == "A").toList(),
      copyWithUpdateOrderId: (p, orderId) => p.copyWithOrderId(orderId),
    );

    test("0 id not found throws exception", () {
      expect(
          () => sut.call(
                id: 6,
                sortDirection: SortDirection.up,
                existingList: [
                  Person(name: "A", id: 1, orderId: 0, type: "A"),
                  Person(name: "B", id: 2, orderId: 0, type: "A"),
                  Person(name: "C", id: 3, orderId: 0, type: "A"),
                  Person(name: "D", id: 4, orderId: 0, type: "A"),
                  Person(name: "E", id: 5, orderId: 0, type: "A"),
                ],
              ),
          throwsA(predicate((dynamic e) => e is Exception)));
    });

    test("1 no next item in list -> keep id the same", () {
      var result = sut.call(
        id: 5,
        sortDirection: SortDirection.up,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 10000, type: "A"),
          Person(name: "C", id: 3, orderId: 20000, type: "A"),
          Person(name: "D", id: 4, orderId: 30000, type: "A"),
          Person(name: "E", id: 5, orderId: 40000, type: "A"),
        ],
      ).orderId;

      expect(result, 40000);
    });

    test("2 no previous item in list -> keep id the same", () {
      var result = sut.call(
        id: 1,
        sortDirection: SortDirection.down,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 10000, type: "A"),
          Person(name: "C", id: 3, orderId: 20000, type: "A"),
          Person(name: "D", id: 4, orderId: 30000, type: "A"),
          Person(name: "E", id: 5, orderId: 40000, type: "A"),
        ],
      ).orderId;

      expect(result, 0);
    });

    test("3 moves item in list to max position", () {
      var result = sut.call(
        id: 4,
        sortDirection: SortDirection.up,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 10000, type: "A"),
          Person(name: "C", id: 3, orderId: 20000, type: "A"),
          Person(name: "D", id: 4, orderId: 30000, type: "A"),
          Person(name: "E", id: 5, orderId: 40000, type: "A"),
        ],
      ).orderId;

      expect(result, 50000);
    });

    test("4 moves item down in list to min position", () {
      var result = sut.call(
        id: 2,
        sortDirection: SortDirection.down,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 10000, type: "A"),
          Person(name: "C", id: 3, orderId: 20000, type: "A"),
          Person(name: "D", id: 4, orderId: 30000, type: "A"),
          Person(name: "E", id: 5, orderId: 40000, type: "A"),
        ],
      ).orderId;

      expect(result, -10000);
    });

    test("5 moves item up in list to an in between position", () {
      var result = sut.call(
        id: 3,
        sortDirection: SortDirection.up,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 10000, type: "A"),
          Person(name: "C", id: 3, orderId: 20000, type: "A"),
          Person(name: "D", id: 4, orderId: 30000, type: "A"),
          Person(name: "E", id: 5, orderId: 40000, type: "A"),
        ],
      ).orderId;

      expect(result, 35000);
    });

    test("6 moves item down in list to an in between position", () {
      var result = sut.call(
        id: 3,
        sortDirection: SortDirection.down,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 10000, type: "A"),
          Person(name: "C", id: 3, orderId: 20000, type: "A"),
          Person(name: "D", id: 4, orderId: 30000, type: "A"),
          Person(name: "E", id: 5, orderId: 40000, type: "A"),
        ],
      ).orderId;

      expect(result, 5000);
    });

    test("7 all orderIds are zero", () {
      var result = sut.call(
        id: 3,
        sortDirection: SortDirection.down,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 0, type: "A"),
          Person(name: "C", id: 3, orderId: 0, type: "A"),
          Person(name: "D", id: 4, orderId: 0, type: "A"),
          Person(name: "E", id: 5, orderId: 0, type: "A"),
        ],
      ).orderId;

      expect(result, -10000);
    });

    test("8 all orderIds are zero order up", () {
      var result = sut.call(
        id: 3,
        sortDirection: SortDirection.up,
        existingList: [
          Person(name: "A", id: 1, orderId: 0, type: "A"),
          Person(name: "B", id: 2, orderId: 0, type: "A"),
          Person(name: "C", id: 3, orderId: 0, type: "A"),
          Person(name: "D", id: 4, orderId: 0, type: "A"),
          Person(name: "E", id: 5, orderId: 0, type: "A"),
        ],
      ).orderId;

      expect(result, 10000);
    });

    test("9 with two", () {
      var result = sut.call(
        id: 2,
        sortDirection: SortDirection.down,
        existingList: [
          Person(name: "Wine", id: 1, orderId: 50000, type: "A"),
          Person(name: "Jazz", id: 2, orderId: 60000, type: "A"),
        ],
      ).orderId;

      expect(result, 40000);
    });

    test("10 with two", () {
      var result = sut.call(
        id: 2,
        sortDirection: SortDirection.down,
        existingList: [
          Person(name: "Wine", id: 1, orderId: 0, type: "A"),
          Person(name: "Jazz", id: 2, orderId: 10000, type: "A"),
        ],
      ).orderId;

      expect(result, -10000);
    });

    //all orderIds are zero
  });
}
