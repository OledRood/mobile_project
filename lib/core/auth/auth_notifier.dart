import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/auth/models/user.dart';
import 'package:mobile_study/core/auth/models/auth_data_model.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final AuthService _authService;

  AuthNotifier(this._authRepository, this._authService)
    : super(const AuthState.initial()) {
    checkAuthStatus();
  }

  // Проверка статуса аутентификации при запуске
  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();
    debugPrint('Checking auth status...');
    try {
      final token = _authService.getToken();
      if (token == null) {
        state = const AuthState.unauthenticated();
        return;
      }
      debugPrint('Проверяем действительность токена');

      // Проверяем действительность токена
      final isValid = await _authRepository.validateToken();
      if (!isValid) {
        // Пытаемся обновить токен
        debugPrint('Пытаемся обновить токен');
        final newToken = await _authService.refreshToken();
        if (newToken == null) {
          debugPrint('Не удалось обновить токен, выходим');
          state = const AuthState.unauthenticated();
          return;
        }
      }
      debugPrint('получаем данные пользователя');

      // Получаем данные пользователя
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        state = AuthState.authenticated(user, token as String);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  // Вход в систему
  Future<void> login(String email, String password) async {
    state = const AuthState.loading();

    try {
      final result = await _authRepository.login(email, password);
      state = AuthState.authenticated(result.user, result.token);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  // Регистрация
  Future<void> register(AuthDataModel data) async {
    state = const AuthState.loading();

    try {
      final result = await _authRepository.registerWithFullData(data);
      state = AuthState.authenticated(result.user, result.token);
    } catch (e) {
      state = AuthState.error(e.toString());
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
      authenticated: (user, token) async {
        try {
          final updatedUser = await _authRepository.getCurrentUser();
          if (updatedUser != null) {
            state = AuthState.authenticated(updatedUser, token);
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
}

// Provider для AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final authService = ref.read(authServiceProvider);
  return AuthNotifier(authRepository, authService);
});

// Convenience providers
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.maybeWhen(
    authenticated: (user, _) => user,
    orElse: () => null,
  );
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.maybeWhen(
    authenticated: (_, __) => true,
    orElse: () => false,
  );
});
