import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryLight = Color.fromRGBO(42, 18, 70, 1);

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

  static const largeText = Color.fromRGBO(26, 26, 26, 1);

  static const outlineButtonForegroundClick = Colors.white;
  static const outlineButtonForegroundDefault = primaryLight;

  static const outlineButtonSideDisabled = Color(0xff2A124633);
  static const outlineButtonSideClick = Color.fromRGBO(42, 18, 70, 1);
  static const outlineButtonSideDefault = Color(0xff2A1246);

  static const outlineButtonBackgroundDisabled = Colors.transparent;
  static const outlineButtonBackgroundClick = Color.fromRGBO(42, 18, 70, 0.8);
  static const outlineButtonBackgroundDefault = Colors.transparent;

  // FilledButton colors
  static const filledButtonForegroundDisabled = Colors.white;
  static const filledButtonForegroundClick = Colors.white;
  static const filledButtonForegroundDefault = Colors.white;

  static const filledButtonBackgroundDisabled = Color.fromRGBO(42, 18, 70, 0.2);
  static const filledButtonBackgroundClick = Color.fromRGBO(42, 18, 70, 1);
  static const filledButtonBackgroundOverlay = Color.fromRGBO(0, 0, 0, 0.2);

  static const filledButtonBackgroundDefault = Color.fromRGBO(42, 18, 70, 1);

  // TextButton colors
  static const textButtonForegroundDefault = Color.fromRGBO(42, 18, 70, 1);
  static const textButtonForegroundClick = Colors.black;
  static const textButtonForegroundDisabled = Color.fromRGBO(42, 18, 70, 0.39);

  static const textButtonOverlay = Colors.transparent;

  //TextField
  static const textFieldText = Color.fromRGBO(102, 112, 133, 1);
  static const textFieldBorder = Color.fromRGBO(208, 213, 221, 1);
  static const textFieldError = Color.fromRGBO(240, 68, 56, 1);
  static const textFieldIcon = Color.fromRGBO(208, 213, 221, 1);
  static const textOnTextField = Color.fromRGBO(64, 64, 64, 1);
}
