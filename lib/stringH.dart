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

    if (bracketCount == 0) return Optional.fromNullable(StrPos(i + 1, startIndex + 1));
  }

  return Optional.absent();
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
