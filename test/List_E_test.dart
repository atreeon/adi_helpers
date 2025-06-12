import 'package:adi_helpers/List_E.dart';
import 'package:test/test.dart';

var personList = [
  Person(19, "bob", 47),
  Person(12, "rob", 45),
  Person(4, "bobby", 46),
  Person(6, "bert", 43),
];

void main() {
  group("List_H equals", () {
    test("0 list", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 2, 3];

      var result = list1.equalOrderedD(list2);

      expect(result, true);
    });

    test("1 order differs", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 3, 2];

      var result = list1.equalOrderedD(list2);

      expect(result, false);
    });

    test("2 order differs using unordered", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 3, 2];

      var result = list1.equalUnorderedD(list2);

      expect(result, true);
    });

    test("3 content differs", () {
      var list1 = [1, 2, 3];
      var list2 = [1, 3, 2, 3];

      var result = list1.equalOrderedD(list2);

      expect(result, false);
    });
  });

  group("List_H getNthByItem", () {
    test("a 0 previous", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getPreviousByItem(2);

      expect(result, 0);
    });

    test("a 1 no previous item", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getPreviousByItem(7);

      expect(result, null);
    });

    test("a 2 next", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getNextByItem(0);

      expect(result, 2);
    });

    test("a 3 no next item", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getNextByItem(3);

      expect(result, null);
    });

    test("a 4 getNthInRelationToX", () {
      var list1 = [7, 0, 2, 3];

      var result = list1.getNthInRelationToXByItem(7, 3);

      expect(result, 3);
    });
  });

  group("List_H getNthById", () {
    test("b 0 previous", () {
      var result = personList.getPreviousById((item) => item.id, 4);

      expect(result!.name, "rob");
    });

    test("b 1 no previous item", () {
      var result = personList.getPreviousById((item) => item.id, 19);

      expect(result, null);
    });

    test("b 2 next", () {
      var result = personList.getNextById((item) => item.id, 4);

      expect(result!.name, "bert");
    });

    test("b 3 no next item", () {
      var result = personList.getNextById((item) => item.id, 6);

      expect(result, null);
    });

    test("b 4 getNthInRelationToX", () {
      var result = personList.getNthInRelationToXById((item) => item.id, 6, -2);

      expect(result!.name, "rob");
    });

    test("b 5 no ", () {
      var result = personList.getNthInRelationToXById((item) => item.id, 6, -2);

      expect(result!.name, "rob");
    });
  });

  group("List_H getDuplicates", () {
    test("c 0 getDuplicates", () {
      var myList1 = [1, 3, 4, 4, 6, 7, 8, 8, 9];

      var result = myList1.getDuplicates();

      expect(result, [4, 4, 8, 8]);
    });
  });
}

class Person {
  final int id;
  final String name;
  final int age;

  Person(this.id, this.name, this.age);
}
