import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/home/domain/selector_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/controllers.dart/selector_controller.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class AreaSelector extends ConsumerWidget {
  const AreaSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listItems = ref.watch(selectorControllerProvider);
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      height: 65.0,
      child: Row(
        children: [
          Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (contrext, index) {
                    final item = listItems[index];
                    return ItemAreaSelector(item: item);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15.0);
                  },
                  itemCount: 3))
        ],
      ),
    );
  }
}

class ItemAreaSelector extends ConsumerWidget {
  const ItemAreaSelector({super.key, required this.item});
  final SelectorItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      height: 35.0,
      width: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: item.isActive
            ? colors[ColorsName.primaryColor]
            : colors[ColorsName.whiteColor],
        border: Border.all(color: colors[ColorsName.primaryColor]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            ref.read(selectorControllerProvider.notifier).setActive(item.type);
          },
          child: Center(
            child: Text(
              item.name,
              style: TextStyle(
                  color: item.isActive
                      ? colors[ColorsName.whiteColor]
                      : colors[ColorsName.primaryColor],
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
