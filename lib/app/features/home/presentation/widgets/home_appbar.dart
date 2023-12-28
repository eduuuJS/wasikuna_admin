import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/app/features/home/presentation/widgets/circular_theme_selector.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/buttons/icon_wrapper.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class HomeAppbar extends ConsumerWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    final isDarkTheme = ref.watch(themeStateProvider);
    Widget themeSelector = Container(
      height: 24,
      decoration: BoxDecoration(
          color: colors[ColorsName.borderContainerColor],
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          CircularThemeSelector(
            onTap: () {
              ref.read(themeStateProvider.notifier).selectIsDark(true);
            },
            icon: Iconsax.moon5,
            isActive: isDarkTheme,
            isMoon: true,
            primary: colors[ColorsName.primaryColor]!,
          ),
          const SizedBox(
            width: 5.0,
          ),
          CircularThemeSelector(
            onTap: () {
              ref.read(themeStateProvider.notifier).selectIsDark(false);
            },
            icon: Iconsax.sun_15,
            isActive: !isDarkTheme,
            isMoon: false,
            primary: colors[ColorsName.primaryColor]!,
          ),
        ],
      ),
    );
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
          const SizedBox(width: 13),
          Image(
            image: const AssetImage(
              "assets/img/logo_literal.png",
            ),
            width: 140.w,
          ),
          const Spacer(),
          themeSelector
        ],
      ),
    );
  }
}

class HomeAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const HomeAppbar();
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
