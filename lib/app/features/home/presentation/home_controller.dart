import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/home/presentation/controllers.dart/neighborg_controller.dart';
import 'package:wasikuna_admin/app/features/home/presentation/controllers.dart/news_controller.dart';

part 'home_controller.g.dart';

@riverpod
Future<void> homeLoader(HomeLoaderRef ref) async {
  await ref.watch(neighBorgListProvider.notifier).getList();
  await ref.watch(newsControllerProvider.notifier).getList();
}

@riverpod
class HomeRefresh extends _$HomeRefresh {
  @override
  bool build() {
    return false;
  }

  Future<void> refresh() async {
    // state = true;
    await ref.watch(newsControllerProvider.notifier).getList();
    // state = false;
  }
}
