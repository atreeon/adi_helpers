import 'package:adi_helpers/linqH.dart';
import 'package:collection/collection.dart' as col;
import 'package:quiver/core.dart';
import 'package:test/test.dart';

void main() {
  var eq = const col.DeepCollectionEquality().equals;

  group("max", () {
    test("0", () {
      var items = [1, 4, 2, 6, 7, 2];
      var result = max(items);
      expect(result, 7);
    });

    test("1", () {
      var items = [0, 0, 0];
      var result = max(items);
      expect(result, 0);
    });
  });

  group("groupBy", () {
    test("0", () {
      var people = new List<_Person>.from(
          [new _Person(1, "Bob"), new _Person(2, "Bob"), new _Person(3, "Max")]);

      var expected = new List<List<_Person>>.from([
        [new _Person(1, "Bob"), new _Person(2, "Bob")],
        [new _Person(3, "Max")]
      ]);

      var result = groupBy<_Person, String>(people, by: (val) => val.name);

      var areEqual = eq(result, expected);
      expect(areEqual, true);
    });
  });

  group("leftJoin", () {
    test("basic", () {
      var people = [new _Person(1, "Bob"), new _Person(2, "Bob"), new _Person(3, "Max")];

      var peopleToUpdate = [new _Person(2, "Bobby"), new _Person(3, "Max Stanley")];

      var expected = [new _Person(1, "Bob"), new _Person(2, "Bobby"), new _Person(3, "Max Stanley")]
          .map((f) => f.toString())
          .toList();

      var result = people
          .expand<_Person>((_Person p) {
            var peopleMatch = peopleToUpdate.where((_Person p2U) => p.id == p2U.id);
            return peopleMatch.isEmpty ? [p] : peopleMatch;
          })
          .map((f) => f.toString())
          .toList();

      var areEqual = eq(result, expected);
      expect(areEqual, true);
    });
  });
}

class _Person {
  int id;
  String name;

  _Person(this.id, this.name);

  String toString() {
    return '$id name:$name';
  }

  bool operator ==(o) => o is _Person && name == o.name && id == o.id;
  int get hashCode => hash2(name.hashCode, id.hashCode);
}
