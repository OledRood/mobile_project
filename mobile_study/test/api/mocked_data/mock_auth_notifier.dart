import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/google_auth_service.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/services/api_service.dart';

import '../api_test.dart';

class MockedApiService extends ApiService {
  MockedApiService() : super(dio: Dio(), ref: MockRef());
}

class MockedAuthService extends AuthService {
  MockedAuthService() : super(MockedApiService());
}

class MockedGoogleAuthService extends GoogleAuthService {
  MockedGoogleAuthService() : super();
}

class MockedAuthRepository extends AuthRepository {
  final bool isTokenValid;

  MockedAuthRepository({this.isTokenValid = true})
    : super(MockedApiService(), MockedAuthService(), MockedGoogleAuthService());

  @override
  Future<bool> validateToken() async {
    return isTokenValid;
  }
}

class MockAuthNotifier extends AuthNotifier {
  String? _token;
  bool refreshCalled = false;

  MockAuthNotifier({String? initialToken})
    : _token = initialToken,
      super(MockedAuthRepository(), MockedAuthService());

  /// Эмулирует получение access токена
  Future<String?> get getAccessToken async => _token;

  /// Эмулирует refresh токена
  /// Можно сделать «умную» логику: первый раз — обновить, потом — выдать null (имитировать logout)
  Future<void> refreshToken() async {
    refreshCalled = true;
    // Например, просто примитивно всегда заменять старый токен на "NEW_TOKEN"
    _token = "NEW_TOKEN";
  }

  // Добавить getter/методы если нужно подменить токен или проверить состояние внутри теста
  void setToken(String? token) => _token = token;
}
