import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class DataIconPresent extends ConsumerWidget {
  const DataIconPresent({super.key, required this.data, required this.icon});
  final String data;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Row(
      children: [
        Icon(icon, color: colors[ColorsName.secondaryLetterColor], size: 16.0),
        const SizedBox(width: 8.0),
        Text(
          data,
          style: TextStyle(
              color: colors[ColorsName.secondaryLetterColor],
              fontSize: 14,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
