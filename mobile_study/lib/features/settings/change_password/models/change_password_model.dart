import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model.freezed.dart';

@freezed
sealed class ChangePasswordState with _$ChangePasswordState {
  const ChangePasswordState._();

  const factory ChangePasswordState({
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,

    @Default(false) bool isLoading,
  }) = _CreateNewPasswordState;

  bool get hasErrors =>
      emailError != null ||
      passwordError != null ||
      confirmPasswordError != null;
}
