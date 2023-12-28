import 'package:flutter/material.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({Key? key, this.space = 30.0}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
