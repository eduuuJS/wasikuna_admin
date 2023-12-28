import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/domain/booking_detail_domain.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/inputs/input_primary.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class ReviewBookingResume extends ConsumerWidget {
  const ReviewBookingResume({Key? key, required this.data}) : super(key: key);
  final BookingDetailDomain data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
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
            getItemResume("Fecha de reserva", data.dateBooking, colors),
            const MainDivider(space: 20.0),
            getItemResume("Costo de reserva", "S/${data.coastArea}", colors),
            const MainDivider(space: 20.0),
            getItemResume("Garantía", "S/${data.warranty}", colors),
            const MainDivider(space: 30.0),
            const InputPrimary(
              label: "Comentario",
              maxlines: 3,
            )
          ],
        ),
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
