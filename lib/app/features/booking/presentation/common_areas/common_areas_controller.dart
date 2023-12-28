// ignore_for_file: empty_catches

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/booking/data/repository/common_area_repository.dart';
import 'package:wasikuna_admin/app/features/booking/domain/common_area_domain.dart';

part 'common_areas_controller.g.dart';

@riverpod
Future<void> commonAreasLoader(CommonAreasLoaderRef ref) async {
  await ref.watch(commonAreasListProvider.notifier).getList();
}

@riverpod
class CommonAreasList extends _$CommonAreasList {
  @override
  List<CommonAreaDomain> build() {
    return [];
  }

  Future<void> getList() async {
    final repository = ref.watch(commonAreaRepositoryProvider);
    try {
      final response = await repository.getCommonAreas();
      state = response;
    } catch (e) {}
  }
}
