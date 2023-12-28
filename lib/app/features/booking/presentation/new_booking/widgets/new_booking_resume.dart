import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/messages/box_message.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class NewBookingResume extends ConsumerWidget {
  const NewBookingResume({Key? key, required this.dateBooking})
      : super(key: key);
  final String dateBooking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final data = ref.watch(areaDetailBookingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Resumen",
          style: TextStyle(
              color: colors[ColorsName.mainLetterColor],
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        const MainDivider(space: 20.0),
        Column(
          children: [
            getItemResume("Fecha de reserva", dateBooking, colors),
            const MainDivider(space: 20.0),
            getItemResume("Costo de reserva", "S/${data!.coast}", colors),
            const MainDivider(space: 20.0),
            getItemResume("Garantía", "S/${data.warranty}", colors),
          ],
        ),
        const MainDivider(),
        const BoxMessage(
            content:
                "Estimado propietario, una vez realizado su reservación, la administración validará su pago para confirmar su solicitud."),
      ],
    );
  }

  Widget getItemResume(
      String key, String value, Map<ColorsName, Color> colors) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                key,
                style: TextStyle(
                    color: colors[ColorsName.secondaryLetterColor],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
