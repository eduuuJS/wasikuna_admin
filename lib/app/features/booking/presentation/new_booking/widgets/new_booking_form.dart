import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/new_booking_controller.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/file_card_img.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/action_dialog.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/dialogs/alerts.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/inputs/input_primary.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/helpers.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';
import 'package:wasikuna_admin/core/utils/validators.dart';

class NewBookingForm extends ConsumerWidget {
  const NewBookingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    //Elements
    Widget inputInitTime = InputPrimary(
      label: "Hora de inicio",
      textEditingController:
          ref.watch(newBookingControllerProvider.notifier).ctrlStartTime,
      validator: (p0) {
        return Validators.formatHour(p0 ?? "");
      },
      suffix: IconWrapper(
        child: Icon(
          Iconsax.clock,
          color: colors[ColorsName.secondaryLetterColor],
          size: 16.0,
        ),
        onTap: () async {
          final currentTime = Helpers.stringFormatToTime(ref
              .read(newBookingControllerProvider.notifier)
              .ctrlStartTime
              .text);
          final time = await showTimePicker(
            context: context,
            initialTime: currentTime,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!,
              );
            },
          );
          if (time != null) {
            ref.read(newBookingControllerProvider.notifier).ctrlStartTime.text =
                Helpers.timeOfDayToStringformat(time);
          }
        },
      ),
    );
    Widget inputEndTime = InputPrimary(
      label: "Hora fin",
      textEditingController:
          ref.watch(newBookingControllerProvider.notifier).ctrlEndTime,
      validator: (p0) {
        return Validators.formatHour(p0 ?? "");
      },
      suffix: IconWrapper(
        child: Icon(
          Iconsax.clock,
          color: colors[ColorsName.secondaryLetterColor],
          size: 16.0,
        ),
        onTap: () async {
          final currentTime = Helpers.stringFormatToTime(
              ref.read(newBookingControllerProvider.notifier).ctrlEndTime.text);
          final time = await showTimePicker(
            context: context,
            initialTime: currentTime,
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!,
              );
            },
          );
          if (time != null) {
            ref.read(newBookingControllerProvider.notifier).ctrlEndTime.text =
                Helpers.timeOfDayToStringformat(time);
          }
        },
      ),
    );

    final btnAddImg = Column(
      children: [
        IconWrapper(
          radius: 20.0,
          onTap: () {
            _chooseBottomSheet(context, ref);
          },
          child: Icon(
            Iconsax.camera,
            color: colors[ColorsName.primaryColor],
          ),
        ),
        Text(
          "Agregar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: colors[ColorsName.primaryColor],
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
        Text(
          "comprobante",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: colors[ColorsName.primaryColor],
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        )
      ],
    );

    final btnAddImg2 = IconWrapper(
      onTap: () {
        _chooseBottomSheet(context, ref);
      },
      child: Icon(
        Iconsax.add_circle,
        color: colors[ColorsName.primaryColor],
      ),
    );

    Widget inputPhotos = Consumer(builder: (context, ref, child) {
      final imgList = ref.watch(imageListStateProvider);
      return Container(
          height: 108.0,
          width: QuerySize.width(context, 1) - 30,
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border:
                  Border.all(color: colors[ColorsName.borderContainerColor]!)),
          child: imgList.isEmpty
              ? btnAddImg
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imgList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == imgList.length) {
                      return Row(
                        children: [
                          const SizedBox(width: 10.0),
                          btnAddImg2,
                        ],
                      );
                    }
                    return FileCardImg(file: imgList[index]);
                  }));
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Form(
        key: ref.watch(newBookingControllerProvider.notifier).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pago y hora de reserva",
              style: TextStyle(
                  color: colors[ColorsName.mainLetterColor],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const MainDivider(),
            Row(
              children: [
                Expanded(child: inputInitTime),
                const SizedBox(width: 25.0),
                Expanded(child: inputEndTime)
              ],
            ),
            const MainDivider(),
            inputPhotos
          ],
        ),
      ),
    );
  }

  _chooseBottomSheet(BuildContext context, WidgetRef ref) {
    Alerts.showBottomSheet(context,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            const Text("Agregar comprobante",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.0),
            ListTile(
              leading: const Icon(Iconsax.camera, size: 20.0),
              title: const Text("Tomar una foto",
                  style: TextStyle(fontSize: 14.0)),
              onTap: () {
                _getImageFromCamera().then((value) {
                  _processImage(value, ref, context);
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.image, size: 20.0),
              title: const Text("Subir una foto",
                  style: TextStyle(fontSize: 14.0)),
              onTap: () {
                _getImageFromGallery().then((value) {
                  _processImage(value, ref, context);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  _processImage(File? value, WidgetRef ref, BuildContext context) {
    if (value != null) {
      final result = ref.read(imageListStateProvider.notifier).addImage(value);
      if (!result) {
        Alerts.getDialog(
            context,
            const ActionDialog(
              type: AlertType.error,
              title: "Error",
              subTitle: "Se pueden agregar 3 imágenes como máximo",
            ));
      }
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
}
