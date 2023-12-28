import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/booking/domain/common_area_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/common_areas_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/common_areas/widgets/carousel_common_areas.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/messages/data_icon_present.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class CommonAreasViewerVertical extends ConsumerWidget {
  const CommonAreasViewerVertical({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonAreasList = ref.watch(commonAreasListProvider);
    return SliverList.separated(
      itemBuilder: (context, index) {
        final item = commonAreasList[index];
        return CommonAreaCardItemVertical(item: item);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15.0);
      },
      itemCount: commonAreasList.length,
    );
  }
}

class CommonAreaCardItemVertical extends ConsumerWidget {
  const CommonAreaCardItemVertical({super.key, required this.item});
  final CommonAreaDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: SizedBox(
                width: QuerySize.width(context, 1) - 30,
                height: QuerySize.width(context, 0.5),
                child: CarouselCommonAreas(
                  imageList: item.images,
                  height: QuerySize.width(context, 0.5),
                ),
              ),
            ),
            Positioned(
                top: 8.0,
                right: 8.0,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.nameArea,
                style: TextStyle(
                    color: colors[ColorsName.mainLetterColor],
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              DataIconPresent(
                  data: "${item.startTime} - ${item.closeTime}",
                  icon: Iconsax.clock),
              const SizedBox(height: 3.0),
              DataIconPresent(
                  data: "${item.capacity} personas a foro",
                  icon: Iconsax.people),
              const SizedBox(height: 4.0),
              SizedBox(
                width: QuerySize.width(context, 1),
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
              ),
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
