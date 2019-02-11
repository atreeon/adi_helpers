import 'package:adi_helpers/regexH.dart';
import 'package:quiver/core.dart';

///Finds the brackets furthest to the right '(L) (R)'
///inp: bl(blim) (plumpy(stumpy))
///out: (plumpy(stumpy))
String getInBracketsRight(String input) {
  var pos = bracketPositionRight(input);
  if (pos.isEmpty) return "";
  var r = input.substring(pos.value.start - 1, pos.value.end + 1);
  return r;
}

///Gets the first full word from the beginning of the text
///delimited by a space
///inp: blah<blim> fn
///out: blah<blim>
String firstWord(String source) {
  return regEx1(r"([^\s]+)", source);
}

///Finds the brackets furthest to the right '(L) (R)'
///Returns a start and end position
///inp: bl(blim) (plumpy(stumpy))
///out: 10, 24;
Optional<StrPos> bracketPositionRight(String source) {
  //remove bracket and space to the right
  var startIndex = source.lastIndexOf(')') - 1; //

  //per char check for closing bracket
  var bracketCount = -1;
  for (var i = startIndex; i >= 0; i--) {
    if (source[i] == '(') bracketCount++;
    if (source[i] == ')') bracketCount--;

    if (bracketCount == 0)
      return Optional.fromNullable(StrPos(i + 1, startIndex + 1));
  }

  return Optional.absent();
}

///Gets the starting positions of the pattern inside brackets
///inp: aaa,aaaa<aa,a,>aa,a |
///out: [3,17]
List<int> findOutsideOfBrackets(
    BracketType bracketType, String source, String pattern) {
  var bracket = getBracket(bracketType);

  var level = 0;
  var x1 = StringBuffer();
  source.runes.forEach((x) {
    var char = String.fromCharCode(x);
    if (char == bracket.start) level++;
    if (char == bracket.end) level--;
    x1.write(level == 0 ? char : "¬");
  });
  var x2 = x1.toString();

  var rgx = RegExp(pattern);
  var r = rgx.allMatches(x2).map((x) => x.start).toList();
  return r;
}

enum BracketType { angled, curly, square, parenthesis }

///A container to record the starting and ending bracket characters
class Bracket {
  final BracketType bracketType;
  final String start;
  final String end;

  Bracket(this.bracketType, this.start, this.end);
}
 
///The data for Bracket
final bracketData = [
  Bracket(BracketType.angled, "<", ">"),
  Bracket(BracketType.curly, "{", "}"),
  Bracket(BracketType.square, "[", "]"),
  Bracket(BracketType.parenthesis, "(", ")"),
];

///Gets the related bracket data line for the bracket type
Bracket getBracket(BracketType bracketType) =>
    bracketData.firstWhere((x) => x.bracketType == bracketType);

///Splits a string at the indices passed in
List<String> splitByIndices(String source, List<int> positions) {
  if (positions.length == 0) return [source];

  if (positions[0] != 0) positions.insert(0, 0);
  if (positions[positions.length - 1] != source.length)
    positions.insert(positions.length, source.length);

  var x1 = List<String>();
  for (var i = 0; i < positions.length - 1; i++) {
    x1.add(source.substring(positions[i], positions[i + 1]));
  }

  return x1;
}

///Splits a string into two where it finds the pattern
/// closest to the right of the string
List<String> splitByLastOf(String source, String pattern) {
  var i = source.lastIndexOf(pattern);
  var r = [source.substring(0, i), source.substring(i + 1)];
  return r;
}

///Object to record the start and end positions in a string
class StrPos {
  final int start;
  final int end;
  StrPos(this.start, this.end);

  toString() => "$start,$end";

  bool operator ==(o) => o is StrPos && start == o.start && end == o.end;
  int get hashCode => hash2(start.hashCode, end.hashCode);
}
