// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/review_booking/review_booking_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/primary_button.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/secondary_button.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/action_dialog.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/alerts.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/spinner.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class ReviewBookingFooter extends ConsumerWidget {
  const ReviewBookingFooter({Key? key, required this.idBooking})
      : super(key: key);
  final String idBooking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: colors[ColorsName.borderContainerColor]!))),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: SecondaryButton(
                  label: "Observar",
                  onTap: () {
                    _doOperation(ref, context, false, idBooking);
                  },
                )),
                const SizedBox(width: 15.0),
                Expanded(
                    child: PrimaryButton(
                  label: "Aprobar",
                  onTap: () {
                    _doOperation(ref, context, true, idBooking);
                  },
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _doOperation(WidgetRef ref, BuildContext context, bool isApproved,
      String idBooking) async {
    ref.watch(spinnerStateProvider.notifier).show();
    final response = await ref
        .read(reviewBookingControllerProvider.notifier)
        .reviewBooking(isApproved, idBooking);
    ref.watch(spinnerStateProvider.notifier).hide();
    if (response.success) {
      context.go(AppRoutesNamed.successBooking, extra: isApproved);
    } else {
      Alerts.getDialog(
          context,
          ActionDialog(
            type: AlertType.error,
            title: "Error",
            subTitle: response.message,
          ));
    }
  }
}
