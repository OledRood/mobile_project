import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';

@freezed
sealed class SignUpStateStep1 with _$SignUpStateStep1 {
  const SignUpStateStep1._();

  const factory SignUpStateStep1({
    @Default(false) bool checkPolitics,

    String? emailError,
    String? passwordError,
    String? checkPoliticsError,
    String? confirmPasswordError,

    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,

    @Default(false) bool isLoading,
  }) = _SignUpStateStep1;

  bool get hasErrors =>
      emailError != null ||
      passwordError != null ||
      confirmPasswordError != null ||
      checkPoliticsError != null;
}

@freezed
sealed class SignUpStateStep2 with _$SignUpStateStep2 {
  const SignUpStateStep2._();

  const factory SignUpStateStep2({
    String? lastNameError,
    String? firstNameError,
    String? dateOfBirthError,

    @Default(false) bool isMen,

    @Default(false) bool isLoading,
  }) = _SignUpStateStep2;

  bool get hasErrors =>
      lastNameError != null ||
      firstNameError != null ||
      dateOfBirthError != null;
}

@freezed
sealed class SignUpStateStep3 with _$SignUpStateStep3 {
  const SignUpStateStep3._();

  const factory SignUpStateStep3({
    @Default(false) bool isLoading,
    File? driverLicenseFile,
    File? accountPhotoFile,
    File? passportFile,

    String? driverLicenseError,
    String? dateOfIssueError,
    String? driverLicenseFileError,
    String? passportFileError,
  }) = _SignUpStateStep3;

  bool get hasErrors =>
      driverLicenseError != null ||
      dateOfIssueError != null ||
      driverLicenseFile == null ||
      passportFile == null;
}
