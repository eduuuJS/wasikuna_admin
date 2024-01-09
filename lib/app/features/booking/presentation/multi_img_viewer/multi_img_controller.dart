import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'multi_img_controller.g.dart';

@riverpod
Future<void> setInitialIndex(SetInitialIndexRef ref, int index) async {
  await Future.delayed(Duration.zero);
  ref.watch(imgSelectedIndexProvider.notifier).setIndex(index);
}

@riverpod
class ImgSelectedIndex extends _$ImgSelectedIndex {
  @override
  int build() {
    return 1;
  }

  void setIndex(int index) {
    state = index;
  }

  void next(BuildContext context, int total) {
    final newValue = state + 2;
    if (newValue > total * 2 - 1) {
      context.pop();
      return;
    }
    state = newValue;
  }

  void previous(BuildContext context, int total) {
    final newValue = state - 2;
    if (newValue < 1) {
      context.pop();
      return;
    }
    state = newValue;
  }
}
