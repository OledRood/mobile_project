import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/features/profile/models/profile_model.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final AppNavigation appNavigation;
  final AuthService authService;

  ProfileViewModel({required this.appNavigation, required this.authService})
    : super(const ProfileState()) {
    setListOfProfileItems();
  }

  String _genderFieldToString() {
    if (state.isMan == null) {
      return "";
    } else if (state.isMan == true) {
      return "Мужской";
    } else {
      return "Женский";
    }
  }

  Future<void> _getUserData() async {
    await Future.delayed(const Duration(seconds: 1));

    state = state.copyWith(
      userName: "Иван Иванов",
      userEmail: "pochta@mail.com",
      dateOfCreation: "Присоединился в июле 2024",
      isMan: true,
    );
  }

  Future<void> setListOfProfileItems() async {
    await _getUserData();

    final items = [
      ProfileListItem(
        title: 'Электронная почта',
        onTap: () {},
        subtitle: state.userEmail ?? "",
      ),
      null,
      ProfileListItem(
        title: 'Пароль',
        onTap: () {},
        subtitle: 'Поменять пароль',
      ),
      null,
      ProfileListItem(
        title: 'Пол',
        onTap: () {},
        subtitle: _genderFieldToString(),
      ),
      null,
      ProfileListItem(
        title: 'Google',
        onTap: () {},
        subtitle: state.googleEmail ?? "Добавить аккаунт",
      ),
      null,
    ];
    state = state.copyWith(profileItems: items);
  }
}
