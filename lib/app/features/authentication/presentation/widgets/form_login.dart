// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/authentication/presentation/auth_controller.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/primary_button.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/action_dialog.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/alerts.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/spinner.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/inputs/input_primary.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/validators.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final keyForm = GlobalKey<FormState>();

    //Elements
    Widget inputUser = InputPrimary(
      label: "Usuario",
      textEditingController:
          ref.watch(authControllerProvider.notifier).ctrlUser,
      validator: (value) {
        return Validators.simpleRequired(value ?? "");
      },
    );
    Widget inputPassword = Consumer(builder: (context, ref, child) {
      final isPrivate = ref.watch(privateTextPasswordAuthProvider);
      return InputPrimary(
        label: "Contraseña",
        privateText: isPrivate,
        textEditingController:
            ref.watch(authControllerProvider.notifier).ctrlPassword,
        validator: (value) {
          return Validators.simpleRequired(value ?? "");
        },
        suffix: IconWrapper(
          onTap: () {
            ref.read(privateTextPasswordAuthProvider.notifier).switchState();
          },
          child: Icon(
            isPrivate ? Iconsax.eye : Iconsax.eye_slash,
            size: 21.0,
            color: colors[ColorsName.secondaryLetterColor],
          ),
        ),
        onEditingComplete: () {
          if (keyForm.currentState!.validate()) {
            _doAuth(ref, context);
          }
        },
      );
    });
    Widget actionRecoveryPassword = Row(
      children: [
        Text(
          "¿Has olvidado la contraseña?",
          style: TextStyle(
              color: colors[ColorsName.secondaryLetterColor],
              fontSize: 13,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(width: 5.0),
        Text(
          "Recuperar aquí",
          style: TextStyle(
              color: colors[ColorsName.secondaryColor],
              fontSize: 14,
              fontWeight: FontWeight.w900),
        ),
      ],
    );
    Widget btnLogin = PrimaryButton(
      label: "Ingresar",
      onTap: () {
        if (keyForm.currentState!.validate()) {
          _doAuth(ref, context);
        }
      },
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: inputUser),
              ],
            ),
            const MainDivider(),
            Row(
              children: [
                Expanded(child: inputPassword),
              ],
            ),
            const MainDivider(),
            Row(
              children: [const Spacer(), actionRecoveryPassword],
            ),
            const MainDivider(),
            Row(
              children: [
                Expanded(child: btnLogin),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _doAuth(WidgetRef ref, BuildContext context) async {
    ref.watch(spinnerStateProvider.notifier).show();
    final response = await ref.read(authControllerProvider.notifier).doAuth();
    ref.watch(spinnerStateProvider.notifier).hide();
    if (response.success) {
      context.go(AppRoutesNamed.homeRoute);
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
