import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasikuna_admin/core/config/app_config.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';
import 'package:wasikuna_admin/core/theme/app_theme.dart';
import 'package:wasikuna_admin/core/utils/dependency_injection.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize();
  DependencyInjection.init();
  initializeDateFormatting();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final colors = ref.watch(colorsStateProvider);

    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Wasikuna',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: appTheme(context, colors),
      ),
    );
  }
}
