import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_model.freezed.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState({
    @Default(false) bool isLoading,
    String? emailError,
    String? passwordError,
    @Default(false) bool isPasswordVisible,
  }) = _SignInState;
}
