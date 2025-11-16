import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/utils/validators.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/model/forgot_password_model.dart';

class ForgotPasswordViewModel extends StateNotifier<ForgotPasswordState> {
  final AppNavigation appNavigation;
  final AuthNotifier authNotifier;
  final ScaffoldMessengerManager scaffoldMessengerManager;

  ForgotPasswordViewModel({
    required this.appNavigation,
    required this.authNotifier,
    required this.scaffoldMessengerManager,
  }) : super(ForgotPasswordState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final FocusNode codeFocusNode = FocusNode();

  void goBack() {
    appNavigation.goBack();
  }

  Future<void> loading() async {
    state = state.copyWith(timer: "120");
    while (state.timer != null) {
      await Future.delayed(Duration(seconds: 1));
      final int timer = int.parse(state.timer!);
      if (timer <= 1) {
        state = state.copyWith(timer: null);
        return;
      }
      state = state.copyWith(timer: (timer - 1).toString());
    }
  }

  String getTime() {
    if (state.timer == null) return "";
    final int timer = int.parse(state.timer!);

    final int minutes = timer ~/ 60;
    final int seconds = timer % 60;

    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  void onEmailSubmit() {
    checkEmail();
    sendCode();
  }

  void resendCode() {
    if (state.isLoading) return;
    sendCode();
  }

  void checkEmail() {
    if (state.isLoading) return;

    final errorMassage = Validators.validateEmail(emailController.text);
    debugPrint("Email error: $errorMassage");
    state = state.copyWith(emailError: errorMassage);
  }

  void resetEmailError() {
    if (state.emailError != null) {
      state = state.copyWith(emailError: null);
    }
  }

  Future<void> sendCode() async {
    if (state.isLoading) return;
    checkEmail();
    if (state.emailError != null) return;

    state = state.copyWith(isLoading: true);

    // Имитация отправки кода
    await Future.delayed(const Duration(seconds: 2));
    // AuthRepository.sendPasswordResetCode(emailController.text).then((value) {});

    state = state.copyWith(isLoading: false);

    if (state.timer == null) {
      loading();

      codeFocusNode.requestFocus();
    } else {
      if (codeController.text == "1234") {
        goToCreateNewPassword();
      } else {
        scaffoldMessengerManager.showSnackBar(
          'Неверный код подтверждения. Проверьте код и попробуйте снова.',
        );
      }
    }
  }

  void goToCreateNewPassword() {
    appNavigation.goCreateNewPassword(
      CreateNewPasswordParams(email: emailController.text),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    codeFocusNode.dispose();

    super.dispose();
  }
}
