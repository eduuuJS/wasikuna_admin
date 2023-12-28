import 'package:intl/intl.dart';

abstract class Parser {
  static String timeToStringFormat12(String time) {
    final RegExp timeFormat =
        RegExp(r'^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$');

    if (timeFormat.hasMatch(time)) {
      var hour = int.parse(time.substring(0, 2));
      var minute = time.substring(3, 5);
      var period = hour >= 12 ? 'pm' : 'am';

      if (hour > 12) hour -= 12;
      if (hour == 0) hour = 12;

      return '${hour.toString().padLeft(2, '0')}:$minute $period';
    } else {
      return '';
    }
  }

  static String timeToStringFormat24(String time) {
    final RegExp timeFormat =
        RegExp(r'^([0-1]?[0-9]|2[0-9]):([0-5][0-9]) (am|pm)$');

    if (timeFormat.hasMatch(time)) {
      var parts = time.split(' ');
      var hour = int.parse(parts[0].split(':')[0]);
      var minute = parts[0].split(':')[1];
      var period = parts[1].toLowerCase();

      if (hour == 12) {
        if (period == 'am') {
          hour = 0;
        }
      } else if (period == 'pm') {
        hour += 12;
      }

      return '${hour.toString().padLeft(2, '0')}:$minute:00';
    } else {
      return '';
    }
  }

  static String stringNumericFormat(String numberString) {
    if (numberString.isEmpty || !isNumeric(numberString)) {
      return '';
    }

    double number = double.parse(numberString);

    if (number == number.roundToDouble()) {
      return number.toInt().toString();
    } else {
      return number.toStringAsFixed(2);
    }
  }

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static String dateToDDMMYYYY(DateTime fecha) {
    final formato = DateFormat('dd/MM/yyyy');
    return formato.format(fecha);
  }

  static String dateToDDMMYYYYEncoded(DateTime fecha) {
    final formato = DateFormat('dd/MM/yyyy');
    return Uri.encodeComponent(formato.format(fecha));
  }

  static double stringToTimeOfDay(String tiempoString) {
    List<String> partes = tiempoString.split(':');
    int horas = int.parse(partes[0]);
    if (tiempoString.toLowerCase().contains('pm') && horas != 12) {
      horas += 12;
    } else if (tiempoString.toLowerCase().contains('am') && horas == 12) {
      horas = 0;
    }
    int minutos = int.parse(partes[1].replaceAll(RegExp('[^0-9]'), ''));
    return horas.toDouble() + minutos.toDouble() / 60;
  }

  static String getDayString(String dateString) {
    DateTime date = DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateString);
    String day = DateFormat("dd").format(date);
    return day;
  }

  static String getMonthString(String dateString) {
    DateTime date = DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateString);
    return getMonthLiteral(date.month);
  }

  static getTimeAgo(String date) {
    DateTime fechaEnvio = DateFormat("dd/MM/yyyy HH:mm:ss").parse(date);
    DateTime ahora = DateTime.now();
    Duration diferencia = ahora.difference(fechaEnvio);

    if (diferencia.inSeconds < 60) {
      return "Hace ${diferencia.inSeconds} segundos";
    } else if (diferencia.inMinutes < 60) {
      return "Hace ${diferencia.inMinutes} minutos";
    } else if (diferencia.inHours < 24) {
      return "Hace ${diferencia.inHours} horas";
    } else if (diferencia.inDays < 7) {
      return "Hace ${diferencia.inDays} días";
    } else if (diferencia.inDays < 30) {
      return "Hace ${(diferencia.inDays / 7).floor()} semanas";
    } else if (diferencia.inDays < 365) {
      return "Hace ${(diferencia.inDays / 30).floor()} meses";
    } else {
      return "Hace ${(diferencia.inDays / 365).floor()} años";
    }
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
}
