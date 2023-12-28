import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/images/circular_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class ReviewBookingAppbar extends ConsumerWidget {
  const ReviewBookingAppbar({Key? key, required this.item}) : super(key: key);
  final ScheduleAreaItemDomain item;

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colors[ColorsName.backgroundColor],
          border: Border(
              bottom:
                  BorderSide(color: colors[ColorsName.borderContainerColor]!))),
      child: Row(
        children: [
          IconWrapper(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              }
            },
            child: Icon(
              Iconsax.arrow_left_2,
              color: colors[ColorsName.mainLetterColor],
              size: 19,
            ),
          ),
          const SizedBox(width: 13),
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
          const Spacer(),
          Container(
            width: 101,
            height: 25,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: getColorState(item.state, colors),
                )),
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
