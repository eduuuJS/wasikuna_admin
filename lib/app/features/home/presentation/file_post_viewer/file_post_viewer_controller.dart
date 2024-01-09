import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_post_viewer_controller.g.dart';

@riverpod
Future<void> filePostViewerLoader(
    FilePostViewerLoaderRef ref, int index, int total) async {
  await Future.delayed(Duration.zero);
  ref.watch(currentFileIndexPostProvider.notifier).setValues(index, total);
  return;
}

@riverpod
class CurrentFileIndexPost extends _$CurrentFileIndexPost {
  @override
  int build() {
    return 0;
  }

  int totalValues = 0;

  void setValues(int index, int total) {
    state = index;
    totalValues = total;
  }

  void next() {
    final newState = state + 1;
    if (newState < totalValues) {
      state++;
    }
  }

  void prev() {
    final newState = state - 1;
    if (newState >= 0) {
      state--;
    }
  }
}
