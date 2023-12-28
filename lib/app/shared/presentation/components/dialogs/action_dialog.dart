import 'package:flutter/material.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/chips/primary_chip.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/chips/secondary_chip.dart';

class ActionDialog extends StatelessWidget {
  const ActionDialog({
    Key? key,
    required this.type,
    required this.title,
    required this.subTitle,
    this.doubleButton = false,
    this.aceptText,
    this.cancelText,
    this.onTapAcept,
    this.onTapCancel,
  }) : super(key: key);
  final AlertType type;
  final String title;
  final String subTitle;
  final bool doubleButton;
  final String? aceptText;
  final String? cancelText;
  final void Function()? onTapAcept;
  final void Function()? onTapCancel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage(switchImage()), width: 60.0),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width * factorWidth,
            child: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            // width: MediaQuery.of(context).size.width * factorWidth,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          doubleButton
              ? SizedBox(
                  // width: MediaQuery.of(context).size.width * factorWidth,
                  child: Row(
                    children: [
                      Expanded(
                          child: SecondaryChip(
                        label: cancelText ?? "Cancelar",
                        onTap: onTapCancel,
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: PrimaryChip(
                          label: aceptText ?? "Aceptar",
                          onTap: onTapAcept,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  child: PrimaryChip(
                    label: aceptText ?? "Aceptar",
                    onTap: onTapAcept ?? () => Navigator.pop(context),
                  ),
                ),
        ],
      ),
    );
  }

  String switchImage() {
    switch (type) {
      case AlertType.error:
        return "assets/img/error_ico.png";
      case AlertType.success:
        return "assets/img/succes_ico.png";
      case AlertType.warning:
        return "assets/img/warning_ico.png";
      default:
        return "assets/img/error_ico.png";
    }
  }
}

enum AlertType { error, success, warning }
