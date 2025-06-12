///Strip out the time portion from a DateTime value
DateTime dateOnly(DateTime dt) {
  return DateTime(dt.year, dt.month, dt.day);
}

///now, but without the time portion (plus [days] if passed in)
DateTime nowDateOnly({int? days}) {
  var date = dateOnly(DateTime.now());

  if (days != null) {
    date = date.add(Duration(days: days));
  }

  return date;
}
