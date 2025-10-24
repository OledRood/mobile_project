import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/features/auth/sign_up/models/sign_up_model.dart';
import 'package:mobile_study/core/auth/models/auth_data_model.dart';

import '../../../../core/utils/validators.dart';

class SignUpViewModelStep1 extends StateNotifier<SignUpStateStep1> {
  final AppNavigation appNavigation;
  final StateController<AuthDataModel?> authDataNotifier;

  SignUpViewModelStep1({
    required this.appNavigation,
    required this.authDataNotifier,
  }) : super(SignUpStateStep1());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  void onEmailSubmit() {
    passwordFocusNode.requestFocus();
    checkEmail();
  }

  void resetEmail() {
    state = state.copyWith(emailError: null);
  }

  void checkEmail() {
    final errorMassage = Validators.validateEmail(emailController.text);
    debugPrint("Email error: $errorMassage");
    state = state.copyWith(emailError: errorMassage);
  }

  void onPasswordSubmit() {
    checkPassword();
    confirmPasswordFocusNode.requestFocus();
  }

  void resetPassword() {
    state = state.copyWith(passwordError: null);
  }

  void checkPassword() {
    final errorMessage = Validators.validatePassword(passwordController.text);
    debugPrint("Password error: $errorMessage");
    state = state.copyWith(passwordError: errorMessage);
  }

  void changePasswordVisibility() {
    final current = state.isPasswordVisible;
    state = state.copyWith(isPasswordVisible: !current);
  }

  void onConfirmPasswordSubmit() {
    checkConfirmPassword();
    goFromStep1();
  }

  void resetConfirmPassword() {
    if (state.isLoading) return;
    state = state.copyWith(confirmPasswordError: null);
  }

  void checkConfirmPassword() {
    final errorMessage = Validators.validateConfirmPassword(
      passwordController.text,
      confirmPasswordController.text,
    );
    debugPrint("Confirm Password error: $errorMessage");
    state = state.copyWith(confirmPasswordError: errorMessage);
  }

  void changeConfirmPasswordVisible() {
    if (state.isLoading) return;
    final current = state.isConfirmPasswordVisible;
    state = state.copyWith(isConfirmPasswordVisible: !current);
  }

  void updateCheckPolitics(bool newValue) {
    if (state.isLoading) return;
    state = state.copyWith(checkPolitics: newValue);
    state = state.copyWith(checkPoliticsError: null);
  }

  void checkPolitics() {
    if (!state.checkPolitics) {
      state = state.copyWith(
        checkPoliticsError: "Необходимо принять соглашение",
      );
    }
  }

  Future<void> goFromStep1() async {
    checkEmail();
    checkPassword();
    checkConfirmPassword();
    checkPolitics();
    if (state.isLoading) return;
    if (!state.hasErrors) {
      state = state.copyWith(isLoading: true);

      final currentData = authDataNotifier.state;
      authDataNotifier.state =
          currentData?.copyWith(
            email: emailController.text,
            password: passwordController.text,
          ) ??
          AuthDataModel(
            email: emailController.text,
            password: passwordController.text,
          );

      appNavigation.signUpSecond();
      state = state.copyWith(isLoading: false);
    }
  }

  void goBack() {
    appNavigation.goBack();
  }

  /// Обрабатывает нажатие кнопки "Назад" с подтверждением
  /// 
  /// Вызывается из UI после показа диалога подтверждения
  void confirmAndExit() {
    // Очищаем все данные регистрации
    authDataNotifier.state = null;

    // Очищаем поля ввода
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();

    // Сбрасываем состояние
    state = SignUpStateStep1();

    // Переходим на экран выбора типа регистрации
    appNavigation.registration();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  void skip() {
    appNavigation.signUpSecond();
  }
}
