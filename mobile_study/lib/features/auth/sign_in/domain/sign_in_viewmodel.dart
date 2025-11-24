import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';
import 'package:mobile_study/core/services/api_service.dart';

import '../../../../core/utils/validators.dart';
import '../models/sign_in_model.dart';

//Добавить ошибки авторизации через скаффолд меседж
class SignInViewModel extends StateNotifier<SignInState> {
  final AppNavigation appNavigation;
  final AuthNotifier authNotifier;
  final ScaffoldMessengerManager scaffoldMessengerManager;

  SignInViewModel({
    required this.appNavigation,
    required this.scaffoldMessengerManager,
    required this.authNotifier,
  }) : super(SignInState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();

  void onEmailSubmit() {
    passwordFocusNode.requestFocus();
    checkEmail();
  }

  void resetEmail() {
    state = state.copyWith(emailError: null);
  }

  void resetPassword() {
    state = state.copyWith(passwordError: null);
  }

  void onPasswordSubmit() {
    checkPassword();
    tryGoHome();
  }

  Future<void> tryGoHome() async {
    if (state.isLoading) return;
    checkPassword();

    checkEmail();
    if (state.emailError == null && state.passwordError == null) {
      state = state.copyWith(isLoading: true);

      final isGo = await requestUser();
      if (isGo) {
        appNavigation.home();
        state = state.copyWith(isLoading: false);
        return;
      }
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> requestUser() async {
    final authState = await authNotifier.login(
      emailController.text,
      passwordController.text,
    );

    debugPrint(
      '$authState is the authenticates ?= ${authState == Authenticated}',
    );

    if (authState is Authenticated) {
      return true;
    } else if (authState is AuthError) {
      if (authState.exception.statusCode == 401) {
        scaffoldMessengerManager.showSnackBar('Неверный логин или пароль');
        return false;
      }
      scaffoldMessengerManager.showSnackBar(
        "Ошибка авторизации: ${authState.exception.message}",
      );
    } else {
      debugPrint('Неизвестный статус авторизации: ${authState}');
      scaffoldMessengerManager.showSnackBar('Неизвестная ошибка авторизации');
    }

    return false;
  }

  /// Вход через Google OAuth
  ///
  /// Этот метод:
  /// 1. Вызывает AuthRepository для входа через Google
  /// 2. Обрабатывает успешный вход (переход на главный экран)
  /// 3. Обрабатывает ошибки (показывает сообщение пользователю)
  Future<void> googleSignIn() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    try {
      // Вызываем метод входа через Google из репозитория
      final authResponse = await authNotifier.signInWithGoogle();

      // Если вход успешен, переходим на главный экран
      debugPrint(
        '✅ Google вход успешен для пользователя: ${authResponse.user?.name ?? 'Unknown User'}',
      );
      appNavigation.home();
    } catch (e) {
      // Обрабатываем ошибку
      debugPrint('❌ Ошибка входа через Google: $e');

      // TODO: Показать ошибку пользователю через SnackBar или диалог
      // Например:
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Не удалось войти через Google')),
      // );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void onPressGoToSignUp() {
    if (state.isLoading) return;
    appNavigation.signUp();
  }

  void checkEmail() {
    final errorMassage = Validators.validateEmail(emailController.text);
    state = state.copyWith(emailError: errorMassage);
  }

  void changePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void checkPassword() {
    // final errorMessage = Validators.validatePassword(passwordController.text);
    // debugPrint("Password error: $errorMessage");
    // state = state.copyWith(passwordError: errorMessage);
  }

  dispose() {
    super.dispose();
    emailController.dispose();
    emailController.dispose();
  }
}
