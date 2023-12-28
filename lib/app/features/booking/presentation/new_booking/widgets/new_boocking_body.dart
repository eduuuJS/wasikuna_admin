import 'package:flutter/material.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/info_area_card.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/new_booking_form.dart';
import 'package:wasikuna_admin/app/features/booking/presentation/new_booking/widgets/new_booking_resume.dart';

class NewBoockingBody extends StatelessWidget {
  const NewBoockingBody({Key? key, required this.dateBooking})
      : super(key: key);
  final String dateBooking;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
      child: ListView(
        children: [
          const InfoAreaCard(),
          const NewBookingForm(),
          NewBookingResume(dateBooking: dateBooking)
        ],
      ),
    ));
  }
}
