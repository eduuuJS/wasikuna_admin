import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/schedule_area_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/primary_button.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class ScheduleAreaFooter extends ConsumerWidget {
  const ScheduleAreaFooter(
      {Key? key, required this.idArea, required this.coast})
      : super(key: key);
  final String idArea;
  final String coast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return SizedBox(
      height: 90.0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: colors[ColorsName.borderContainerColor]!))),
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Precio de alquiler",
                        style: TextStyle(
                            color: colors[ColorsName.secondaryLetterColor],
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 7.0),
                      Text(
                        "S/ $coast",
                        style: TextStyle(
                            color: colors[ColorsName.mainLetterColor],
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                  Expanded(
                      child: PrimaryButton(
                    label: "Reservar",
                    onTap: () {
                      final dateBooking = ref
                          .watch(dateSelectorListProvider.notifier)
                          .getDateActive();
                      context.push(AppRoutesNamed.newBookingRoute, extra: {
                        "idArea": idArea,
                        "dateBooking": dateBooking
                      });
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
