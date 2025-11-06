import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../services/api_service.dart';
import 'models/user.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _onboardingCompletedKey = 'onboarding_completed';

  final ApiService _apiService;

  AuthService(this._apiService);

  // Сохранение токена
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_tokenKey, token);
  }

  // Получение токена
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_tokenKey);
  }

  // Сохранение refresh токена
  Future<void> saveRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  // Получение refresh токена
  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_refreshTokenKey);
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
    debugPrint("userData: ${userData}");

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

  // Проверка авторизации
  bool get isAuthenticated => getToken() != null;

  // Очистка всех данных при выходе
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_refreshTokenKey);
  }

  // Обновление токена
  //   Future<String?> refreshToken() async {
  //     final refreshToken = getRefreshToken();
  //     if (refreshToken == null) return null;

  //     try {
  //       final response = await _apiService.post('/auth/refresh', {
  //         'refresh_token': refreshToken,
  //       });

  //       final newToken = response['access_token'];
  //       final newRefreshToken = response['refresh_token'];

  //       await saveToken(newToken);
  //       await saveRefreshToken(newRefreshToken);

  //       return newToken;
  //     } catch (e) {
  //       await clearAuthData();
  //       return null;
  //     }
  //   }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthService(apiService);
});
