import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/schedule_area_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/widgets/avilable_area_msg.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/widgets/boocking_list_viewer.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/schedule_area/widgets/schedule_area_appbar.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class ScheduleArea extends ConsumerWidget {
  const ScheduleArea(
      {super.key,
      required this.idArea,
      required this.nameArea,
      required this.coastArea});
  final String idArea;
  final String nameArea;
  final String coastArea;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final date = DateTime.now();
    final dateToSend = DateTime(date.year, date.month, date.day);
    final isLoading =
        ref.watch(scheduleAreasLoaderProvider(idArea, dateToSend));
    final listBooking = ref.watch(scheduleAreasListProvider);

    final loading = CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: ScheduleAppBarDelegate(nameArea: nameArea, idArea: idArea),
          pinned: true,
        ),
        const SliverFillRemaining(
          child: Align(
            alignment: Alignment.center,
            child: LoadingWidget(),
          ),
        ),
      ],
    );

    final dataSliver = CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: ScheduleAppBarDelegate(nameArea: nameArea, idArea: idArea),
          pinned: true,
        ),
        if (listBooking.isNotEmpty) const BookingListViewer(),
        if (listBooking.isEmpty)
          const SliverFillRemaining(
            child: Align(
              alignment: Alignment.center,
              child: AvailableAreaMsg(),
            ),
          ),
      ],
    );

    return Scaffold(
      backgroundColor: colors[ColorsName.backgroundColor],
      body: SafeArea(
        child: SizedBox(
          height: QuerySize.height(context, 1),
          child: isLoading.when(
              data: (_) => dataSliver,
              error: (e, __) => null,
              loading: () => loading),
        ),
      ),
    );
  }
}
