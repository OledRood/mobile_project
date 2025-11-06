import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/models/user.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/features/settings/profile/models/profile_model.dart';
import 'package:mobile_study/features/settings/settings/domain/settings_view_model.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final AppNavigation appNavigation;
  final AuthService authService;
  final ScaffoldMessengerManager scaffoldMessenger;
  final SettingsViewModel settingsViewModel;

  ProfileViewModel({
    required this.appNavigation,
    required this.authService,
    required this.scaffoldMessenger,
    required this.settingsViewModel,
  }) : super(const ProfileState()) {
    setListOfProfileItems();
  }

  Future<void> onReplacePhotoTap(File? file) async {
    if (state.isLoading) return;
    if (file == null) {
      if (kDebugMode) {
        print("Фото не выбрано");
        scaffoldMessenger.showSnackBar("Фото не было изменено");
      }
      return;
    }
    state = state.copyWith(isLoading: true);
    final user = state.user?.copyWith(avatar: file.path);
    if (user == null) return;
    await authService.saveUser(user);
    state = state.copyWith(user: user, isLoading: false);
    settingsViewModel.updatePhoto();
    scaffoldMessenger.showSnackBar("Фото успешно обновлено");
  }

  String _genderFieldToString() {
    if (state.user?.isMan == null) {
      return "";
    } else if (state.user!.isMan == true) {
      return "Мужской";
    } else {
      return "Женский";
    }
  }

  Future<void> _getUserData() async {
    final user = await authService.getUser();
    state = state.copyWith(user: user);
    _buildProfileItems(state.user, state.googleEmail);

    //Запрос в сеть для получения данных пользователя для обновления данных
    _getUserDataFromNetwork();
  }

  Future<void> _getUserDataFromNetwork() async {
    //Заглушка для получения данных пользователя из сети;
    late User user;
    if (state.user == null) {
      user = User(
        email: "ivanov@mtuci.ru",
        id: "1",
        name: "Иван Иванов",
        avatar: null,
        isMan: true,
        createdAt: "Присоединился в июле 2024",
        googleEmail: "ivanov@gmail.com",
      );
    } else {
      user = state.user!;
    }

    state = state.copyWith(user: user);
    _buildProfileItems(state.user, state.googleEmail);
  }

  Future<void> setListOfProfileItems() async {
    if (state.user == null) {
      await _getUserData();
    }

    final items = _buildProfileItems(
      state.user ?? User(id: '', email: '', name: ''),
      state.googleEmail,
    );
    state = state.copyWith(profileItems: items);
  }

  List<ProfileListItem?> _buildProfileItems(User? user, String? googleEmail) {
    final email = user?.email ?? "";
    final gender = _genderFieldToString();

    return [
      ProfileListItem(
        title: 'Электронная почта',
        onTap: () {},
        subtitle: email,
      ),
      null,
      ProfileListItem(
        title: 'Пароль',
        onTap: () {
          // Переход на экран создания нового пароля — читаем email из актуального состояния
          final email = state.user?.email ?? user?.email ?? "";
          if (email.isEmpty) {
            scaffoldMessenger.showSnackBar("Ошибка с почтой");
            return;
          }
          appNavigation.changePassword();
        },
        subtitle: 'Поменять пароль',
      ),
      null,
      ProfileListItem(title: 'Пол', onTap: () {}, subtitle: gender),
      null,
      ProfileListItem(
        title: 'Google',
        onTap: () {},
        subtitle: googleEmail ?? "Добавить аккаунт",
      ),
      null,
    ];
  }
}
