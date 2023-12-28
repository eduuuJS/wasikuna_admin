import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/home/domain/neighborg_item_domain.dart';
import 'package:wasikuna_admin/app/features/home/presentation/controllers.dart/neighborg_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/images/circular_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class ChartNeighBorgs extends ConsumerWidget {
  const ChartNeighBorgs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final neighborgsList = ref.watch(neighBorgListProvider);
    final mainWidget = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: colors[ColorsName.secondaryColor],
          child: Icon(
            Iconsax.cup,
            color: colors[ColorsName.whiteColor],
            size: 26,
          ),
        ),
        SizedBox(
          width: 65.0,
          child: Text("Vecinos Puntuales",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: colors[ColorsName.mainLetterColor]!,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );

    return Container(
      height: 125.0,
      padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors[ColorsName.borderContainerColor]!,
            width: 10.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            itemCount: neighborgsList.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return mainWidget;
              } else {
                final item = neighborgsList[index - 1];
                return ItemNeighborgChart(item: item);
              }
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 23.0);
            },
          ))
        ],
      ),
    );
  }
}

class ItemNeighborgChart extends ConsumerWidget {
  const ItemNeighborgChart({super.key, required this.item});
  final NeighborgItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularWrapper(
          url: item.urlPhoto,
          isOnFire: item.isImportant,
        ),
        Text(item.points,
            style: TextStyle(
                fontSize: 14,
                color: colors[ColorsName.mainLetterColor]!,
                fontWeight: FontWeight.w600)),
        Text(item.name,
            style: TextStyle(
                fontSize: 12,
                color: colors[ColorsName.secondaryLetterColor]!,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
