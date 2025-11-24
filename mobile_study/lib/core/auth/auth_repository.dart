import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/core/constants/app_endpoints.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/auth/models/registration_data_model.dart';
import 'package:mobile_study/core/auth/google_auth_service.dart';

class AuthRepository {
  final ApiService _apiService;
  final AuthService _authService;
  final GoogleAuthService _googleAuthService;

  AuthRepository(this._apiService, this._authService, this._googleAuthService);

  Future<AuthResponse> login(String email, String password) async {
    final response = await _apiService.post(AppEndpoints.authLogin, {
      'email': email,
      'password': password,
    }, withAuth: false);

    final token = response['access_token'];
    final refreshToken = response['refresh_token'];

    if (token == null || refreshToken == null) {
      throw ApiException('Login failed: missing tokens');
    }

    // Сохраняем данные
    await _authService.saveToken(token);
    await _authService.saveRefreshToken(refreshToken);
    // await _authService.saveUser(user);

    return AuthResponse(user: null, token: token);
  }

  Future<AuthResponse> registerWithFullData(RegistrationDataModel data) async {
    try {
      final files = {
        'driverLicensePhoto': data.driverLicenseFile,
        'passportPhoto': data.passportFile,
        'avatar': data.accountPhotoFile,
      };

      final response = await _apiService.postMultipart(
        '/auth/register',
        data.toJson(),
        files,
      );

      //// ЗАГЛУШКА для тестирования
      // await Future.delayed(const Duration(seconds: 1));
      //
      //// Временные данные для заглушки
      // final Map<String, dynamic> response = {
      //   'user': {
      //     'id': '123',
      //     'email': data.email,
      //     'name': '${data.firstName} ${data.lastName}',
      //   },
      //   'access_token': 'fake_token_123',
      //   'refresh_token': 'fake_refresh_token_123',
      // };

      debugPrint('Registration response: $response');

      if (response['access_token'] == null) {
        throw ApiException('Registration failed: access token is missing');
      }
      if (response['refresh_token'] == null) {
        throw ApiException('Registration failed: refresh token is missing');
      }

      final token = response['access_token'] as String;
      final refreshToken = response['refresh_token'] as String;

      await _authService.saveToken(token);
      await _authService.saveRefreshToken(refreshToken);

      return AuthResponse(
        user: User.fromAuthRegistrationModel(data),
        token: token,
      );
    } catch (e) {
      debugPrint('Registration error: $e');
      throw ApiException('Registration failed: $e');
    }
  }

  // Выход из системы
  Future<void> logout() async {
    await _authService.clearAuthData();
  }

  /// Вход через Google OAuth
  ///
  /// Процесс:
  /// 1. Открывается окно выбора Google аккаунта
  /// 2. Получаем ID token от Google
  /// 3. Отправляем ID token на ваш backend для верификации
  /// 4. Backend проверяет токен и возвращает свой access token
  /// 5. Сохраняем данные пользователя и токены
  Future<AuthResponse> signInWithGoogle() async {
    try {
      // Шаг 1: Выполняем вход через Google
      final googleAccount = await _googleAuthService.signInWithGoogle();

      if (googleAccount == null) {
        throw Exception('Вход через Google был отменен');
      }

      // Шаг 2: Получаем ID token для отправки на backend
      final idToken = await _googleAuthService.getIdToken();

      if (idToken == null) {
        throw Exception('Не удалось получить ID token от Google');
      }

      debugPrint('🔑 ID Token получен от Google');

      // Шаг 3: Отправляем ID token на ваш backend
      // Backend должен:
      // 1. Проверить токен через Google API
      // 2. Создать или найти пользователя в базе данных
      // 3. Вернуть свой access token и данные пользователя

      // TODO: Раскомментируйте когда backend будет готов
      // final response = await _apiService.post('/auth/google', {
      //   'idToken': idToken,
      // });

      // ВРЕМЕННАЯ ЗАГЛУШКА для тестирования
      debugPrint('✅ Вход через Google успешен!');
      debugPrint('Email: ${googleAccount.email}');
      debugPrint('Name: ${googleAccount.displayName}');
      debugPrint('Photo: ${googleAccount.photoUrl}');

      await Future.delayed(const Duration(seconds: 1));

      // Имитация ответа от backend
      final Map<String, dynamic> response = {
        'user': {
          'id': googleAccount.id,
          'email': googleAccount.email,
          'name': googleAccount.displayName ?? 'Google User',
        },
        'access_token': 'google_fake_token_${googleAccount.id}',
        'refresh_token': 'google_fake_refresh_token_${googleAccount.id}',
      };

      // Шаг 4: Обрабатываем ответ от backend
      final user = User.fromJson(response['user'] as Map<String, dynamic>);
      final token = response['access_token'] as String;
      final refreshToken = response['refresh_token'] as String;

      // Шаг 5: Сохраняем данные локально
      await _authService.saveToken(token);
      await _authService.saveRefreshToken(refreshToken);
      await _authService.saveUser(user);

      return AuthResponse(user: user, token: token);
    } catch (e) {
      debugPrint('❌ Ошибка входа через Google: $e');
      // В случае ошибки пытаемся выйти из Google аккаунта
      await _googleAuthService.signOut();
      throw Exception('Не удалось войти через Google: $e');
    }
  }

  // Получение текущего пользователя
  Future<User?> getCurrentUser() async {
    try {
      final token = await _authService.getAccessToken();
      debugPrint('getCurrentUser: token = ${token?.substring(0, 20)}...');
      if (token == null) {
        debugPrint('getCurrentUser: token is null');
        return null;
      }

      debugPrint('getCurrentUser: calling API ${AppEndpoints.usersMe}');
      final response = await _apiService.get(AppEndpoints.usersMe);
      debugPrint('getCurrentUser: response received: $response');
      final user = User.fromJson(response);

      await _authService.saveUser(user);
      debugPrint('getCurrentUser: user saved successfully');
      return user;
    } catch (e) {
      debugPrint('getCurrentUser ERROR: $e');
      return null;
    }
  }

  // Проверка действительности токена
  Future<bool> validateToken() async {
    debugPrint('Проверка на vlidateToken');
    try {
      final token = await _authService.getAccessToken();
      if (token == null) return false;
      await _apiService.get(AppEndpoints.authValidate);
      return true;
    } catch (e) {
      debugPrint('validate token ответил false');
      return false;
    }
  }

  // Сброс пароля (установка нового пароля)
  Future<bool> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      // Пока используем заглушку с положительным результатом
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Реальная логика отправки на сервер
      // final response = await _apiService.post('/auth/reset-password', {
      //   'email': email,
      //   'newPassword': newPassword,
      // });

      debugPrint('Password reset successful for email: $email');
      return true;
    } catch (e) {
      debugPrint('Error resetting password: $e');
      return false;
    }
  }
}

// Provider для GoogleAuthService
final googleAuthServiceProvider = Provider<GoogleAuthService>((ref) {
  return GoogleAuthService();
});

// Provider для AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiService = ref.read(ApiServiceDi.apiServiceProvider);
  final authService = ref.read(authServiceProvider);
  final googleAuthService = ref.read(googleAuthServiceProvider);
  return AuthRepository(apiService, authService, googleAuthService);
});

class AuthResponse {
  final User? user;
  final String token;

  AuthResponse({required this.user, required this.token});

  AuthResponse copyWith({User? user, String? token}) {
    return AuthResponse(user: user ?? this.user, token: token ?? this.token);
  }
}
