import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasikuna_admin/app/features/post/presentation/create_post/create_post_controller.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class CreatePostBottomBar extends ConsumerStatefulWidget {
  const CreatePostBottomBar({Key? key, required this.initFileType})
      : super(key: key);
  final int initFileType;

  @override
  ConsumerState<CreatePostBottomBar> createState() =>
      _CreatePostBottomBarState();
}

class _CreatePostBottomBarState extends ConsumerState<CreatePostBottomBar> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      switch (widget.initFileType) {
        case 0:
          break;
        case 1:
          _getImageFromGallery().then((value) {
            _processFile(value, ref, context);
          });
          break;
        case 2:
          _getImageFromCamera().then((value) {
            _processFile(value, ref, context);
          });
          break;
        case 3:
          _getArchive().then((value) {
            _processFile(value, ref, context);
          });
          break;
        default:
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: getItemFileType(Iconsax.image, "Imagen", Colors.greenAccent,
                () {
          _getImageFromGallery().then((value) {
            _processFile(value, ref, context);
          });
        })),
        Expanded(
            child: getItemFileType(Iconsax.camera, "Cámara", Colors.cyanAccent,
                () {
          _getImageFromCamera().then((value) {
            _processFile(value, ref, context);
          });
        })),
        Expanded(
            child: getItemFileType(
                Iconsax.archive, "Archivo", Colors.orangeAccent, () {
          _getArchive().then((value) {
            _processFile(value, ref, context);
          });
        })),
      ],
    );
  }

  Widget getItemFileType(
      IconData icon, String text, Color color, void Function()? onTap) {
    return Consumer(builder: (context, ref, _) {
      final colors = ref.watch(colorsStateProvider);
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colors[ColorsName.borderContainerColor]!,
                  width: 1.0,
                ),
              ),
            ),
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
    });
  }

  _processFile(File? value, WidgetRef ref, BuildContext context) {
    if (value != null) {
      ref.read(fileListCreatePostProvider.notifier).addFile(value);
    }
  }

  Future<File?> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> _getArchive() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    }
    return null;
  }
}
