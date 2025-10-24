import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_new_password_model.freezed.dart';

@freezed
sealed class CreateNewPasswordState with _$CreateNewPasswordState {
  const CreateNewPasswordState._();

  const factory CreateNewPasswordState({
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
