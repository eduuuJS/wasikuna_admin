import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class BoxMessage extends ConsumerWidget {
  const BoxMessage({super.key, required this.content, this.title});
  final String? title;
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: colors[ColorsName.borderContainerColor],
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: [
                if (title != null)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title ?? "",
                          style: TextStyle(
                              color: colors[ColorsName.mainLetterColor],
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                if (title != null) const MainDivider(space: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        content,
                        style: TextStyle(
                            color: colors[ColorsName.mainLetterColor],
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
