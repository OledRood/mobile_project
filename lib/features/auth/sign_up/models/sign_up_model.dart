import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';

@freezed
sealed class SignUpStateStep1 with _$SignUpStateStep1 {
  const SignUpStateStep1._();

  const factory SignUpStateStep1({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isPasswordVisible,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? checkPoliticsError,

    @Default('') String confirmPassword,
    @Default(false) bool isConfirmPasswordVisible,
    @Default(false) bool checkPolitics,
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
    @Default('') String lastName,
    String? lastNameError,
    @Default('') String firstName,
    String? firstNameError,
    @Default('') String middleName,
    @Default("") String dateOfBirth,
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
    String? userPhotoPath,
    @Default('') String driverLicense,
    @Default('') String dateOfIssue,
    @Default(false) bool isUploadDriverLicense,
    @Default(false) bool isUploadPassport,
    @Default(false) bool isLoading,
    File? driverLicenseFile,
    File? accountPhotoFile,
    File? passportFile,
    String? driverLicenseError,
    String? driverLicenseFileeEror,

    String? dateOfIssueError,
    String? passportFileError,
  }) = _SignUpStateStep3;

  bool get hasErrors =>
      driverLicenseError != null ||
      dateOfIssueError != null ||
      driverLicenseFile == null ||
      passportFile == null;
}
