import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/images/circular_wrapper.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class CreatePostZone extends ConsumerWidget {
  const CreatePostZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors[ColorsName.borderContainerColor]!,
            width: 10.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.push(AppRoutesNamed.createPost, extra: 0);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularWrapper(
                        radius: 20.0,
                        url:
                            "https://greenti.pe/api/attachments/user/image/d06c0054-241d-4c54-8caf-f8bcb50eeb48"),
                    const SizedBox(width: 12.0),
                    Text(
                      "¿Deseas publicar una noticia o informe?",
                      style: TextStyle(
                          color: colors[ColorsName.secondaryLetterColor],
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: getItemFileType(Iconsax.image, "Imagen",
                      Colors.greenAccent, ref, context, 1)),
              Expanded(
                  child: getItemFileType(Iconsax.camera, "Cámara",
                      Colors.cyanAccent, ref, context, 2)),
              Expanded(
                  child: getItemFileType(Iconsax.archive, "Archivo",
                      Colors.orangeAccent, ref, context, 3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget getItemFileType(IconData icon, String text, Color color, WidgetRef ref,
      BuildContext context, int fileType) {
    final colors = ref.watch(colorsStateProvider);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.push(AppRoutesNamed.createPost, extra: fileType);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20.0, color: color),
              const SizedBox(width: 8.0),
              Text(
                text,
                style: TextStyle(
                    color: colors[ColorsName.secondaryLetterColor],
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
