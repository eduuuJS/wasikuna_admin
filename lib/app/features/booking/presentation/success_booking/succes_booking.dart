import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/primary_button.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class SuccesBooking extends ConsumerWidget {
  const SuccesBooking({Key? key, required this.isApprobed}) : super(key: key);
  final bool isApprobed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50.0),
            Column(
              children: [
                Container(
                    width: 70.0,
                    height: 90.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/success.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: QuerySize.width(context, 0.7),
                  child: Text(
                      isApprobed
                          ? '¡La reserva fue aprobada satisfactoriamente!'
                          : '¡La reserva ha sido observada!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: colors[ColorsName.mainLetterColor])),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                    width: QuerySize.width(context, 0.8),
                    child: Text(
                        isApprobed
                            ? 'En unos momentos el cliente será notificado con la aprobación de su reserva. '
                            : 'En unos momentos el cliente será notificado con la observación de su reserva. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: colors[ColorsName.secondaryLetterColor]))),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButtonCircular(
                      label: "Compartir",
                      onTap: () {},
                      icon: Iconsax.share,
                    ),
                    const SizedBox(width: 35.0),
                    ActionButtonCircular(
                      label: "WhatsApp",
                      onTap: () {},
                      icon: Iconsax.call,
                    ),
                  ],
                ),
                const SizedBox(height: 35.0),
                Row(
                  children: [
                    Expanded(
                        child: PrimaryButton(
                      label: "Volver al inicio",
                      onTap: () {
                        context.go(AppRoutesNamed.homeRoute);
                      },
                    ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ActionButtonCircular extends ConsumerWidget {
  const ActionButtonCircular(
      {Key? key, required this.label, required this.onTap, required this.icon})
      : super(key: key);

  final String label;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
              border: Border.all(color: colors[ColorsName.borderBoxColor]!),
              borderRadius: BorderRadius.circular(30.0)),
          child: IconButton(
            onPressed: onTap,
            icon: Icon(icon, color: colors[ColorsName.primaryColor]),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(label,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: colors[ColorsName.secondaryLetterColor])),
      ],
    );
  }
}
