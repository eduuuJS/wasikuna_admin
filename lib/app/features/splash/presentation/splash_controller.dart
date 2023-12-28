import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';

part 'splash_controller.g.dart';

@riverpod
Future<void> timerSplash(TimerSplashRef ref, BuildContext context) async {
  Future.delayed(const Duration(milliseconds: 2500), () {
    context.go(AppRoutesNamed.authRoute);
  });
}
