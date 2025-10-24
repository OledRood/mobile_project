import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryLight = Color.fromRGBO(42, 18, 70, 1);
  static const secondary = Color.fromRGBO(249, 245, 255, 1);
  static const onSurface = Color.fromRGBO(26, 26, 26, 1);
  static const onSurfaceVariant = Color.fromRGBO(13, 13, 13, 0.2);
  static const primaryContainer = Color.fromRGBO(208, 213, 221, 1);

  static const grey = Color.fromRGBO(102, 112, 133, 1);
  static const stroke = Color.fromRGBO(208, 213, 221, 1);

  static const white = Color.fromRGBO(255, 255, 255, 1);

  static const backgroundLight = Colors.white;
  static const backgroundDark = Color(0xFF121212);

  static const onSurfaceLight = Color(0xff2A1246);
  static const onSurfaceDark = Color(0xFFE1E1E1);

  static const unEnable = Color(0xffE4E7EC);

  // OutlineButton colors
  static const outlineButtonForegroundDisabled = Color.fromRGBO(
    42,
    18,
    70,
    0.39,
  );
  static const colorForFinalSignUp = Color.fromRGBO(16, 24, 40, 1);
}

class AppColorsLight {
  AppColorsLight._();

  //Заполненные кнопки,
  static const primary = Color.fromRGBO(42, 18, 70, 1);
  static const onPrimary = Color.fromRGBO(255, 255, 255, 1);

  //Нажатая карта, верххняя часть главного экрана
  static const surfaceContainer = Color.fromRGBO(249, 245, 255, 1);
  static const onSecondary = Color.fromRGBO(26, 26, 26, 1);

  static const surface = Color.fromRGBO(255, 255, 255, 1);
  static const onSurface = Color.fromRGBO(26, 26, 26, 1);

  static const onSurfaceVariant = Color.fromRGBO(13, 13, 13, 0.2);
  static const primaryContainer = Color.fromRGBO(208, 213, 221, 1);

  static const outline = Color.fromRGBO(208, 213, 221, 1);
  static const outlineVariant = Color.fromRGBO(173, 181, 189, 1);

  static const error = Color.fromRGBO(240, 68, 56, 1);
}

class AppColorsDark {
  AppColorsDark._();
  static const surfaceContainer = Color(0xFF232028);
}
