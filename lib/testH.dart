import 'package:test/test.dart';

void expectGen<Exp>(Function fnToTest, String fnDef, Exp expected) {
    expect(fnToTest(fnDef), expected, reason: "input:" + fnDef);
  }
