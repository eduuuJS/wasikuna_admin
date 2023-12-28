import 'package:flutter/material.dart';

abstract class Helpers {
  static TimeOfDay stringFormatToTime(String timeString) {
    final RegExp timeRegExp = RegExp(r'^(\d{1,2}):(\d{2}) (am|pm)$');
    final match = timeRegExp.firstMatch(timeString);

    if (match != null) {
      final hour = int.parse(match.group(1)!);
      final minute = int.parse(match.group(2)!);
      final period = match.group(3);

      if (period == "am" && hour == 12) {
        return TimeOfDay(hour: 0, minute: minute);
      } else if (period == "pm" && hour != 12) {
        return TimeOfDay(hour: hour + 12, minute: minute);
      } else {
        return TimeOfDay(hour: hour, minute: minute);
      }
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }

  static String timeOfDayToStringformat(TimeOfDay timeOfDay) {
    final int hour = timeOfDay.hour;
    final int minute = timeOfDay.minute;

    if (hour >= 0 && hour < 12) {
      if (hour == 0) {
        return '12:${minute.toString().padLeft(2, '0')} am';
      } else {
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} am';
      }
    } else {
      if (hour == 12) {
        return '12:${minute.toString().padLeft(2, '0')} pm';
      } else {
        return '${(hour - 12).toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} pm';
      }
    }
  }
}
