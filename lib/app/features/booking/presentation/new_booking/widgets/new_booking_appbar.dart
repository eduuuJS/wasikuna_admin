import 'package:flutter/material.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/pages/custom_appbar.dart';

class NewBookingAppbar extends StatelessWidget {
  const NewBookingAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomAppbar(title: "Reservar");
  }
}
