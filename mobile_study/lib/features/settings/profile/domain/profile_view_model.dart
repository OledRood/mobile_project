import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/user/user_notifier.dart';
import 'package:mobile_study/features/settings/profile/models/profile_model.dart';
import 'package:mobile_study/features/settings/settings/domain/settings_view_model.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final Ref ref;
  final AppNavigation appNavigation;
  final AuthNotifier authNotifier;
  final ScaffoldMessengerManager scaffoldMessenger;
  final UserNotifier userNotifier;

  ProfileViewModel({
    required this.ref,
    required this.appNavigation,
    required this.userNotifier,
    required this.scaffoldMessenger,
    required this.authNotifier,
  }) : super(const ProfileState()) {
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
    try {
      await userNotifier.updateUserProfile(user, avatar: file);
      scaffoldMessenger.showSnackBar("Фото успешно обновлено");
    } catch (e) {
      debugPrint('Error updating user profile: ${e.toString()}');
      scaffoldMessenger.showSnackBar("Ошибка при обновлении фото");
      state = state.copyWith(isLoading: false);
      return;
    }
  }

  String _genderFieldToString() {
    if (state.user?.isMale == null) {
      return "";
    } else if (state.user!.isMale == true) {
      return "Мужской";
    } else {
      return "Женский";
    }
  }

  Future<void> setListOfProfileItems() async {
    final items = _buildProfileItems(
      state.user ?? User(id: '', email: '', firstName: '', lastName: ''),
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
      // null,
      // ProfileListItem(
      //   title: 'Google',
      //   onTap: () {},
      //   subtitle: googleEmail ?? "Добавить аккаунт",
      // ),
      null,
    ];
  }

  Future<void> signOut() async {
    await authNotifier.logout();
    await userNotifier.clearUser();
    appNavigation.registration();
  }
}
