import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

/// Сервис для работы с Google OAuth
///
/// Этот класс инкапсулирует всю логику работы с Google Sign-In:
/// - Вход через Google
/// - Выход из Google аккаунта
/// - Получение токенов доступа
class GoogleAuthService {
  // Инициализация GoogleSignIn с необходимыми scopes (разрешениями)
  // scopes определяют, к каким данным пользователя мы хотим получить доступ
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  /// Метод для входа через Google
  ///
  /// Процесс:
  /// 1. Открывается окно выбора Google аккаунта
  /// 2. Пользователь выбирает аккаунт и дает разрешения
  /// 3. Возвращается объект GoogleSignInAccount с данными пользователя
  ///
  /// Возвращает null, если пользователь отменил вход
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      // Попытка входа
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account != null) {
        debugPrint('✅ Google Sign-In успешен для: ${account.email}');
      } else {
        debugPrint('⚠️ Пользователь отменил вход через Google');
      }

      return account;
    } catch (error) {
      debugPrint('❌ Ошибка Google Sign-In: $error');
      return null;
    }
  }

  /// Получение ID токена для отправки на backend
  ///
  /// ID Token - это JWT токен, который содержит информацию о пользователе
  /// и может быть проверен на вашем backend сервере для аутентификации
  Future<String?> getIdToken() async {
    try {
      final GoogleSignInAccount? currentUser = _googleSignIn.currentUser;

      if (currentUser == null) {
        debugPrint('⚠️ Нет активного пользователя Google');
        return null;
      }

      // Получаем аутентификационные данные
      final GoogleSignInAuthentication auth = await currentUser.authentication;

      // idToken - это JWT токен для аутентификации на backend
      return auth.idToken;
    } catch (error) {
      debugPrint('❌ Ошибка получения ID токена: $error');
      return null;
    }
  }

  /// Получение Access Token для работы с Google API
  ///
  /// Access Token используется для доступа к различным Google сервисам
  /// (например, Google Drive, Calendar и т.д.)
  Future<String?> getAccessToken() async {
    try {
      final GoogleSignInAccount? currentUser = _googleSignIn.currentUser;

      if (currentUser == null) {
        debugPrint('⚠️ Нет активного пользователя Google');
        return null;
      }

      final GoogleSignInAuthentication auth = await currentUser.authentication;

      // accessToken - токен для доступа к Google API
      return auth.accessToken;
    } catch (error) {
      debugPrint('❌ Ошибка получения Access токена: $error');
      return null;
    }
  }

  /// Получение текущего пользователя Google (если он уже залогинен)
  ///
  /// Полезно для проверки, авторизован ли пользователь
  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;

  /// Проверка, залогинен ли пользователь через Google
  bool get isSignedIn => _googleSignIn.currentUser != null;

  /// Выход из Google аккаунта
  ///
  /// Полностью отключает пользователя от приложения
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      debugPrint('✅ Выход из Google аккаунта выполнен');
    } catch (error) {
      debugPrint('❌ Ошибка выхода из Google: $error');
    }
  }

  /// Отключение доступа приложения к Google аккаунту
  ///
  /// Это более строгое действие, чем signOut:
  /// - signOut() просто выходит из аккаунта
  /// - disconnect() полностью отзывает разрешения приложения
  Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
      debugPrint('✅ Отключение от Google аккаунта выполнено');
    } catch (error) {
      debugPrint('❌ Ошибка отключения от Google: $error');
    }
  }

  /// Попытка автоматического входа (Silent Sign-In)
  ///
  /// Пытается войти автоматически, если пользователь ранее уже входил
  /// Не показывает UI, работает в фоне
  Future<GoogleSignInAccount?> signInSilently() async {
    try {
      final account = await _googleSignIn.signInSilently();

      if (account != null) {
        debugPrint('✅ Тихий вход в Google выполнен для: ${account.email}');
      }

      return account;
    } catch (error) {
      debugPrint('⚠️ Не удалось выполнить тихий вход: $error');
      return null;
    }
  }
}
