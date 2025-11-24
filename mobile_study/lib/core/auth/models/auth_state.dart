import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';
import 'package:mobile_study/core/services/api_service.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(AuthResponse authResponse) =
      Authenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(ApiException exception) = AuthError;
}
