import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/domain/schedule_area_item_domain.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/review_booking_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/review_booking_appbar.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/review_booking_body.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/widgets/review_booking_footer.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class ReviewBookingView extends ConsumerWidget {
  const ReviewBookingView({Key? key, required this.item}) : super(key: key);
  final ScheduleAreaItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(reviewBookingLoaderProvider(item.idBooking));
    final colors = ref.watch(colorsStateProvider);
    return Scaffold(
      backgroundColor: colors[ColorsName.backgroundColor],
      body: SafeArea(
        child: SizedBox(
          height: QuerySize.height(context, 1),
          child: isLoading.when(
              data: (data) {
                return Column(
                  children: [
                    ReviewBookingAppbar(
                      item: item,
                    ),
                    ReviewBoockingBody(detail: data, item: item),
                    ReviewBookingFooter(
                      idBooking: item.idBooking,
                    )
                  ],
                );
              },
              error: (e, __) => null,
              loading: () {
                return Column(
                  children: [
                    ReviewBookingAppbar(
                      item: item,
                    ),
                    const Spacer(),
                    const LoadingWidget(),
                    const Spacer(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
