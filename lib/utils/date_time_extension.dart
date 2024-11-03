extension DateTimeExtension on DateTime {
  static DateTime fromSecondsSinceMidnight(int secondsSinceMidnight) {
    final int hours = secondsSinceMidnight ~/ 3600;
    final int minutes = (secondsSinceMidnight % 3600) ~/ 60;
    final int seconds = secondsSinceMidnight % 60;
    final DateTime today = DateTime.now();
    return DateTime(
      today.year,
      today.month,
      today.day,
      hours,
      minutes,
      seconds,
    );
  }

  int toSecondsSinceMidnight() {
    return hour * 3600 + minute * 60 + second;
  }
}
