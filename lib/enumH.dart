///Gets the string value of the enum
String string<T>(T enumValue) {
  return enumValue.toString().split('.')[1];
}
