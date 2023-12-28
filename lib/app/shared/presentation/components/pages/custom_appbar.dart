import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar(
      {Key? key, required this.title, this.extraContent = const SizedBox()})
      : super(key: key);
  final String title;
  final Widget extraContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colors[ColorsName.backgroundColor],
          border: Border(
              bottom:
                  BorderSide(color: colors[ColorsName.borderContainerColor]!))),
      child: Row(
        children: [
          IconWrapper(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              }
            },
            child: Icon(
              Iconsax.arrow_left_2,
              color: colors[ColorsName.mainLetterColor],
              size: 19,
            ),
          ),
          const SizedBox(width: 13),
          Text(
            title,
            style: TextStyle(
                color: colors[ColorsName.mainLetterColor],
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          extraContent
        ],
      ),
    );
  }
}
