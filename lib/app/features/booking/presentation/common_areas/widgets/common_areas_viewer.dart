import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/booking/domain/common_area_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/common_areas_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/messages/data_icon_present.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class CommonAreasViewerHorizontal extends ConsumerWidget {
  const CommonAreasViewerHorizontal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonAreasList = ref.watch(commonAreasListProvider);
    return Container(
      margin: const EdgeInsets.only(left: 15.0, top: 5.0),
      height: QuerySize.height(context, 0.435),
      width: QuerySize.width(context, 1) - 15,
      // color: Colors.blue,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = commonAreasList[index];
            return CommonAreaCardItemHorizontal(item: item);
          },
          separatorBuilder: (_, __) {
            return const SizedBox(width: 15.0);
          },
          itemCount: commonAreasList.length),
    );
  }
}

class CommonAreaCardItemHorizontal extends ConsumerWidget {
  const CommonAreaCardItemHorizontal({super.key, required this.item});
  final CommonAreaDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: QuerySize.width(context, 0.6),
              height: QuerySize.width(context, 0.6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(item.urlPhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 8.0,
                left: QuerySize.width(context, 0.6) - 63,
                child: Container(
                  width: 54.0,
                  height: 27.0,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Row(
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
                        item.qualification,
                        style: TextStyle(
                            fontSize: 12,
                            color: colors[ColorsName.whiteColor],
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
                ))
          ],
        ),
        Text(
          item.nameArea,
          style: TextStyle(
              color: colors[ColorsName.mainLetterColor],
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        DataIconPresent(
            data: "${item.startTime} - ${item.closeTime}", icon: Iconsax.clock),
        DataIconPresent(
            data: "${item.capacity} personas a foro", icon: Iconsax.people),
        SizedBox(
          width: QuerySize.width(context, 0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "S/${item.coast}",
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              ChipSchedule(onTap: () {
                context.push(AppRoutesNamed.scheduleAreaRoute, extra: {
                  "idArea": item.idArea,
                  "nameArea": item.nameArea,
                  "coastArea": item.coast
                });
              })
            ],
          ),
        )
      ],
    );
  }
}

class ChipSchedule extends ConsumerWidget {
  const ChipSchedule({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      height: 25.0,
      decoration: BoxDecoration(
        color: colors[ColorsName.primaryColor],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Text(
                "Ver disponibilidad",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
