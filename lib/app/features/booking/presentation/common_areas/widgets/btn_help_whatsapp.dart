import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class BtnHelpWhatsapp extends ConsumerWidget {
  const BtnHelpWhatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      height: 55.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: colors[ColorsName.borderContainerColor],
                borderRadius: BorderRadius.circular(15.0)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 17.0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Necesitas ayuda?",
                        style: TextStyle(
                            fontSize: 14,
                            color: colors[ColorsName.secondaryColor],
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 25.0),
                      Icon(
                        Iconsax.call,
                        color: colors[ColorsName.secondaryColor],
                        size: 24.0,
                      )
                    ],
                  )),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
