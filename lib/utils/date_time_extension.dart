extension DateTimeExtension on DateTime {
  static DateTime fromSecondsSinceMidnight(int secondsSinceMidnight) {
    final int hours = secondsSinceMidnight ~/ 3600;
    final int minutes = (secondsSinceMidnight % 3600) ~/ 60;
    final int seconds = secondsSinceMidnight % 60;
    final DateTime todayUtc = DateTime.now().toUtc();
    return DateTime.utc(
      todayUtc.year,
      todayUtc.month,
      todayUtc.day,
      hours,
      minutes,
      seconds,
    );
  }

  int toSecondsSinceMidnight() {
    final utcTime = toUtc();
    return utcTime.hour * 3600 + utcTime.minute * 60 + utcTime.second;
  }
}
