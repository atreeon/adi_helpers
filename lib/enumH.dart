String string<T>(T enumValue) {
  if (enumValue == null) return null;
  return enumValue.toString().split('.')[1];
}
