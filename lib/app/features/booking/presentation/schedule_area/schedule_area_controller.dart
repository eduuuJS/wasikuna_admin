// ignore_for_file: empty_catches

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/booking/data/repository/schedule_area_repository.dart';
import 'package:wasikuna_admin/app/features/booking/domain/date_selector_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';

part 'schedule_area_controller.g.dart';

@riverpod
class ScheduleAreasList extends _$ScheduleAreasList {
  @override
  List<ScheduleAreaItemDomain> build() {
    return [];
  }

  Future<void> getList(String id, DateTime date) async {
    final repository = ref.watch(scheduleAreaRepositoryProvider);
    try {
      final response = await repository.getScheduleAreaById(id, date);
      state = response;
    } catch (e) {}
  }
}

@riverpod
Future<bool> scheduleAreasLoader(
    ScheduleAreasLoaderRef ref, String id, DateTime date) async {
  await ref
      .watch(scheduleAreasListProvider.notifier)
      .getList(id, DateTime.now());
  return true;
}

@riverpod
class DateSelectorList extends _$DateSelectorList {
  @override
  List<DateSelectorItemDomain> build() {
    return generateList(DateTime.now());
  }

  List<DateSelectorItemDomain> generateList(DateTime date) {
    final initDate = date;
    List<DateSelectorItemDomain> initList = [];
    for (var i = 0; i < 5; i++) {
      initList.add(DateSelectorItemDomain.constructorDateTime(
          initDate.add(Duration(days: i)), i == 0));
    }
    return initList;
  }

  void setList(DateTime date) {
    state = generateList(date);
  }

  void setActive(DateTime date) {
    state = state.map((e) => e.setActive(date == e.date)).toList();
  }

  DateTime getDateActive() {
    return state.firstWhere((element) => element.isSelected).date;
  }
}

@riverpod
class ScheduleAreaRefresh extends _$ScheduleAreaRefresh {
  @override
  bool build() {
    return false;
  }

  void refresh(String id) async {
    state = true;
    final date = ref.watch(dateSelectorListProvider.notifier).getDateActive();
    await ref.watch(scheduleAreasListProvider.notifier).getList(id, date);
    state = false;
  }
}
