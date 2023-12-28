import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class PrimaryButton extends ConsumerWidget {
  const PrimaryButton({Key? key, this.onTap, required this.label})
      : super(key: key);
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      decoration: BoxDecoration(
          color: colors[ColorsName.primaryColor],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
                blurRadius: 27,
                spreadRadius: 0,
                offset: Offset(0, 4),
                color: Color.fromRGBO(101, 50, 125, 0.35))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 19.0, horizontal: 10.0),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
