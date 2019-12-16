///Returns true if we are in dev mode
/// uses assert to work out if we are in dev mode
bool get isInDevMode {
  // Assume you're in production mode.
  bool inDevMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDevMode = true);

  return inDevMode;
}
