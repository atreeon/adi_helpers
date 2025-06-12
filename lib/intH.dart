class intH {
  ///if null then returns null
  ///
  ///else returns as int.tryParse
  static int? tryParseNullable(dynamic data) {
    if (data == null) //
      return null;

    return int.tryParse(data);
  }
}
