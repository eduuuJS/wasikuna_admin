import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/new_boocking_body.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/new_booking_appbar.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/new_booking_footer.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/parser.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class NewBookingView extends ConsumerWidget {
  const NewBookingView(
      {Key? key, required this.idArea, required this.dateBooking})
      : super(key: key);
  final String idArea;
  final DateTime dateBooking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final isLoading = ref.watch(newBookingLoaderProvider(idArea, dateBooking));
    final data = ref.watch(areaDetailBookingProvider);
    return Scaffold(
      backgroundColor: colors[ColorsName.backgroundColor],
      body: SafeArea(
        child: SizedBox(
          height: QuerySize.height(context, 1),
          child: isLoading.when(
              data: (_) {
                return Column(
                  children: [
                    const NewBookingAppbar(),
                    NewBoockingBody(
                      dateBooking: Parser.dateToDDMMYYYY(dateBooking),
                    ),
                    NewBookingFooter(totalCoast: data!.totalCoast)
                  ],
                );
              },
              error: (e, __) => null,
              loading: () {
                return const Column(
                  children: [
                    NewBookingAppbar(),
                    Spacer(),
                    LoadingWidget(),
                    Spacer(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
