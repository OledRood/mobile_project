import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/core/auth/models/registration_data_model.dart';
import 'package:mobile_study/core/services/api_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final AuthService _authService;

  AuthNotifier(this._authRepository, this._authService)
    : super(const AuthState.initial()) {
    checkAuthStatus();
  }

  Future<String?> get getAccessToken async {
    final token = await _authService.getAccessToken();
    return token;
  }

  Future<void> refreshToken() async {
    try {
      final newToken = await _authService.refreshToken();

      // null вернется, только если refresh токена физически нет в storage
      if (newToken == null) {
        state = const AuthState.unauthenticated();
        return;
      }

      state.mapOrNull(
        authenticated: (currentState) {
          state = AuthState.authenticated(
            currentState.authResponse.copyWith(token: newToken),
          );
        },
      );
    } on ApiException catch (e) {
      if (e.statusCode == 401) {
        state = const AuthState.unauthenticated();
      }
      debugPrint('RefreshToken failed: ${e.message}');
    } catch (e) {
      debugPrint('Unknown error in manual refresh: $e');
    }
  }

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();

    try {
      var token = await _authService.getAccessToken();

      if (token == null) {
        state = const AuthState.unauthenticated();
        return;
      }

      bool isValid = false;
      try {
        isValid = await _authRepository.validateToken();
      } catch (e) {}

      if (!isValid) {
        final newToken = await _authService.refreshToken();

        if (newToken == null) {
          state = const AuthState.unauthenticated();
          return;
        }
        token = newToken;
      }

      final user = await _authRepository.getCurrentUser();

      if (user != null) {
        state = AuthState.authenticated(
          AuthResponse(user: user, token: token!),
        );
      } else {
        state = const AuthState.unauthenticated();
      }
    } on ApiException catch (e) {
      if (e.statusCode == 401) {
        state = const AuthState.unauthenticated();
      } else if (e.statusCode == -1 || e.message.contains("No internet")) {
        state = AuthState.error(e);
      } else {
        state = AuthState.error(e);
      }
    } catch (e) {
      state = AuthState.error(ApiException(e.toString()));
    }
  }

  // Вход в систему
  Future<AuthState> login(String email, String password) async {
    state = const AuthState.loading();

    try {
      debugPrint('Logging in with email: $email');
      debugPrint('Logging in with password: $password');
      final result = await _authRepository.login(email, password);
      debugPrint('Login successful, updating state');
      state = AuthState.authenticated(result);
      return state;
    } on ApiException catch (e) {
      state = AuthState.error(e);
      return state;
    } catch (e) {
      state = AuthState.error(ApiException("Упссс ошибочка вышла: $e"));
      return state;
    }
  }

  // Регистрация
  Future<void> register(RegistrationDataModel data) async {
    state = const AuthState.loading();

    try {
      final result = await _authRepository.registerWithFullData(data);
      state = AuthState.authenticated(result);
    } catch (e) {
      state = AuthState.error(ApiException(e.toString()));
    }
  }

  // Выход из системы
  Future<void> logout() async {
    try {
      await _authRepository.logout();
    } finally {
      state = const AuthState.unauthenticated();
    }
  }

  // Сброс пароля
  Future<bool> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      return await _authRepository.resetPassword(
        email: email,
        newPassword: newPassword,
      );
    } catch (e) {
      debugPrint('Error in resetPassword: $e');
      return false;
    }
  }

  // Обновление данных пользователя
  Future<void> updateUser() async {
    state.maybeWhen(
      authenticated: (authResponse) async {
        try {
          final updatedUser = await _authRepository.getCurrentUser();
          if (updatedUser != null) {
            state = AuthState.authenticated(
              authResponse.copyWith(user: updatedUser),
            );
          }
        } catch (e) {
          // Не меняем состояние при ошибке обновления
        }
      },
      orElse: () {
        // Ничего не делаем, если пользователь не авторизован
      },
    );
  }

  Future signInWithGoogle() async {}
}

// Provider для AuthNotifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  final authRepository = ref.read(authRepositoryProvider);
  final authService = ref.read(authServiceProvider);
  return AuthNotifier(authRepository, authService);
});

// Convenience providers
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(
    authenticated: (authResponse) => authResponse.user,
    orElse: () => null,
  );
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.maybeWhen(authenticated: (_) => true, orElse: () => false);
});
