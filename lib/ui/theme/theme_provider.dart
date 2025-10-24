import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/services/settings_service.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final SettingsService _settingsService;

  ThemeNotifier(this._settingsService) : super(ThemeMode.light) {
    _loadTheme();
  }

  void _loadTheme() async {
    state = await _settingsService.getThemeMode();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (state != themeMode) {
      state = themeMode;
      await _settingsService.saveThemeMode(themeMode);
    }
  }
}

/// Провайдер, который хранит текущий режим темы.
final themeModeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((
  ref,
) {
  final settingsService = ref.watch(settingsServiceProvider);
  return ThemeNotifier(settingsService);
});
