import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return LoadingAnimationWidget.discreteCircle(
        color: colors[ColorsName.primaryColor]!,
        size: 30.0,
        secondRingColor: colors[ColorsName.secondaryColor]!,
        thirdRingColor: colors[ColorsName.borderContainerColor]!);
  }
}
