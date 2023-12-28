import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_controller.dart';

class FileCardImg extends ConsumerWidget {
  const FileCardImg({Key? key, required this.file}) : super(key: key);
  final File file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 7.0),
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image:
                  DecorationImage(image: FileImage(file), fit: BoxFit.cover)),
        ),
        Positioned(
            top: 3,
            right: 10,
            child: GestureDetector(
              onTap: () {
                ref.read(imageListStateProvider.notifier).removeImage(file);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(
                  Icons.close,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
