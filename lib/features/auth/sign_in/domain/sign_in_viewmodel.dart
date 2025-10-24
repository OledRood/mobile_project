import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';

import '../../../../core/utils/validators.dart';
import '../models/sign_in_model.dart';

//Добавить ошибки авторизации через скаффолд меседж
class SignInViewModel extends StateNotifier<SignInState> {
  final AppNavigation appNavigation;
  final AuthRepository authRepository;

  SignInViewModel({required this.appNavigation, required this.authRepository})
    : super(SignInState());

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
      //Api проверка
      await Future.delayed(const Duration(seconds: 2));
      //Если ошибка вывести сообщение и в passwordError
      appNavigation.home();
      state = state.copyWith(isLoading: false);
    }
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
      final authResponse = await authRepository.signInWithGoogle();

      // Если вход успешен, переходим на главный экран
      debugPrint(
        '✅ Google вход успешен для пользователя: ${authResponse.user.name}',
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
    debugPrint("Email error: $errorMassage");
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
