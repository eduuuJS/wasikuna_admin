import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/messages/data_icon_present.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class InfoAreaCard extends ConsumerWidget {
  const InfoAreaCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final areaDetail = ref.watch(areaDetailBookingProvider);
    final colors = ref.watch(colorsStateProvider);
    return Row(
      children: [
        Container(
          width: QuerySize.width(context, 0.35),
          height: QuerySize.width(context, 0.25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage(areaDetail!.urlPhoto),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: QuerySize.width(context, 0.25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                areaDetail.nameArea,
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              DataIconPresent(
                  data: "${areaDetail.openTime} - ${areaDetail.closeTime}",
                  icon: Iconsax.clock),
              DataIconPresent(
                  data: "${areaDetail.capacity} personas a foro",
                  icon: Iconsax.people),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: colors[ColorsName.secondaryColor],
                    radius: 8.0,
                    child: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 10.0,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    areaDetail.qualification,
                    style: TextStyle(
                        fontSize: 12,
                        color: colors[ColorsName.mainLetterColor],
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
