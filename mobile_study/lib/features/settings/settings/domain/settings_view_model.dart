import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/services/settings_service.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/core/user/user_notifier.dart';
import 'package:mobile_study/features/settings/settings/models/settings_model.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';

class SettingsViewModel extends StateNotifier<SettingsState> {
  final Ref ref;
  final AppNavigation appNavigation;
  final ThemeNotifier themeNotifier;
  final SettingsService settingsService;
  final UserNotifier userNotifier;

  SettingsViewModel({
    required this.ref,
    required this.themeNotifier,
    required this.appNavigation,
    required this.settingsService,
    required this.userNotifier,
  }) : super(SettingsState()) {
    _init();
  }

  void _init() {
    final currentUser = ref.read(UserDi.userNotifierProvider);
    state = state.copyWith(user: currentUser);

    ref.listen<User?>(UserDi.userNotifierProvider, (previous, next) {
      state = state.copyWith(user: next);
    });
    if (currentUser == null) {
      userNotifier.loadUser(forceRefresh: false);
    }
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
    appNavigation.addCarBecomeHost();
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

  Future<void> setListOfSettingsItems() async {
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
}
