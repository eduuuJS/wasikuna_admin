import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/messages/box_message.dart';

class CommonAreasRules extends ConsumerWidget {
  const CommonAreasRules({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: const BoxMessage(
        content:
            "Estimado propietario por favor sírvase a revisar las normas de conducta y responsabilidades que usted debe asumir al realizar su reserva ver documento",
        title: "Normas de conducta",
      ),
    );
  }
}
