DateTime dateOnly(DateTime dt) {
  return new DateTime(dt.year, dt.month, dt.day);
}

DateTime nowDateOnly({int days}) {
  var date = dateOnly(new DateTime.now());

  if (days != null) {
    date = date.add(new Duration(days: days));
  }

  return date;
}
