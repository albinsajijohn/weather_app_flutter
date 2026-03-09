import 'package:intl/intl.dart';

class WeatherDays {

  static String getDayLabel(String date) {

    final parsedDate = DateTime.parse(date);
    final today = DateTime.now();

    final difference =
        parsedDate.difference(DateTime(today.year, today.month, today.day)).inDays;

    if (difference == 0) {
      return "Today";
    }

    if (difference == 1) {
      return "Tomorrow";
    }

    return DateFormat('EEE').format(parsedDate);
  }

}