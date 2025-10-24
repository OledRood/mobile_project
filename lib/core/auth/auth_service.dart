import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // Сохранение данных пользователя
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();

    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  // Получение данных пользователя
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final userData = prefs.getString(_userKey);
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
  Future<String?> refreshToken() async {
    final refreshToken = getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await _apiService.post('/auth/refresh', {
        'refresh_token': refreshToken,
      });

      final newToken = response['access_token'];
      final newRefreshToken = response['refresh_token'];

      await saveToken(newToken);
      await saveRefreshToken(newRefreshToken);

      return newToken;
    } catch (e) {
      await clearAuthData();
      return null;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthService(apiService);
});
