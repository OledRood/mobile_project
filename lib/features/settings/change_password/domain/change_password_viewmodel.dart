import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/utils/validators.dart';
import 'package:mobile_study/features/settings/change_password/models/change_password_model.dart';

class ChangePasswordViewModel extends StateNotifier<ChangePasswordState> {
  final AppNavigation appNavigation;
  final AuthNotifier authNotifier;
  final ScaffoldMessengerManager scaffoldMessengerManager;

  ChangePasswordViewModel({
    required this.appNavigation,
    required this.authNotifier,
    required this.scaffoldMessengerManager,
  }) : super(ChangePasswordState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  // void init(String email) {
  //   emailController.text = email;
  // }

  // void onEmailSubmit() {
  //   passwordFocusNode.requestFocus();
  //   checkEmail();
  // }

  // void resetEmail() {
  //   state = state.copyWith(emailError: null);
  // }

  // void checkEmail() {
  //   final errorMessage = Validators.validateEmail(emailController.text);
  //   debugPrint("Email error: $errorMessage");
  //   state = state.copyWith(emailError: errorMessage);
  // }

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
    submitNewPassword();
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

  Future<void> submitNewPassword() async {
    checkPassword();
    checkConfirmPassword();

    if (state.isLoading) return;
    if (state.hasErrors) return;

    state = state.copyWith(isLoading: true);

    try {
      // final success = await authNotifier.resetPassword(
      //   email: emailController.text,
      //   newPassword: passwordController.text,
      // );
      final success = true;
      if (success) {
        scaffoldMessengerManager.showSnackBar('Пароль успешно изменен!');
        appNavigation.goBack();
      } else {
        scaffoldMessengerManager.showSnackBar(
          'Не удалось сменить пароль. Попробуйте снова.',
        );
        state = state.copyWith(
          passwordError: "Не удалось сменить пароль. Попробуйте снова.",
        );
      }
    } catch (e) {
      debugPrint("Error resetting password: $e");
      scaffoldMessengerManager.showSnackBar(
        'Произошла ошибка. Попробуйте позже.',
      );
      state = state.copyWith(
        passwordError: "Произошла ошибка. Попробуйте позже.",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
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
}
