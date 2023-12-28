import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class PrimaryChip extends ConsumerWidget {
  const PrimaryChip({Key? key, required this.label, required this.onTap})
      : super(key: key);
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      height: 35.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors[ColorsName.primaryColor],
        border: Border.all(color: colors[ColorsName.primaryColor]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: colors[ColorsName.whiteColor],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
