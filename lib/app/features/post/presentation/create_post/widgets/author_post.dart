import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/images/circular_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class AuthorPost extends ConsumerWidget {
  const AuthorPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors[ColorsName.borderContainerColor]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularWrapper(
              url:
                  "https://greenti.pe/api/attachments/user/image/d06c0054-241d-4c54-8caf-f8bcb50eeb48",
              isOnFire: false,
              radius: 25.0),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Axel Vazquez",
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              Text(
                "Conserje",
                style: TextStyle(
                    color: colors[ColorsName.secondaryLetterColor],
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
