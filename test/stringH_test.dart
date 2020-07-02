import 'package:adi_helpers/stringE.dart';
import 'package:adi_helpers/stringH.dart';
import 'package:adi_helpers/testH.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

void main() {
  final fnDef5 = "f5() → String";

  group("createSpaces", () {
    void exp_createSpaces(int input, String expected) => expect(createSpaces(input), expected);

    test("1", () => exp_createSpaces(5, "     "));

    test("2", () => exp_createSpaces(2, "  "));
  });

  group("getInBracketsRight", () {
    void exp_getInBracketsRight(String input, Option<String> expected) => expectGen((x) => //
        getInBracketsRight(x, BracketType.parenthesis), input, expected);

    test("1", () => exp_getInBracketsRight("out b4((inner) outer)out aft", some("((inner) outer)")));
    test("2", () => exp_getInBracketsRight(fnDef5, some("()")));
    test("3", () => exp_getInBracketsRight("bl(blim) (plumpy(stumpy))", some("(plumpy(stumpy))")));
  });

  group("firstWord", () {
    void exp_firstWord(String input, String expected) => expectGen(firstWord, input, expected);

    test("firstWord1", () => exp_firstWord("blah blim", "blah"));
    test("firstWord2", () => exp_firstWord("blah<blim> fn", "blah<blim>"));
    test("firstWord3", () => exp_firstWord("", ""));
  });

  group("bracketPositionRight", () {
    void exp_bracketPositionRight(String input, Option<StrPos> expected) => expectGen((x) => //
        bracketPositionRight(x, BracketType.parenthesis), input, expected);

    // void exp_bracketPositionRight(String input, Option<StrPos> expected) =>
    //     expectGen(bracketPositionRight, input, expected);

    test("bracketPositionRight1", () => exp_bracketPositionRight("bl(blim) (plumpy(stumpy))", some(StrPos(10, 24))));
    test("bracketPositionRight2", () => exp_bracketPositionRight("sd()fsdf(l1a(l2a)l1b(l2a)l1c", some(StrPos(21, 24))));
    test("bracketPositionRight3", () => exp_bracketPositionRight("sd()fsdf(l1a(l2a)l1b(l2a)l1c)", some(StrPos(9, 28))));
    test("bracketPositionRight4", () => exp_bracketPositionRight("", none()));

    test("bracketPositionRight5", () {
      var input = "sd()fsdf(l1a(l2a)l1b(l2a)l1c";
      var expected = some("l2a");
      var stringInBrackets = bracketPositionRight(input, BracketType.parenthesis);
      var result = stringInBrackets.bind((x) => some(input.substring(x.start, x.end)));
      expect(result, expected);
    });

//    //TODO: need to find and remove all strings and brackets & remove the brackets from there (or not count them)
//    //      workaround: no magic strings
//    test("bracketPositionRight6", () {
//      var expected = some(StrPos(3, 20));
//      var stringInBrackets =
//          bracketPositionRight(bracketRightPosData, BracketType.curly);
//      var result = stringInBrackets
//          .bind((x) => some(bracketRightPosData.substring(x.start, x.end)));
//      expect(result, expected);
//    });
  });

  group("bracketPositionLeft", () {
    void exp_bracketPositionLeft(String source, Option<StrPos> expected) => //
        expect(bracketPositionLeft(source, BracketType.parenthesis), expected, reason: "input:" + source); //, expected);

    test("1", () => exp_bracketPositionLeft("(plumpy(stumpy)) bl(blim) ", some(StrPos(1, 15))));
    test("2", () => exp_bracketPositionLeft("l1b(l2a)l1csd()fsdf(l1a(l2a)l1b(l2a)l1c", some(StrPos(4, 7))));
    test("3", () => exp_bracketPositionLeft("fsdf(l1a(l2a)l1b(l2a)l1c)sd()", some(StrPos(5, 24))));
    test("4", () => exp_bracketPositionLeft("", none()));
  });

  group("findOutsideOfBrackets", () {
    void exp_findOutsideOfBrackets(BracketType bracketType, String source, String pattern, List<int> expected) {
      var r = findOutsideOfBrackets(bracketType, source, pattern);
      expect(r.toString(), expected.toString());
    }

    test("1", () {
      exp_findOutsideOfBrackets(BracketType.angled, "aa{a,a}a<a,a>a,a", ",", [4, 14]);
    });
  });

  group("splitByIndices", () {
    void exp_splitByIndices(String source, List<int> positions, List<String> expected) {
      var r = splitByIndices(source, positions);
      expect(r.toString(), expected.toString());
    }

    test("1", () {
      exp_splitByIndices("aa{a,a}a<a,a>a,a", [4, 14], ["aa{a", ",a}a<a,a>a", ",a"]);
    });
    test("2", () {
      exp_splitByIndices("ecran", [], ["ecran"]);
    });
  });

  group("splitByLastOf", () {
    void exp_splitByLastOf(String source, String pattern, List<String> expected) {
      var r = splitByLastOf(source, pattern);
      expect(r, expected);
    }

    test("1", () {
      exp_splitByLastOf("this is a test", " ", ["this is a", "test"]);
    });
  });

  group("removePunctuation", () {
    test("1", () {
      var result = removePunctuation("something !hello, ''no?");
      expect(result, "something hello no");
    });

    test("2", () {
      var result = removePunctuation("hyph-enated and (bracketed)");
      expect(result, "hyph enated and bracketed");
    });
  });

  group("getCharsAfter", () {
    test("1 getCharsAfter", () {
      var str = "myString";
      var result = str.getCharsAfter("tr");
      expect(result, "ing");
    });
  });
}
