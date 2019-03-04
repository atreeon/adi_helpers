TOutput allOptionsIf<TOptionType, TOutput>(
    TOptionType selectedOption, Map<TOptionType, TOutput Function()> branches,
    [TOutput defaultValue = null]) {
//I was hoping to check all the options but this is impossible
//  without reflection or explicitly passing in all the options.
//I could pass in a list of values but this would be silly because
//  it would be a manual process and I'm trying to stop manual processes!
  if (!branches.keys.any((x) => x == selectedOption)) {
    if (defaultValue == null) {
      throw Exception(
          "option in allOptionsIf not found:" + selectedOption.toString());
    } else {
      return defaultValue;
    }
  }

  var fn = branches[selectedOption];

  return fn();
}
