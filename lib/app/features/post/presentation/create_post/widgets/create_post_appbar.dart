// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wasikuna_admin/app/features/home/presentation/home_controller.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/chips/primary_chip.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/action_dialog.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/alerts.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/spinner.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class CreatePostAppbar extends ConsumerWidget {
  const CreatePostAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      width: QuerySize.width(context, 1),
      decoration: BoxDecoration(
        color: colors[ColorsName.backgroundColor]!,
        border: Border(
          bottom: BorderSide(
            color: colors[ColorsName.borderContainerColor]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconWrapper(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                  child: Icon(
                    Icons.close,
                    color: colors[ColorsName.mainLetterColor]!,
                  )),
              const SizedBox(width: 10.0),
              Text(
                "Crear publicación",
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
              width: 90.0,
              child: PrimaryChip(
                  label: "Publicar",
                  onTap: () {
                    final keyForm =
                        ref.read(createPostControllerProvider.notifier).formKey;
                    if (keyForm.currentState!.validate()) {
                      _createPost(ref, context);
                    }
                  }))
        ],
      ),
    );
  }

  void _createPost(WidgetRef ref, BuildContext context) async {
    ref.watch(spinnerStateProvider.notifier).show();
    final response =
        await ref.read(createPostControllerProvider.notifier).createPost();
    ref.watch(spinnerStateProvider.notifier).hide();
    if (response.success) {
      await ref.watch(homeRefreshProvider.notifier).refresh();
      context.pop();
    } else {
      Alerts.getDialog(
          context,
          ActionDialog(
            type: AlertType.error,
            title: "Error",
            subTitle: response.message,
          ));
    }
  }
}

class CreatePostAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const CreatePostAppbar();
  }

  @override
  double get maxExtent => 66.0;

  @override
  double get minExtent => 66.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
