bool isSet(int selectedOptions, int option) {
  return (selectedOptions & option) == option;
}

int optionToTrue(int selectedOptions, int newOption) {
  return selectedOptions | newOption;
}

int optionToFalse(int selectedOptions, int option) {
  if ((selectedOptions & option) == option) {
    return selectedOptions - option;
  }

  return selectedOptions;
}

int setAllOptions(List<int> options) {
  return options.fold(0, (i, x) => i | x);
}
