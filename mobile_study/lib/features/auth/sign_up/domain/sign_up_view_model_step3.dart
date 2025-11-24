import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/utils/validators.dart';
import 'package:mobile_study/features/auth/sign_up/models/sign_up_model.dart';
import 'package:mobile_study/core/auth/models/registration_data_model.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';

class SignUpViewModelStep3 extends StateNotifier<SignUpStateStep3> {
  final AppNavigation appNavigation;
  final StateController<RegistrationDataModel?> authDataNotifier;
  final AuthNotifier authNotifier;
  final ScaffoldMessengerManager scaffoldMessengerManager;

  SignUpViewModelStep3({
    required this.appNavigation,
    required this.authDataNotifier,
    required this.authNotifier,
    required this.scaffoldMessengerManager,
  }) : super(SignUpStateStep3());

  final TextEditingController driverLicenseController = TextEditingController();
  final FocusNode driverLicenseFocusNode = FocusNode();

  final TextEditingController dateOfIssueController = TextEditingController();
  final FocusNode dateOfIssueFocusNode = FocusNode();

  void onDriverLicenseSubmit() {
    if (state.isLoading) return;
    dateOfIssueFocusNode.requestFocus();
    checkDriverLicense();
  }

  void checkDriverLicense() {
    if (driverLicenseController.text.length == 0) {
      state = state.copyWith(
        driverLicenseError: "Поле обязательно для заполнения",
      );
      return;
    } else if (driverLicenseController.text.length < 10) {
      state = state.copyWith(driverLicenseError: "Неверный формат");
      return;
    } else {
      state = state.copyWith(driverLicenseError: null);
    }
  }

  void resetDriverLicense() {
    if (state.isLoading) return;
    state = state.copyWith(driverLicenseError: null);
    if (driverLicenseController.text.length == 10) {
      onDriverLicenseSubmit();
      dateOfIssueFocusNode.requestFocus();
    }

    state = state.copyWith(driverLicenseError: null);
  }

  void addAccountPhoto(final File photoFile) {
    if (state.isLoading) return;
    driverLicenseFocusNode.unfocus();
    dateOfIssueFocusNode.unfocus();
    state = state.copyWith(accountPhotoFile: photoFile);
  }

  void onDateOfIssueSubmit() {
    if (state.isLoading) return;
    dateOfIssueFocusNode.unfocus();
    checkDateOfIssue();
  }

  DateTime? _parseDateString(String? dateStr) {
    print("Это дата строка: $dateStr");
    if (dateStr == null || dateStr.isEmpty) return null;

    try {
      final parts = dateStr.split('/');
      if (parts.length != 3) return null;

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }

  void checkDateOfIssue() {
    final birthDateStr = authDataNotifier.state?.birthDate;
    final birthDate = _parseDateString(birthDateStr);
    print('Это дата рождения, после парса: $birthDate');
    if (birthDate == null) {
      state = state.copyWith(
        dateOfIssueError: "Сначала заполните дату рождения корректно",
      );
      return;
    }

    final error = Validators.validateIssuedDate(
      dateOfIssueController.text,
      birthDate,
    );
    state = state.copyWith(dateOfIssueError: error);
  }

  void resetDateOfIssue() {
    if (state.isLoading) return;
    if (dateOfIssueController.text.length == 10) {
      onDateOfIssueSubmit();
      dateOfIssueFocusNode.unfocus();
    }
    state = state.copyWith(dateOfIssueError: null);
  }

  checkDriverLicenseFile() {
    if (state.driverLicenseFile == null) {
      state = state.copyWith(
        driverLicenseFileError: "Загрузите фото водительского удостоверения",
      );
    } else {
      state = state.copyWith(driverLicenseFileError: null);
    }
  }

  checkPassportFile() {
    if (state.passportFile == null) {
      state = state.copyWith(passportFileError: "Загрузите фото паспорта");
    } else {
      state = state.copyWith(passportFileError: null);
    }
  }

  Future<void> goFromStep3() async {
    dateOfIssueFocusNode.unfocus();
    if (state.isLoading) return;
    checkDriverLicense();
    checkDateOfIssue();
    checkDriverLicenseFile();
    checkPassportFile();
    if (state.hasErrors) return;
    state = state.copyWith(isLoading: true);

    final currentData = authDataNotifier.state;
    authDataNotifier.state = currentData?.copyWith(
      driverLicense: driverLicenseController.text,
      dateOfIssue: dateOfIssueController.text,
      driverLicenseFile: state.driverLicenseFile,
      passportFile: state.passportFile,
      accountPhotoFile: state.accountPhotoFile,
    );

    try {
      final data = authDataNotifier.state;
      if (data != null) {
        await authNotifier.register(data);

        await Future.delayed(const Duration(milliseconds: 100));

        authNotifier.state.maybeMap(
          authenticated: (authenticatedState) {
            state = state.copyWith(isLoading: false);
            appNavigation.signUpFinal();
          },
          error: (errorState) {
            scaffoldMessengerManager.showSnackBar(errorState.exception.message);
            state = state.copyWith(isLoading: false);
          },
          orElse: () {
            // Другие состояния
            state = state.copyWith(isLoading: false);
          },
        );
      } else {
        state = state.copyWith(isLoading: false);
        debugPrint('❌ Нет данных для регистрации');
        scaffoldMessengerManager.showSnackBar('Нет данных для регистрации');
      }
    } catch (e) {
      debugPrint('❌ Исключение при регистрации: $e');
      scaffoldMessengerManager.showSnackBar('Ошибка регистрации: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  void addDriverLicensePhoto(File file) {
    dateOfIssueFocusNode.unfocus();
    if (state.isLoading) return;
    state = state.copyWith(
      driverLicenseFile: file,
      driverLicenseFileError: null,
    );
  }

  void addPassportPhoto(File file) {
    dateOfIssueFocusNode.unfocus();
    if (state.isLoading) return;
    state = state.copyWith(passportFile: file, passportFileError: null);
  }

  @override
  void dispose() {
    dateOfIssueFocusNode.dispose();
    driverLicenseController.dispose();
    driverLicenseFocusNode.dispose();
    dateOfIssueController.dispose();
    dateOfIssueFocusNode.dispose();
    super.dispose();
  }

  void goBack() {
    appNavigation.goBack();
  }
}
