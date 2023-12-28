import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class CircularWrapper extends ConsumerWidget {
  const CircularWrapper(
      {super.key,
      required this.url,
      this.radius = 30.0,
      this.isOnFire = false});
  final String url;
  final double radius;
  final bool isOnFire;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: colors[ColorsName.primaryColor],
          radius: radius,
          child: CircleAvatar(
            radius: radius - 2.5,
            backgroundImage: NetworkImage(
              url,
            ),
          ),
        ),
        if (isOnFire)
          Positioned(
            left: radius * 2 - 22.0,
            top: radius * 2 - 22.0,
            child: CircleAvatar(
              radius: 11,
              backgroundColor: colors[ColorsName.importantColor],
              child: const Icon(
                Icons.star_sharp,
                size: 16,
                color: Color.fromRGBO(255, 227, 82, 1),
              ),
            ),
          )
      ],
    );
  }
}
