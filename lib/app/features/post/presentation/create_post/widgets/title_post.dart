import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_controller.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/validators.dart';

class TitlePost extends ConsumerWidget {
  const TitlePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors[ColorsName.borderContainerColor]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            "Título",
            style: TextStyle(
                color: colors[ColorsName.mainLetterColor],
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: TextFormField(
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller:
                  ref.watch(createPostControllerProvider.notifier).ctrlTitle,
              validator: (value) {
                return Validators.simpleRequired(value ?? "");
              },
              style: TextStyle(
                  color: colors[ColorsName.mainLetterColor],
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Escribe un título",
                hintStyle: TextStyle(
                    color: colors[ColorsName.secondaryLetterColor],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
