import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_model.freezed.dart';

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(false) bool isLoading,
    String? emailError,
    String? timer,
  }) = _ForgotPasswordState;
}
