import 'package:adi_helpers/stringH.dart';
import 'package:adi_helpers/testH.dart';
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
  final fnDef5 = "f5() → String";

  group("getInBracketsRight", () {
    void exp_getInBracketsRight(String input, String expected) =>
        expectGen((x) => getInBracketsRight(x), input, expected);

    test(
        "getInBracketsRight1",
        () => exp_getInBracketsRight(
            "out b4((inner) outer)out aft", "((inner) outer)"));
    test("getInBracketsRight2", () => exp_getInBracketsRight(fnDef5, "()"));
    test(
        "getInBracketsRight3",
        () => exp_getInBracketsRight(
            "bl(blim) (plumpy(stumpy))", "(plumpy(stumpy))"));
  });

  group("firstWord", () {
    void exp_firstWord(String input, String expected) =>
        expectGen(firstWord, input, expected);

    test("firstWord1", () => exp_firstWord("blah blim", "blah"));
    test("firstWord2", () => exp_firstWord("blah<blim> fn", "blah<blim>"));
    test("firstWord3", () => exp_firstWord("", ""));
  });

  group("bracketPositionRight", () {
    void exp_bracketPositionRight(String input, Optional<StrPos> expected) =>
        expectGen(bracketPositionRight, input, expected);

    test(
        "bracketPositionRight1",
        () => exp_bracketPositionRight("bl(blim) (plumpy(stumpy))",
            Optional.fromNullable(StrPos(10, 24))));
    test(
        "bracketPositionRight2",
        () => exp_bracketPositionRight("sd()fsdf(l1a(l2a)l1b(l2a)l1c",
            Optional.fromNullable(StrPos(21, 24))));
    test(
        "bracketPositionRight3",
        () => exp_bracketPositionRight("sd()fsdf(l1a(l2a)l1b(l2a)l1c)",
            Optional.fromNullable(StrPos(9, 28))));
    test("bracketPositionRight4",
        () => exp_bracketPositionRight("", Optional.absent()));

    test("bracketPositionRight5", () {
      var input = "sd()fsdf(l1a(l2a)l1b(l2a)l1c";
      var expected = "l2a";
      var stringInBrackets = bracketPositionRight(input);
      var result = input.substring(
          stringInBrackets.value.start, stringInBrackets.value.end);
      expect(result, expected);
    });
  });

  group("bracketPositionLeft", () {
    void exp_bracketPositionLeft(String source, Optional<StrPos> expected) =>
        expect(bracketPositionLeft(source, BracketType.parenthesis), expected,
            reason: "input:" + source); //, expected);

    test(
        "1",
        () => exp_bracketPositionLeft("(plumpy(stumpy)) bl(blim) ",
            Optional.fromNullable(StrPos(1, 15))));
    test(
        "2",
        () => exp_bracketPositionLeft("l1b(l2a)l1csd()fsdf(l1a(l2a)l1b(l2a)l1c",
            Optional.fromNullable(StrPos(4, 7))));
    test(
        "3",
        () => exp_bracketPositionLeft("fsdf(l1a(l2a)l1b(l2a)l1c)sd()",
            Optional.fromNullable(StrPos(5, 24))));
    test("4", () => exp_bracketPositionLeft("", Optional.absent()));

    test("bracketPositionRight5", () {
      var input = "sd()fsdf(l1a(l2a)l1b(l2a)l1c";
      var expected = "l2a";
      var stringInBrackets = bracketPositionRight(input);
      var result = input.substring(
          stringInBrackets.value.start, stringInBrackets.value.end);
      expect(result, expected);
    });
  });

  group("findOutsideOfBrackets", () {
    void exp_findOutsideOfBrackets(BracketType bracketType, String source,
        String pattern, List<int> expected) {
      var r = findOutsideOfBrackets(bracketType, source, pattern);
      expect(r.toString(), expected.toString());
    }

    test("1", () {
      exp_findOutsideOfBrackets(
          BracketType.angled, "aa{a,a}a<a,a>a,a", ",", [4, 14]);
    });
  });

  group("splitByIndices", () {
    void exp_splitByIndices(
        String source, List<int> positions, List<String> expected) {
      var r = splitByIndices(source, positions);
      expect(r.toString(), expected.toString());
    }

    test("1", () {
      exp_splitByIndices(
          "aa{a,a}a<a,a>a,a", [4, 14], ["aa{a", ",a}a<a,a>a", ",a"]);
    });
    test("2", () {
      exp_splitByIndices("ecran", [], ["ecran"]);
    });
  });

  group("splitByLastOf", () {
    void exp_splitByLastOf(
        String source, String pattern, List<String> expected) {
      var r = splitByLastOf(source, pattern);
      expect(r, expected);
    }

    test("1", () {
      exp_splitByLastOf("this is a test", " ", ["this is a", "test"]);
    });
  });
}
