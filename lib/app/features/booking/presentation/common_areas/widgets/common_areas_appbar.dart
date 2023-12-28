import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class CommonAreasAppbar extends ConsumerWidget {
  const CommonAreasAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);

    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors[ColorsName.backgroundColor],
        border: Border(
          bottom: BorderSide(
            color: colors[ColorsName.borderContainerColor]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          IconWrapper(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: colors[ColorsName.mainLetterColor],
              size: 25,
            ),
          ),
          const SizedBox(width: 13.0),
          Text(
            "Áreas comunes",
            style: TextStyle(
                color: colors[ColorsName.mainLetterColor],
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CommonAreasAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const CommonAreasAppbar();
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
