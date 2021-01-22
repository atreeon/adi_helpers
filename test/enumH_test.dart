import 'package:adi_helpers/enumH.dart';
import "package:test/test.dart";

enum Fruits { orange, peach, banana, apricot, clementine }

void main() {
  group("enumH", () {
    test("EnumH.string", () {
      var result = string(Fruits.apricot);
      expect(result, equals('apricot'));
    });

    test("EnumH.fromIndex", () {
      var result = Fruits.values[0];
      expect(result, Fruits.orange);
    });
  });

//  group("enumH saveAsInt", (){
//    test("EnumH.saveAsInt", () {
//      var
//    });
//  });
}
