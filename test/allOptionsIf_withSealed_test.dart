import 'package:test/test.dart';

void main() {
  group("slkdjf", () {
    test("0 ", () {
      expect(true, true);
    });
  });
}


// import 'package:adi_helpers/allOptionsIf.dart';
// import 'package:test/test.dart';
//
// import 'allOptionsIf_test.dart';
//
// sealed class Vehicle {
//   String get colour;
// }
//
// class Car implements Vehicle {
//   final String colour;
//   final String fuelType;
//
//   Car(this.colour, this.fuelType);
// }
//
// class SUV implements Car {
//   final String colour;
//   final String fuelType;
//   final String driveType;
//
//   SUV(this.colour, this.fuelType, this.driveType);
// }
//
// class Bicycle implements Vehicle {
//   final String colour;
//
//   Bicycle(this.colour);
// }
//
// void main() {
// //   group("allOptionsIf", () {
// //     test("1", () {
// //       var valueInput = TwoFruits.orange;
// //       var result = allOptionsIf(valueInput, {
// //         TwoFruits.orange: () => "oh, love my oranges",
// //         TwoFruits.peach: () => "oooo, what a lovely soft peach",
// //       });
// //       expect(result, "oh, love my oranges");
// //     });
// //
// //     test("2 exception if no option is found", () {
// //       var valueInput = TwoFruits.peach;
// //
// //       expect(
// //           () => allOptionsIf(valueInput, {
// //                 TwoFruits.orange: () => "oh, love my oranges",
// //               }),
// //           throwsA(predicate((dynamic e) => e is Exception)));
// //     });
// //
// //     test("3 default option, if not found", () {
// //       var valueInput = TwoFruits.peach;
// //
// //       var result = allOptionsIf(
// //         valueInput,
// //         {TwoFruits.orange: () => "oh, love my oranges"},
// //         null,
// //         "nothing",
// //       );
// //       expect(result, "nothing");
// //     });
// //
// //     test("4 fall through...multiple options with the same result", () {
// //       var valueInput = ThreeFruits.orange;
// //       var result = allOptionsIf(
// //         valueInput,
// //         {ThreeFruits.peach: () => "eat it"},
// //         {
// //           [ThreeFruits.orange, ThreeFruits.banana]: () => "peel it"
// //         },
// //       );
// //       expect(result, "peel it");
// //     });
// // //
// // //    test("5 ", () {
// // //      var valueInput = Orange;
// // //      var result = allOptionsIf_1(
// // //        valueInput,
// // //        OptionItem(),
// // ////        {Peach: (x) => "eat it"},
// // //        {
// // //          [ThreeFruits.orange, ThreeFruits.banana]: () => "peel it"
// // //        },
// // //      );
// // //      expect(result, "peel it");
// // //    });
// //   });
//
//   group("case2", () {
//     test("1", () {
//       var valueInput = TwoFruits.orange;
//       var result = //
//       case2(valueInput, {
//         TwoFruits.orange: "oh, love my oranges",
//         TwoFruits.peach: "oooo, what a lovely soft peach",
//       });
//       expect(result, "oh, love my oranges");
//     });
//   });
// });
// }
