import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/services/settings_service.dart';
import 'package:mobile_study/features/settings/models/settings_model.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';

class SettingsViewModel extends StateNotifier<SettingsState> {
  final AppNavigation appNavigation;
  final AuthService authService;
  final ThemeNotifier themeNotifier;

  SettingsViewModel({
    required this.themeNotifier,
    required this.appNavigation,
    required this.authService,
  }) : super(SettingsState()) {
    // Используем начальное состояние из themeNotifier
    setListOfSettingsItems(themeNotifier.state);
  }

  void onMyBookingsTap() {
    appNavigation.history();
  }

  void onNotificationTap() {
    debugPrint("Notification Tapped");
  }

  Future<void> onThemeModeTap() async {
    debugPrint('Theme Mode Tapped');
    final currentMode = themeNotifier.state;
    final newMode = currentMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await themeNotifier.setThemeMode(newMode);
    setListOfSettingsItems(newMode);
  }

  void onConnectCarTap() {
    debugPrint("Connect Car Tapped");
  }

  void onHelpTap() {
    debugPrint("Help Tapped");
  }

  void onFriendInviteTap() {
    debugPrint("Friend Invite Tapped");
  }

  Future<void> onProfileTap() async {
    appNavigation.profile();
  }

  void setListOfSettingsItems(ThemeMode themeMode) {
    final isDarkMode = themeMode == ThemeMode.dark;
    final items = [
      SettingListItem(
        title: 'Мои бронирования',
        iconPath: AppIcons.taxiAndPhone,
        isSvg: false,
        onTap: () {
          onMyBookingsTap();
        },
      ),

      SettingListItem(
        title: 'Тема',
        iconPath: isDarkMode ? AppIcons.darkMode : AppIcons.lightMode,
        onTap: () {
          onThemeModeTap();
        },
      ),
      SettingListItem(
        title: 'Уведомления',
        iconPath: AppIcons.notifications,
        onTap: () {
          onNotificationTap();
        },
      ),
      SettingListItem(
        title: 'Подключите свой автомобиль',
        iconPath: AppIcons.banknotes,
        isSvg: false,
        onTap: () {
          onConnectCarTap();
        },
      ),
      null,
      SettingListItem(
        title: 'Помощь',
        iconPath: AppIcons.helpCircle,
        onTap: () {
          onHelpTap();
        },
      ),
      SettingListItem(
        title: "Пригласить друга",
        iconPath: AppIcons.mail,
        onTap: () {
          onFriendInviteTap();
        },
      ),
    ];
    state = state.copyWith(settingsItems: items);
  }
}
