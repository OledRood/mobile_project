import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/models/user.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/features/settings/settings/models/settings_model.dart';
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
    setListOfSettingsItems();
  }

  void onMyBookingsTap() {
    appNavigation.history();
  }

  void onNotificationTap() {
    appNavigation.notification();
  }

  Future<void> onThemeModeTap() async {
    debugPrint('Theme Mode Tapped');
    final currentMode = themeNotifier.state;
    final newMode = currentMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await themeNotifier.setThemeMode(newMode);

    setListOfSettingsItems();
  }

  void onAddCarTap() {
    appNavigation.addCar();
  }

  void onHelpTap() {
    appNavigation.help();
  }

  void onFriendInviteTap() {
    appNavigation.inviteFriend();
  }

  Future<void> onProfileTap() async {
    appNavigation.profile();
  }

  Future<void> _getUserData() async {
    final user = await authService.getUser();
    state = state.copyWith(user: user);
    if (user == null) {
      state = state.copyWith(
        user: User(
          id: '1435',
          email: 'sadf@mail.com',
          name: 'Евегений Викторович',
        ),
      );
      authService.saveUser(state.user!);
    }
  }

  Future<void> setListOfSettingsItems() async {
    if (state.user == null) {
      await _getUserData();
    }
    final themeMode = themeNotifier.state;
    final items = _buildProfileItems(themeMode);
    state = state.copyWith(settingsItems: items);
  }

  List<SettingListItem?> _buildProfileItems(ThemeMode themeMode) {
    final isDarkMode = themeMode == ThemeMode.dark;
    final items = [
      SettingListItem(
        title: 'Мои бронирования',
        icon: AppIcons.taxiAndPhone,
        onTap: () {
          onMyBookingsTap();
        },
      ),

      SettingListItem(
        title: 'Тема',
        icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
        onTap: () {
          onThemeModeTap();
        },
      ),
      SettingListItem(
        title: 'Уведомления',
        icon: AppIcons.notifications,
        onTap: () {
          onNotificationTap();
        },
      ),
      SettingListItem(
        title: 'Подключите свой автомобиль',
        icon: AppIcons.banknotes,
        onTap: () {
          onAddCarTap();
        },
      ),
      null,
      SettingListItem(
        title: 'Помощь',
        icon: Icons.help_outline,
        onTap: () {
          onHelpTap();
        },
      ),
      SettingListItem(
        title: "Пригласить друга",
        icon: Icons.mail_outline,
        onTap: () {
          onFriendInviteTap();
        },
      ),
    ];
    return items;
  }

  Future<void> updatePhoto() async {
    await _getUserData();
    _buildProfileItems(themeNotifier.state);
  }
}
