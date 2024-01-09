import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/multi_img_viewer/multi_img_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/multi_img_viewer/widgets/multi_img_appbar.dart';

class MultiImgViewer extends ConsumerWidget {
  const MultiImgViewer(
      {Key? key, required this.item, required this.imgs, required this.index})
      : super(key: key);
  final ScheduleAreaItemDomain item;
  final List<String> imgs;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(setInitialIndexProvider((index * 2) + 1));
    final valueImgSelected = ref.watch(imgSelectedIndexProvider);
    return Scaffold(
        body: isLoading.when(
            data: (_) {
              return Column(
                children: [
                  Expanded(
                      child: MultiImgAppbar(
                    item: item,
                    imgs: imgs,
                  )),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTapUp: (details) {
                        if (details.localPosition.dx < 100) {
                          ref
                              .read(imgSelectedIndexProvider.notifier)
                              .previous(context, imgs.length);
                        } else if (details.localPosition.dx > 300) {
                          ref
                              .read(imgSelectedIndexProvider.notifier)
                              .next(context, imgs.length);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imgs[
                                    (((valueImgSelected + 1) / 2).floor()) -
                                        1]),
                                fit: BoxFit.fitHeight)),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (_, __) => null,
            loading: () {
              return const SizedBox();
            }));
  }
}
