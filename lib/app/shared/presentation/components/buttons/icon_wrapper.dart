import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  const IconWrapper(
      {Key? key, required this.child, this.radius = 16.0, this.onTap})
      : super(key: key);
  final Widget child;
  final double radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: CircleAvatar(
            backgroundColor: Colors.transparent, radius: radius, child: child),
      ),
    );
  }
}
