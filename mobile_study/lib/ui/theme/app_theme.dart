import 'package:flutter/material.dart';
import 'package:mobile_study/ui/theme/models/app_colors.dart';

class AppTheme {
  static final _lightColorScheme = ColorScheme.light(
    primary: AppColorsLight.primary,
    onPrimary: AppColorsLight.onPrimary,
    surfaceContainer: AppColorsLight.surfaceContainer,
    onSecondary: AppColorsLight.onSecondary,
    surface: AppColorsLight.surface,
    onSurface: AppColorsLight.onSurface,
    onSurfaceVariant: AppColorsLight.onSurfaceVariant,
    primaryContainer: AppColorsLight.primaryContainer,
    outline: AppColorsLight.outline,
    outlineVariant: AppColorsLight.outlineVariant,
    error: AppColorsLight.error,
  );

  static final _darkColorScheme = ColorScheme.dark(
    surfaceContainer: AppColorsDark.surfaceContainer,
  );
  static ThemeData _createTheme(ColorScheme colorScheme) {
    final isLight = colorScheme.brightness == Brightness.light;

    return ThemeData(
      fontFamily: 'Montserrat',
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,

      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme
              .primary, // ElevatedButton использует FilledButtonTheme в новых версиях
          foregroundColor: AppColorsLight.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: colorScheme.outlineVariant,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colorScheme.outlineVariant; // disabled
          }
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary; // checked
          }
          if (states.contains(WidgetState.hovered)) {
            return colorScheme.surface; // hover
          }
          return colorScheme.surface; // enabled but not checked — "waiting"
        }),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: colorScheme.outline, width: 1),
        ),

        side: BorderSide(color: colorScheme.outline, width: 1),
      ),
      textTheme: TextTheme(
        // Splash,
        displayLarge: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),

        displaySmall: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.17,
        ),
        // Над textfield
        bodyMedium: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),

        headlineLarge: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        headlineMedium: TextStyle(
          color: isLight
              ? AppColors.grey
              : colorScheme.onSurface.withOpacity(0.7),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),

        titleLarge: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),

        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          // line-height 22px для fontSize 14px
          letterSpacing: 0,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        labelSmall: TextStyle(
          color: colorScheme.error,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // MARK: - Widgets Themes
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onInverseSurface;
            }
            return colorScheme.onSurface;
          }),

          side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(color: colorScheme.primary, width: 1);
            }
            return BorderSide(color: colorScheme.onSurface, width: 1);
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary;
            }
            return colorScheme.surface;
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
              return colorScheme.onSurfaceVariant;
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.surface;
            }
            return Colors.white;
          }),

          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onSurface;
            }

            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurfaceVariant.withAlpha(30);
            }
            return colorScheme.primary;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          overlayColor: WidgetStatePropertyAll(colorScheme.onSurface),
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
              return colorScheme.onSurface;
            }
            if (state.contains(WidgetState.disabled)) {
              return colorScheme.onSurfaceVariant;
            }
            return colorScheme.primary;
          }),
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
      ),

      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        subtitleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => _createTheme(_lightColorScheme);
  static ThemeData get darkTheme => _createTheme(_darkColorScheme);
}
