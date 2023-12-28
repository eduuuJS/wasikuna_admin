import 'package:intl/intl.dart';

class DateSelectorItemDomain {
  DateTime date;
  String monthLiteral;
  String day;
  String year;
  bool isSelected;
  String dayLiteral;

  DateSelectorItemDomain(
      {required this.date,
      required this.monthLiteral,
      required this.day,
      required this.year,
      required this.isSelected,
      required this.dayLiteral});

  static DateSelectorItemDomain constructorDateTime(
      DateTime dateTime, bool isSelected) {
    final resultMonthLiteral = getMonthLiteral(dateTime.month);
    return DateSelectorItemDomain(
        date: dateTime,
        monthLiteral: resultMonthLiteral,
        day: "${dateTime.day}",
        year: "${dateTime.year}",
        dayLiteral: getDayLiteral(dateTime),
        isSelected: isSelected);
  }

  DateSelectorItemDomain setActive(bool value) {
    return DateSelectorItemDomain(
        date: date,
        monthLiteral: monthLiteral,
        day: day,
        year: year,
        dayLiteral: dayLiteral,
        isSelected: value);
  }

  static String getMonthLiteral(int month) {
    switch (month) {
      case 1:
        return "ENE";
      case 2:
        return "FEB";
      case 3:
        return "MAR";
      case 4:
        return "ABR";
      case 5:
        return "MAY";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AGO";
      case 9:
        return "SEPT";
      case 10:
        return "OCT";
      case 11:
        return "NOV";
      case 12:
        return "DIC";
      default:
        return "ENE";
    }
  }

  static String getDayLiteral(DateTime date) {
    final String abreviacion = DateFormat.E('es').format(date).toUpperCase();
    return abreviacion.substring(0, 3);
  }
}
