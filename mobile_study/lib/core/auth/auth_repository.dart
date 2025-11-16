import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/models/user.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/auth/models/registration_data_model.dart';
import 'package:mobile_study/core/auth/google_auth_service.dart';

class AuthRepository {
  final ApiService _apiService;
  final AuthService _authService;
  final GoogleAuthService _googleAuthService;

  AuthRepository(this._apiService, this._authService, this._googleAuthService);

  // Вход в систему
  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _apiService.post('/auth/login', {
        'email': email,
        'password': password,
      });

      final user = User.fromJson(response['user']);
      final token = response['access_token'];
      final refreshToken = response['refresh_token'];

      // Сохраняем данные
      await _authService.saveToken(token);
      await _authService.saveRefreshToken(refreshToken);
      await _authService.saveUser(user);

      return AuthResponse(user: user, token: token);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<AuthResponse> registerWithFullData(RegistrationDataModel data) async {
    try {
      final fields = {
        'email': data.email,
        'password': data.password,
        if (data.lastName != null) 'lastName': data.lastName!,
        if (data.firstName != null) 'firstName': data.firstName!,
        'middleName': data.middleName ?? '',
        if (data.birthDate != null) 'birthDate': data.birthDate!,
        if (data.isMale != null) 'isMale': data.isMale.toString(),
        if (data.driverLicense != null) 'driverLicense': data.driverLicense!,
        if (data.dateOfIssue != null) 'dateOfIssue': data.dateOfIssue!,
      };

      final files = {
        'driverLicenseFile': data.driverLicenseFile,
        'passportFile': data.passportFile,
        'accountPhotoFile': data.accountPhotoFile,
      };

      // TODO: Раскомментировать когда сервер будет готов
      // final response = await _apiService.postMultipart(
      //   '/auth/register',
      //   fields,
      //   files,
      // );

      // ЗАГЛУШКА для тестирования
      debugPrint('✅ Регистрация успешна! Данные готовы к отправке на сервер.');
      await Future.delayed(const Duration(seconds: 1));

      // Временные данные для заглушки
      final Map<String, dynamic> response = {
        'user': {
          'id': '123',
          'email': data.email,
          'name': '${data.firstName} ${data.lastName}',
        },
        'access_token': 'fake_token_123',
        'refresh_token': 'fake_refresh_token_123',
      };

      final user = User.fromJson(response['user'] as Map<String, dynamic>);
      final token = response['access_token'] as String;
      final refreshToken = response['refresh_token'] as String;

      // Сохраняем данные
      await _authService.saveToken(token);
      await _authService.saveRefreshToken(refreshToken);
      await _authService.saveUser(user);

      return AuthResponse(user: user, token: token);
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  // Выход из системы
  Future<void> logout() async {
    try {
      final token = _authService.getToken();
      if (token != null) {
        await _apiService.post('/auth/logout', {});
      }
    } catch (e) {
      // Логируем ошибку, но не прерываем процесс выхода
    } finally {
      await _authService.clearAuthData();
      // Также выходим из Google аккаунта, если пользователь был залогинен через Google
      if (_googleAuthService.isSignedIn) {
        await _googleAuthService.signOut();
      }
    }
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
      final token = _authService.getToken();
      if (token == null) return null;

      final response = await _apiService.get('/auth/me');
      final user = User.fromJson(response);

      await _authService.saveUser(user);
      return user;
    } catch (e) {
      return null;
    }
  }

  // Проверка действительности токена
  Future<bool> validateToken() async {
    debugPrint('Проверка на vlidateToken');
    try {
      final token = _authService.getToken();
      if (token == null) return false;
      await _apiService.get('/auth/validate');
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
  final apiService = ref.read(apiServiceProvider);
  final authService = ref.read(authServiceProvider);
  final googleAuthService = ref.read(googleAuthServiceProvider);
  return AuthRepository(apiService, authService, googleAuthService);
});

class AuthResponse {
  final User user;
  final String token;

  AuthResponse({required this.user, required this.token});
}
