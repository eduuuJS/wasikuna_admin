import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class SecondaryButton extends ConsumerWidget {
  const SecondaryButton({Key? key, this.onTap, required this.label})
      : super(key: key);
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors[ColorsName.primaryColor]!),
        color: colors[ColorsName.backgroundColor],
        borderRadius: BorderRadius.circular(15.0),
      ),
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
                style: TextStyle(
                    color: colors[ColorsName.primaryColor]!,
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
