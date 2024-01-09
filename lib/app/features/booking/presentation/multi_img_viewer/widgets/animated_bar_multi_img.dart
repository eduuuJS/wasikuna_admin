import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/multi_img_viewer/multi_img_controller.dart';

class AnimatedBarMultiImg extends ConsumerWidget {
  const AnimatedBarMultiImg({Key? key, required this.imgs}) : super(key: key);
  final List<String> imgs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueSelected = ref.watch(imgSelectedIndexProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
          children: List.generate((imgs.length * 2) - 1, (index) {
        if (index % 2 == 0) {
          return Expanded(
            child: valueSelected == index + 1
                ? TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 4000),
                    curve: Curves.linear,
                    tween: Tween<double>(begin: 0, end: 1),
                    onEnd: () {
                      ref
                          .read(imgSelectedIndexProvider.notifier)
                          .next(context, imgs.length);
                    },
                    builder: (context, value, _) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: LinearProgressIndicator(
                          value: value,
                          minHeight: 8.0,
                          backgroundColor: Colors.white60,
                          color: Colors.white,
                        ),
                      );
                    },
                  )
                : Container(
                    height: 8.0,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
          );
        } else {
          return const SizedBox(width: 10.0);
        }
      })),
    );
  }
}
