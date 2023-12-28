import 'package:flutter/material.dart';

class QuerySize {
  static double width(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  static double height(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }
}
