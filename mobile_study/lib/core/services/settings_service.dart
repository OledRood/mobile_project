import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _themeModeKey = 'theme_mode';
  static const String _photoStorageKey = 'user_photo';

  final AuthNotifier authNotifier;

  SettingsService({required this.authNotifier});

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, themeMode.name);
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeName = prefs.getString(_themeModeKey);
    switch (themeModeName) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        // По умолчанию светлая тема
        return ThemeMode.light;
    }
  }

  Future<User?> getUser() async {
    await authNotifier.updateUser();
    final currentState = authNotifier.state;
    if (currentState is Authenticated) {
      return currentState.authResponse.user;
    } else {}
    return null;
  }

  Future<void> saveUserPhoto(String photoPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_photoStorageKey, photoPath);
  }

  Future<String?> getUserPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_photoStorageKey);
  }
}

final settingsServiceProvider = Provider<SettingsService>((ref) {
  final AuthNotifier authNotifier = ref.read(authNotifierProvider.notifier);
  return SettingsService(authNotifier: authNotifier);
});
