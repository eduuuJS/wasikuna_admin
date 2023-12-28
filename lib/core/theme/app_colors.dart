import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_colors.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  @override
  bool build() {
    return false;
  }

  void switchTheme() {
    state = !state;
    ref.watch(colorsStateProvider.notifier).switchColors();
  }

  void selectIsDark(bool value) {
    state = value;
    ref.watch(colorsStateProvider.notifier).switchColors();
  }
}

@riverpod
class ColorsState extends _$ColorsState {
  Map<ColorsName, Color> lightColors = {
    ColorsName.whiteColor: const Color.fromRGBO(255, 255, 255, 1),
    ColorsName.primaryColor: const Color.fromRGBO(101, 50, 121, 1),
    ColorsName.secondaryColor: const Color.fromRGBO(0, 151, 117, 1),
    ColorsName.backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    ColorsName.mainLetterColor: const Color.fromRGBO(43, 45, 65, 1),
    ColorsName.secondaryLetterColor: const Color.fromRGBO(125, 126, 138, 1),
    ColorsName.borderBoxColor: const Color.fromRGBO(230, 230, 241, 1),
    ColorsName.borderContainerColor: const Color.fromRGBO(233, 244, 241, 1),
    ColorsName.importantColor: const Color.fromRGBO(246, 163, 65, 1),
  };

  Map<ColorsName, Color> darkColors = {
    ColorsName.whiteColor: const Color.fromRGBO(255, 255, 255, 1),
    ColorsName.primaryColor: const Color.fromRGBO(101, 50, 121, 1),
    ColorsName.secondaryColor: const Color.fromRGBO(0, 151, 117, 1),
    ColorsName.backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
    ColorsName.mainLetterColor: const Color.fromRGBO(255, 255, 255, 1),
    ColorsName.secondaryLetterColor: const Color.fromRGBO(157, 158, 170, 1),
    ColorsName.borderBoxColor: const Color.fromRGBO(230, 230, 241, 1),
    ColorsName.borderContainerColor: const Color.fromRGBO(10, 0, 62, 0.42),
    ColorsName.importantColor: const Color.fromRGBO(246, 163, 65, 1),
  };

  @override
  Map<ColorsName, Color> build() {
    return lightColors;
  }

  void switchColors() {
    final isDarkTheme = ref.watch(themeStateProvider);
    if (isDarkTheme) {
      state = darkColors;
    } else {
      state = lightColors;
    }
  }
}

enum ColorsName {
  whiteColor,
  primaryColor,
  backgroundColor,
  mainLetterColor,
  secondaryLetterColor,
  borderBoxColor,
  secondaryColor,
  borderContainerColor,
  importantColor
}
