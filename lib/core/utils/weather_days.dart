import 'package:intl/intl.dart';

import '../constants/time_constants.dart';

class WeatherDays {

  static String getDayLabel(String date) {

    final parsedDate = DateTime.parse(date);
    final today = DateTime.now();

    final difference =
        parsedDate.difference(DateTime(today.year, today.month, today.day)).inDays;

    if (difference == 0) {
      return TimeConstants.kTimeDiffZero;
    }

    if (difference == 1) {
      return TimeConstants.kTimeDiffOne;
    }

    return DateFormat(TimeConstants.KDateFor).format(parsedDate);
  }

}