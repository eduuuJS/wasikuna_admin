import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/home/data/home_repository.dart';
import 'package:wasikuna_admin/app/features/home/domain/neighborg_item_domain.dart';

part 'neighborg_controller.g.dart';

@riverpod
class NeighBorgList extends _$NeighBorgList {
  @override
  List<NeighborgItemDomain> build() {
    return [];
  }

  void setList(List<NeighborgItemDomain> list) {
    state = list;
  }

  Future<void> getList() async {
    final repository = ref.watch(homeRepositoryProvider);
    try {
      final response = await repository.getChartNeighborgs();
      state = response;
    } catch (e) {}
  }
}
