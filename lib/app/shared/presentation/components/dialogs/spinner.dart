import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
part 'spinner.g.dart';

@riverpod
class SpinnerState extends _$SpinnerState {
  @override
  void build() {}

  void show() {
    try {
      final mainContext = ref
          .watch(appRouterProvider)
          .routerDelegate
          .navigatorKey
          .currentContext;
      final colors = ref.watch(colorsStateProvider);
      showDialog(
        context: mainContext!,
        builder: (context) {
          return AlertDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(100.0),
            content: Container(
                width: 80.0,
                height: 80.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: LoadingAnimationWidget.discreteCircle(
                    color: colors[ColorsName.whiteColor]!,
                    size: 35.0,
                    secondRingColor: colors[ColorsName.primaryColor]!,
                    thirdRingColor: colors[ColorsName.secondaryColor]!)),
          );
        },
        barrierDismissible: false,
      );
    } catch (e) {}
  }

  void hide() {
    try {
      final mainContext = ref
          .watch(appRouterProvider)
          .routerDelegate
          .navigatorKey
          .currentContext;
      Navigator.pop(mainContext!);
    } catch (e) {}
  }
}
