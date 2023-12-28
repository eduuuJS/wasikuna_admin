import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class PaymentBookingImgs extends ConsumerWidget {
  const PaymentBookingImgs({Key? key, required this.imgs}) : super(key: key);
  final List<String> imgs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Adjuntos",
          style: TextStyle(
              color: colors[ColorsName.mainLetterColor],
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        const MainDivider(space: 10.0),
        SizedBox(
          height: 80.0,
          child: ListView.separated(
              itemCount: imgs.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10.0),
              itemBuilder: (context, index) {
                return Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(imgs[index]), fit: BoxFit.cover)),
                );
              }),
        )
      ],
    );
  }
}
