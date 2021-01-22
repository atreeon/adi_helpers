///Strip out the time portion from a DateTime value
DateTime dateOnly(DateTime dt) {
  return new DateTime(dt.year, dt.month, dt.day);
}

///now, but without the time portion (plus [days] if passed in)
DateTime nowDateOnly({int days}) {
  var date = dateOnly(new DateTime.now());

  if (days != null) {
    date = date.add(new Duration(days: days));
  }

  return date;
}
