import 'package:flutter/material.dart';

class PrimaryDialog extends StatelessWidget {
  const PrimaryDialog({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: child,
    );
  }
}
