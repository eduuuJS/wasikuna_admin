import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wasikuna_admin/app/features/home/domain/selector_item_domain.dart';

part 'selector_controller.g.dart';

@riverpod
class SelectorController extends _$SelectorController {
  @override
  List<SelectorItemDomain> build() {
    return [
      SelectorItemDomain(
          name: "Noticias", isActive: true, type: AreaTypeSelector.news),
      SelectorItemDomain(
          name: "Comunidad", isActive: false, type: AreaTypeSelector.community),
      SelectorItemDomain(
          name: "Documentos",
          isActive: false,
          type: AreaTypeSelector.documents),
    ];
  }

  void setActive(AreaTypeSelector type) {
    ref.watch(areaTypeControllerProvider.notifier).setType(type);
    state = state.map((e) {
      return e.setState(e.type == type);
    }).toList();
  }
}

@riverpod
class AreaTypeController extends _$AreaTypeController {
  @override
  AreaTypeSelector build() {
    return AreaTypeSelector.news;
  }

  void setType(AreaTypeSelector type) {
    state = type;
  }
}
