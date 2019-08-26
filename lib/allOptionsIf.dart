//Just an if statement but it breaks if not all options for
//  an enum are handled
TOutput allOptionsIf<TOptionType, TOutput>(
  TOptionType selectedOption,
  Map<TOptionType, TOutput Function()> branches, [
  Map<List<TOptionType>, TOutput Function()> branchesSameResult,
  TOutput defaultValue = null,
]) {
//I was hoping to check all the options but this is impossible
//  without reflection or explicitly passing in all the options.
//I could do this if it was an enum, a string, an int etc
//  it would be very costly so I should only do it in dev (use assert)
//I could pass in a list of values but this would be silly because
//  it would be a manual process and I'm trying to stop manual processes!

  var branchesAll = Map<TOptionType, TOutput Function()>();

  if (branchesSameResult != null) {
    var keys = branchesSameResult.keys.toList();
    var result1 = keys.expand((x) => x).toList();
    result1.forEach((x) => branchesAll[x] = branchesSameResult[
        branchesSameResult.keys.firstWhere((z) => z.any((y) => y == x))]);
  }

  branchesAll.addAll(branches);

  if (!branchesAll.keys.any((x) => x == selectedOption)) {
    if (defaultValue == null) {
      throw Exception(
          "option in allOptionsIf not found:" + selectedOption.toString());
    } else {
      return defaultValue;
    }
  }

  var fn = branchesAll[selectedOption];

  return fn();
}

TValue case2<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<TOptionType, TValue> branches, [
  TValue defaultValue = null,
]) {
  if (!branches.keys.any((x) => x == selectedOption)) {
    return defaultValue;
  }

  var value = branches[selectedOption];

  return value;
}

TValue caseByType<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<Type, TValue> branches, [
  TValue defaultValue = null,
]) {
  var type = selectedOption.runtimeType;
  if (branches.keys
      .where((x) => //
          x == type)
      .isEmpty) {
    return defaultValue;
  }

  var key = branches.keys.where((x) => x == type).first;
  var value = branches[key];

  return value;
}
