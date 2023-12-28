import 'package:flutter/material.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

ThemeData appTheme(BuildContext context, Map<ColorsName, Color> colors) {
  return ThemeData(
    fontFamily: 'Montserrat',
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: colors[ColorsName.primaryColor],
    // scaffoldBackgroundColor: colors[ColorsName.backgroundColor],
    // colorScheme: ThemeData()
    //     .colorScheme
    //     .copyWith(primary: colors[ColorsName.primaryColor]),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   // backgroundColor: AppColors.kBottonNavigation,
    //   // unselectedItemColor: AppColors.kDisabled,
    //   // selectedItemColor: AppColors.kBase,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    //   type: BottomNavigationBarType.fixed,
    //   elevation: 10.0,
    //   selectedLabelStyle: TextStyle(
    //     fontSize: 12.0,
    //   ),
    //   unselectedLabelStyle: TextStyle(
    //     fontSize: 12.0,
    //   ),
    // ),
    // hintColor: AppColors.kBase,
    // brightness: Brightness.light,
    //fontFamily: 'Montserrat',
    // appBarTheme: const AppBarTheme(
    //   elevation: 0,
    //   titleSpacing: 0,
    //   centerTitle: true,
    //   // color: AppColors.kBackground,
    //   iconTheme: IconThemeData(
    //       // color: AppColors.kBase,
    //       ),
    //   // systemOverlayStyle: SystemUiOverlayStyle.light,
    // ),
    // cardTheme: CardTheme(
    //   color: Colors.white,
    //   elevation: 4,
    //   margin: EdgeInsets.zero,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.white,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(15.0),
    //     borderSide: const BorderSide(
    //       width: 0.0,
    //       color: Colors.transparent,
    //     ),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(15),
    //     borderSide: BorderSide(
    //       width: 1.0,
    //       color: colors[ColorsName.primaryColor]!,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(15),
    //     borderSide: BorderSide(
    //       width: 1.6,
    //       color: colors[ColorsName.primaryColor]!,
    //     ),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(15),
    //     borderSide: BorderSide(
    //       width: .6,
    //       color: colors[ColorsName.primaryColor]!,
    //     ),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(15),
    //     borderSide: BorderSide(
    //       width: .6,
    //       color: colors[ColorsName.primaryColor]!,
    //     ),
    //   ),
    //   labelStyle: Theme.of(context)
    //       .textTheme
    //       .bodyMedium
    //       ?.copyWith(color: colors[ColorsName.primaryColor]),
    //   prefixIconColor: colors[ColorsName.primaryColor],
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   elevation: 0,
    //   foregroundColor: Colors.white,
    //   backgroundColor: colors[ColorsName.primaryColor],
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    // ),
  );
}
