import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvailableAreaMsg extends ConsumerWidget {
  const AvailableAreaMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20.0),
        GestureDetector(
            onTap: () {
              // context.push(AppRoutesNamed.reviewBooking,
              //     extra: ScheduleAreaItemDomain(
              //         idBooking: "2",
              //         flatNumber: "801",
              //         ownerName: "Axel Vazquez",
              //         urlPhotoOwner:
              //             "https://greenti.pe/api/attachments/user/image/d06c0054-241d-4c54-8caf-f8bcb50eeb48",
              //         isOnFireOwner: false,
              //         startTime: "08:00 am",
              //         endTime: "09:00 am",
              //         state: BoockingState.pending));
            },
            child: const Image(
                image: AssetImage("assets/img/warning_ico.png"), width: 60.0)),
        const SizedBox(height: 10.0),
        const Text(
          "No hay reservas para este día",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 3.0),
      ],
    );
  }
}
