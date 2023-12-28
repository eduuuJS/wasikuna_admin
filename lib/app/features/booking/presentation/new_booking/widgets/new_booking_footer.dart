// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/primary_button.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/action_dialog.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/alerts.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/spinner.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class NewBookingFooter extends ConsumerWidget {
  const NewBookingFooter({Key? key, required this.totalCoast})
      : super(key: key);
  final String totalCoast;

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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total a pagar",
                      style: TextStyle(
                          color: colors[ColorsName.secondaryLetterColor],
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 7.0),
                    Text(
                      "S/ $totalCoast",
                      style: TextStyle(
                          color: colors[ColorsName.mainLetterColor],
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
                Expanded(
                    child: PrimaryButton(
                  label: "Confirmar",
                  onTap: () {
                    if (ref
                        .read(newBookingControllerProvider.notifier)
                        .formKey
                        .currentState!
                        .validate()) {
                      final result = ref
                          .read(newBookingControllerProvider.notifier)
                          .validate();
                      if (result == null) {
                        _createBooking(ref, context);
                      } else {
                        Alerts.getDialog(
                            context,
                            ActionDialog(
                              type: AlertType.error,
                              title: "Error",
                              subTitle: result,
                            ));
                      }
                    } else {}
                  },
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _createBooking(WidgetRef ref, BuildContext context) async {
    ref.watch(spinnerStateProvider.notifier).show();
    final response =
        await ref.read(newBookingControllerProvider.notifier).createBooking();
    ref.watch(spinnerStateProvider.notifier).hide();
    if (response.success) {
      context.go(AppRoutesNamed.successBooking);
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
