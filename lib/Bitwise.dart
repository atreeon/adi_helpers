class BitwiseOption<T> {
  final T type;
  final int value;

  const BitwiseOption(this.type, this.value);
}

class Bitwise<T> {
  final List<BitwiseOption<T>> options;

  const Bitwise(this.options);

  int getBitwiseValue(T type) {
    return options.firstWhere((x) => x.type == type).value;
  }

  int setAllOptions(List<T> setOptions) {
    return setOptions.fold(0, (i, y) => i | getBitwiseValue(y));
  }

  bool isSet(int selectedOptions, T option) {
    return (selectedOptions & getBitwiseValue(option)) ==
        getBitwiseValue(option);
  }

  int optionToFalse(int selectedOptions, T option) {
    if (isSet(selectedOptions, option))
      return selectedOptions - getBitwiseValue(option);

    return selectedOptions;
  }

  int optionToTrue(int selectedOptions, T option) {
    if (!isSet(selectedOptions, option))
      return selectedOptions + getBitwiseValue(option);

    return selectedOptions;
  }

  int toggleOption(int selectedOptions, T option) {
    if (isSet(selectedOptions, option)) {
      return optionToFalse(selectedOptions, option);
    }

    return optionToTrue(selectedOptions, option);
  }
}

//
