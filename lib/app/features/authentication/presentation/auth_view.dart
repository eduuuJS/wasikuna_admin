import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasikuna_admin/app/features/authentication/presentation/widgets/form_login.dart';
import 'package:wasikuna_admin/app/shared/presentation/components/separators/main_divider.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/utils/query_size.dart';

class AuthView extends ConsumerWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Scaffold(
      backgroundColor: colors[ColorsName.backgroundColor],
      body: SafeArea(
          child: SizedBox(
        height: QuerySize.height(context, 1),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage(
                  "assets/img/city.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            ListView(
              children: [
                const MainDivider(),
                Center(
                  child: Image(
                    image: const AssetImage(
                      "assets/img/logo_light.png",
                    ),
                    width: 120.w,
                  ),
                ),
                const MainDivider(space: 45.0),
                const FormLogin(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
