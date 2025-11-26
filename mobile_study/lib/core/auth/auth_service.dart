import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_study/core/constants/app_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../services/api_service.dart';
import '../user/models/user.dart';

class AuthService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _onboardingCompletedKey = 'onboarding_completed';

  final ApiService _apiService;

  AuthService(this._apiService);

  // Сохранение токена
  Future<void> saveToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_accessTokenKey, accessToken);
  }

  // Получение токена
  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_refreshTokenKey);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_accessTokenKey);
  }

  // Сохранение refresh токена
  Future<void> saveRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<User> saveUser(User user) async {
    debugPrint("saving user: avatar=${user.avatar}");
    final prefs = await SharedPreferences.getInstance();
    User toSave = user;

    if (user.avatar != null) {
      final newAvatarPath = await saveAvatarImage(user.avatar!);
      toSave = user.copyWith(avatar: newAvatarPath);
    }

    final userJson = jsonEncode(toSave.toJson());
    final saved = await prefs.setString(_userKey, userJson);
    debugPrint("saveUser: key=$_userKey saved=$saved");
    debugPrint("prefs keys after save: ${prefs.getKeys()}");
    return toSave;
  }

  Future<String> saveAvatarImage(String avatarPath) async {
    debugPrint('saving avatar image');
    // Копируем файл в постоянную директорию приложения и сохраняем путь в SharedPreferences.
    // Возвращаем путь к скопированному файлу. В случае ошибок сохраняем исходный путь как фоллбэк.
    try {
      final prefs = await SharedPreferences.getInstance();

      final srcFile = File(avatarPath);
      // Если исходного файла нет — просто сохраняем путь в prefs (фоллбэк)
      if (!await srcFile.exists()) {
        await prefs.setString('avatar_image', avatarPath);
        return avatarPath;
      }

      final appDir = await getApplicationDocumentsDirectory();
      final photosDir = Directory(p.join(appDir.path, 'profile_photos'));
      if (!await photosDir.exists()) {
        await photosDir.create(recursive: true);
      }

      final fileName = p.basename(avatarPath);
      final targetPath = p.join(
        photosDir.path,
        '${DateTime.now().millisecondsSinceEpoch}_$fileName',
      );
      final copied = await srcFile.copy(targetPath);

      await prefs.setString('avatar_image', copied.path);
      return copied.path;
    } catch (e) {
      // фоллбэк — сохраняем исходный путь, чтобы не терять ссылку
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('avatar_image', avatarPath);
      } catch (_) {}
      return avatarPath;
    }
  }

  // Получение данных пользователя
  Future<User?> getUser() async {
    debugPrint("getting user");
    final prefs = await SharedPreferences.getInstance();

    final userData = prefs.getString(_userKey);
    debugPrint("userData: $userData");

    if (userData != null) {
      try {
        final Map<String, dynamic> userMap = jsonDecode(userData);
        return User.fromJson(userMap);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  //Onboarding

  Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
  }

  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  Future<void> resetOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_onboardingCompletedKey);
  }

  // // Проверка авторизации
  // Future<bool> get isAuthenticated async => await getAccessToken() != null;

  // Очистка всех данных при выходе
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_accessTokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_refreshTokenKey);
  }
  // В auth_service.dart

  Future<String?> refreshToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await _apiService.post(
        AppEndpoints.authRefresh,
        {'refresh_token': refreshToken},
        withAuth: false,
        isTokenRequest: true,
      );

      final newToken = response['access_token'];
      final newRefreshToken = response['refresh_token'];

      await saveToken(newToken);
      await saveRefreshToken(newRefreshToken);

      return newToken;
    } on ApiException catch (e) {
      if ((e.statusCode == 401)) {
        await clearAuthData();
        throw ApiException("Session expired", 401);
      }
    } on DioException catch (e) {
      // 1. СЕТЬ: БРОСАЕМ ОШИБКУ ДАЛЬШЕ
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.error is SocketException) {
        // Важно: НЕ возвращаем null. Бросаем, чтобы checkAuthStatus поймал это в catch
        throw ApiException(
          "No internet connection",
          -1,
        ); // -1 или любой код для сети
      }

      // 2. 401 (REFRESH TOKEN УМЕР): ЧИСТИМ И БРОСАЕМ 401
      if (e.response?.statusCode == 401) {
        await clearAuthData();
        // Бросаем 401, чтобы Notifier перевел в Unauthenticated
        throw ApiException("Session expired", 401);
      }

      // 3. ПРОЧИЕ ОШИБКИ
      throw ApiException("Failed to refresh token", e.response?.statusCode);
    } catch (e) {
      debugPrint("Unknown error during refresh: $e");
      throw ApiException("Unknown error: $e");
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.read(ApiServiceDi.apiServiceProvider);
  return AuthService(apiService);
});
