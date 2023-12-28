import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/booking/domain/date_selector_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/schedule_area_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class ScheduleAreaAppbar extends ConsumerWidget {
  const ScheduleAreaAppbar(
      {Key? key,
      required this.nameArea,
      required this.idArea,
      required this.currentContSize})
      : super(key: key);
  final String nameArea;
  final String idArea;
  final double currentContSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final listDatesSelector = ref.watch(dateSelectorListProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(color: colors[ColorsName.primaryColor]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              IconWrapper(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Iconsax.arrow_left_2,
                  color: colors[ColorsName.whiteColor],
                  size: 19,
                ),
              ),
              const SizedBox(width: 13),
              Text(
                nameArea,
                style: TextStyle(
                    color: colors[ColorsName.whiteColor],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconWrapper(
                onTap: () async {
                  DateTime? pickdateInicio = await showDatePicker(
                    context: context,
                    initialDate: ref
                        .read(dateSelectorListProvider.notifier)
                        .getDateActive(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  );
                  if (pickdateInicio != null) {
                    ref
                        .read(dateSelectorListProvider.notifier)
                        .setList(pickdateInicio);
                    ref
                        .read(scheduleAreaRefreshProvider.notifier)
                        .refresh(idArea);
                  }
                },
                child: Icon(
                  Iconsax.calendar,
                  color: colors[ColorsName.whiteColor],
                  size: 19,
                ),
              ),
            ],
          ),
          if (currentContSize > 57.0)
            SizedBox(
                height: currentContSize,
                child: Row(
                  children: List.generate(listDatesSelector.length, (index) {
                    final item = listDatesSelector[index];
                    return Expanded(
                        child: CardItemDateSelector(
                      item: item,
                      idArea: idArea,
                      size: currentContSize,
                    ));
                  }),
                )),
        ],
      ),
    );
  }
}

class CardItemDateSelector extends ConsumerWidget {
  const CardItemDateSelector(
      {super.key,
      required this.item,
      required this.idArea,
      required this.size});
  final DateSelectorItemDomain item;
  final String idArea;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: item.isSelected
              ? colors[ColorsName.whiteColor]
              : Colors.transparent),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            if (!item.isSelected) {
              ref.read(dateSelectorListProvider.notifier).setActive(item.date);
              ref.read(scheduleAreaRefreshProvider.notifier).refresh(idArea);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (size > 80.0)
                Text(
                  item.monthLiteral,
                  style: TextStyle(
                      color: item.isSelected
                          ? colors[ColorsName.mainLetterColor]
                          : colors[ColorsName.whiteColor],
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              if (size > 20.0)
                Text(
                  item.day,
                  style: TextStyle(
                      color: item.isSelected
                          ? colors[ColorsName.mainLetterColor]
                          : colors[ColorsName.whiteColor],
                      fontSize: 14 + (size / 10),
                      fontWeight: FontWeight.bold),
                ),
              if (size > 55.0)
                Text(
                  item.dayLiteral,
                  style: TextStyle(
                      color: item.isSelected
                          ? colors[ColorsName.mainLetterColor]
                          : colors[ColorsName.whiteColor],
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
            ],
          ),
        ),
      ),
    );
  }
}

const _maxContSize = 82.0;
const _minContSize = 0.0;

const _maxHeaderExent = 174.0;
const _minHeaderExent = 62.0;

class ScheduleAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String idArea;
  final String nameArea;

  ScheduleAppBarDelegate({required this.idArea, required this.nameArea});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExent;
    final currentContSize = (_maxContSize * (1 - percent)).clamp(
      _minContSize,
      _maxContSize,
    );
    return ScheduleAreaAppbar(
      nameArea: nameArea,
      idArea: idArea,
      currentContSize: currentContSize,
    );
  }

  @override
  double get maxExtent => _maxHeaderExent;

  @override
  double get minExtent => _minHeaderExent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
