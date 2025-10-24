import 'package:flutter/material.dart';
import 'package:mobile_study/ui/theme/models/app_colors.dart';

class AppTheme {
  static const Color accentColor = Color(0xFFFFC107);
  static const Color surfaceColor = Colors.white;
  static const Color errorColor = Color(0xFFE53E3E);

  //MARK: - Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Montserrat',
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundLight,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.largeText,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.stroke),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.stroke, width: 1),
        ),
        side: const BorderSide(color: AppColors.stroke, width: 1),
      ),
      textTheme: TextTheme(
        // Splash,
        displayLarge: TextStyle(
          color: AppColors.onSurfaceLight,
          fontWeight: FontWeight.w600,
          // fontFamily: 'Montserrat',
          fontSize: 24,
        ),
        displayMedium: TextStyle(
          color: AppColors.onSurfaceLight,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        displaySmall: TextStyle(
          color: AppColors.onSurfaceLight,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          color: AppColors.largeText,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        //TextField
        bodySmall: TextStyle(
          color: AppColors.textFieldText,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        // Над textfield
        bodyMedium: TextStyle(
          color: AppColors.textOnTextField,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        headlineLarge: TextStyle(
          color: AppColors.largeText,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        headlineMedium: TextStyle(
          color: AppColors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),

        titleLarge: TextStyle(
          color: AppColors.colorForFinalSignUp,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        titleSmall: TextStyle(
          color: AppColors.largeText,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),

        labelLarge: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 22 / 14,
          // line-height 22px для fontSize 14px
          letterSpacing: 0,
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.primaryLight,
        ),
        labelSmall: TextStyle(
          color: AppColors.textFieldError,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),

      // MARK: - Widgets Themes
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.outlineButtonForegroundDisabled;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.outlineButtonForegroundClick;
            }
            return AppColors.outlineButtonForegroundDefault;
          }),

          side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return const BorderSide(
                color: AppColors.outlineButtonSideDisabled,
                width: 1,
              );
            }
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(
                color: AppColors.outlineButtonSideClick,
                width: 1,
              );
            }
            return BorderSide(
              color: AppColors.outlineButtonSideDefault,
              width: 1,
            );
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.outlineButtonBackgroundClick;
            }

            if (states.contains(WidgetState.disabled)) {
              return AppColors.outlineButtonBackgroundDisabled;
            }
            return AppColors.outlineButtonBackgroundDefault;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(0),
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.filledButtonForegroundDisabled;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.filledButtonForegroundClick;
            }
            return AppColors.filledButtonForegroundDefault;
          }),

          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.filledButtonBackgroundClick;
            }

            if (states.contains(WidgetState.disabled)) {
              return AppColors.filledButtonBackgroundDisabled;
            }
            return AppColors.filledButtonBackgroundDefault;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          overlayColor: WidgetStatePropertyAll(
            AppColors.filledButtonBackgroundOverlay,
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((state) {
            if (state.contains(WidgetState.pressed)) {
              return AppColors.textButtonForegroundClick;
            }
            if (state.contains(WidgetState.disabled)) {
              return AppColors.textButtonForegroundDisabled;
            }
            return AppColors.textButtonForegroundDefault;
          }),
          overlayColor: WidgetStatePropertyAll(AppColors.textButtonOverlay),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme;
  }
}
