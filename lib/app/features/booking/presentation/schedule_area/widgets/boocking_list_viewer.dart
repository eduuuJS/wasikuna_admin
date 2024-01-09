import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/schedule_area_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/images/circular_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/messages/data_icon_present.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class BookingListViewer extends ConsumerWidget {
  const BookingListViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listBooking = ref.watch(scheduleAreasListProvider);
    final isRefreshing = ref.watch(scheduleAreaRefreshProvider);
    return isRefreshing
        ? const SliverFillRemaining(
            child: Align(
              alignment: Alignment.center,
              child: LoadingWidget(),
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = listBooking[index];
              return ItemBooking(item: item);
            }, childCount: listBooking.length),
          );
  }
}

class ItemBooking extends ConsumerWidget {
  const ItemBooking({super.key, required this.item});
  final ScheduleAreaItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: colors[ColorsName.borderContainerColor]!)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularWrapper(
                      url: item.urlPhotoOwner,
                      isOnFire: item.isOnFireOwner,
                      radius: 25.0),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dpto. ${item.flatNumber}",
                        style: TextStyle(
                            color: colors[ColorsName.mainLetterColor],
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7.0),
                      Text(
                        item.ownerName,
                        style: TextStyle(
                            color: colors[ColorsName.secondaryLetterColor],
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              item.state == BoockingState.pending
                  ? Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          context.push(AppRoutesNamed.reviewBooking,
                              extra: item);
                        },
                        child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                color: colors[ColorsName.primaryColor],
                                borderRadius: BorderRadius.circular(8.0)),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            )),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(height: 17.0),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: colors[ColorsName.borderContainerColor],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    DataIconPresent(
                        data: "${item.startTime} - ${item.endTime}",
                        icon: Iconsax.clock),
                    const Spacer(),
                    Container(
                      width: 101,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getNameState(item.state),
                              style: TextStyle(
                                  color: getColorState(item.state, colors),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 5.0),
                            Icon(
                              getIconState(item.state),
                              color: getColorState(item.state, colors),
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }

  String getNameState(BoockingState state) {
    switch (state) {
      case BoockingState.approved:
        return "Aprobado";
      case BoockingState.pending:
        return "Pendiente";
      case BoockingState.observed:
        return "Observado";
      default:
        return "Pendiente";
    }
  }

  Color getColorState(BoockingState state, Map<ColorsName, Color> colors) {
    switch (state) {
      case BoockingState.approved:
        return colors[ColorsName.secondaryColor]!;
      case BoockingState.pending:
        return colors[ColorsName.primaryColor]!;
      case BoockingState.observed:
        return colors[ColorsName.importantColor]!;
      default:
        return colors[ColorsName.primaryColor]!;
    }
  }

  IconData getIconState(BoockingState state) {
    switch (state) {
      case BoockingState.approved:
        return Icons.approval;
      case BoockingState.pending:
        return Icons.pending;
      case BoockingState.observed:
        return Icons.warning_amber;
      default:
        return Icons.pending;
    }
  }
}
