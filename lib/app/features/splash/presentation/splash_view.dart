import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasikuna_admin/app/features/splash/presentation/splash_controller.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class SplashView extends ConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(timerSplashProvider(context));
    final colors = ref.watch(colorsStateProvider);
    return Scaffold(
      backgroundColor: colors[ColorsName.primaryColor],
      body: Stack(
        children: [
          const Image(
            image: AssetImage(
              "assets/img/splash_background.png",
            ),
            fit: BoxFit.cover,
          ),
          Center(
            child: Image(
              image: const AssetImage(
                "assets/img/logo_dark.png",
              ),
              width: 150.w,
            ),
          ),
        ],
      ),
    );
  }
}
