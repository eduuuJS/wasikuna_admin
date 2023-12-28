abstract class Validators {
  static String? simpleRequired(String value) {
    if (value.trim() == "") {
      return "Este campo es obligatorio";
    } else {
      return null;
    }
  }

  static String? formatHour(String time) {
    final RegExp horaRegExp = RegExp(r'^(\d{1,2}):(\d{2}) (am|pm)$');

    if (horaRegExp.hasMatch(time)) {
      return null;
    } else {
      return "Formato incorrecto'.";
    }
  }
}
