import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/multi_img_viewer/widgets/animated_bar_multi_img.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/images/circular_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class MultiImgAppbar extends ConsumerWidget {
  const MultiImgAppbar({Key? key, required this.item, required this.imgs})
      : super(key: key);
  final ScheduleAreaItemDomain item;
  final List<String> imgs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      color: colors[ColorsName.primaryColor]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 30.0),
          AnimatedBarMultiImg(
            imgs: imgs,
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularWrapper(
                        url: item.urlPhotoOwner,
                        isOnFire: item.isOnFireOwner,
                        radius: 22.5),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dpto. ${item.flatNumber}",
                          style: TextStyle(
                              color: colors[ColorsName.whiteColor],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          item.ownerName,
                          style: TextStyle(
                              color: colors[ColorsName.whiteColor],
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                IconWrapper(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white60,
                      radius: 17.5,
                      child: Icon(Icons.close,
                          color: colors[ColorsName.whiteColor], size: 20.0),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
