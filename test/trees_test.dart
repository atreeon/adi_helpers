import 'package:adi_helpers/trees.dart';
import 'package:test/test.dart';

class Employee {
  final int id;
  final List<Employee>? employees;

  Employee(this.id, this.employees);

  String toString() => "$id -> ${employees.toString()}";
}

void main() {
  final list = [
    Employee(
      1,
      [
        Employee(2, null),
        Employee(
          3,
          [
            Employee(4, null),
            Employee(5, null),
          ],
        )
      ],
    ),
    Employee(6, null),
  ];

  group("flatten", () {
    test("0. set all options", () {
      var result = flatten<Employee>(list, (x) => x.employees);

      var expected = [
        Employee(
          1,
          [
            Employee(2, null),
            Employee(
              3,
              [
                Employee(4, null),
                Employee(5, null),
              ],
            )
          ],
        ),
        Employee(2, null),
        Employee(
          3,
          [
            Employee(4, null),
            Employee(5, null),
          ],
        ),
        Employee(4, null),
        Employee(5, null),
        Employee(6, null),
      ];

      expect(result.toString(), expected.toString());
    });
  });

  group("convertTreeToMap", () {
    test("0", () {
      var result = convertTreeToMap<Employee>(list, (x) => x.id, (x) => x.employees);
      var expected = "{1: {2: null, 3: {4: null, 5: null}}, 6: null}";

      expect(result.toString(), expected);
    });
  });

//  group("convertToParentalOrder", () {
//    test("0", () {
//      var listOfConcepts = [
//        Concept(1, null),
//        Concept(2, 1),
//        Concept(3, 2),
//        Concept(4, null),
//        Concept(5, 4),
//      ];
//
//      var result = convertToParentalOrder<Concept>(listOfConcepts, (x) => x.id);
//      var expected = [
//        [
//          Concept(3, 2),
//          Concept(2, 1),
//          Concept(1, null),
//        ],
//        [
//          Concept(5, 4),
//          Concept(4, null),
//        ],
//      ];
//
//      expect(result.toString(), expected.toString());
//    });
//  });

//  group("flattenToString", () {
//    test("0", () {
//      var expected = "{1:{2:null,3:{4:null, 5:null}},6:null}";
//    });
//  });

  group("flattenR", () {
    test("0. set all options", () {
      var result = flattenR<Employee>(list[0], (x) => x.employees);

      var expected = [
        Employee(
          1,
          [
            Employee(2, null),
            Employee(
              3,
              [
                Employee(4, null),
                Employee(5, null),
              ],
            )
          ],
        ),
        Employee(2, null),
        Employee(
          3,
          [
            Employee(4, null),
            Employee(5, null),
          ],
        ),
        Employee(4, null),
        Employee(5, null),
      ];

      expect(result.toString(), expected.toString());
    });
  });
}
