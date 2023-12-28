import 'package:flutter/material.dart';

class CircularThemeSelector extends StatelessWidget {
  const CircularThemeSelector(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.isActive,
      required this.isMoon,
      required this.primary})
      : super(key: key);
  final void Function()? onTap;
  final IconData icon;
  final bool isMoon;
  final bool isActive;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(25.0),
          onTap: onTap,
          child: isMoon ? getItemMoon() : getItemSun()),
    );
  }

  Widget getItemMoon() {
    return CircleAvatar(
      backgroundColor: isActive ? Colors.white : Colors.transparent,
      radius: 12,
      child: Icon(
        icon,
        color: primary,
        size: 18,
      ),
    );
  }

  Widget getItemSun() {
    return CircleAvatar(
      backgroundColor: isActive ? primary : Colors.transparent,
      radius: 12,
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
