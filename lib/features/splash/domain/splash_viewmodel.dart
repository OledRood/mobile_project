import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/auth/models/user.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/auth/auth_service.dart';

class SplashViewModel extends StateNotifier<void> {
  final AppNavigation appNavigation;
  final Ref ref;

  SplashViewModel({required this.appNavigation, required this.ref})
    : super(null) {
    init();
  }

  Future<void> init() async {
    // Скрываем нативный splash screen, когда Flutter UI готов
    FlutterNativeSplash.remove();
    await Future.delayed(Duration(seconds: 2));
    _checkAuthAndNavigate();
  }

  void _checkAuthAndNavigate() {
    debugPrint("checkAuthAndNavigate");
    var currentAuthState = ref.read(authProvider);
    final notifierAuthState = ref.read(authProvider.notifier);
    final authService = ref.read(
      authServiceProvider,
    ); // Используем authServiceProvider

    // currentAuthState = AuthState.unauthenticated();

    // MARK: Удалить после внедрения аутентификации
    currentAuthState = AuthState.authenticated(
      User(name: "Test User", id: 'test id', email: 'test_email@example.com'),
      "test_token",
    );
    debugPrint(currentAuthState.toString());

    currentAuthState.when(
      initial: () => _listenToAuthChanges(),
      loading: () => _listenToAuthChanges(),
      authenticated: (User user, String token) => goToHome(),
      unauthenticated: () => goToOnboarding(authService),
      error: (message) async {
        print('Auth error: $message');
        await Future.delayed(Duration(seconds: 2));
        notifierAuthState.checkAuthStatus();
      },
    );
  }

  void _listenToAuthChanges() {
    final notifierAuthState = ref.read(authProvider.notifier);
    final authService = ref.read(
      authServiceProvider,
    ); // Используем authServiceProvider

    // Подписываемся на изменения состояния аутентификации
    ref.listen(authProvider, (previous, next) {
      debugPrint(next.toString());
      next.when(
        initial: () => {},
        loading: () => {},
        authenticated: (user, token) {
          print('User authenticated: ${user.name}');
          goToHome();
        },
        unauthenticated: () => goToOnboarding(authService),
        error: (message) async {
          print('Auth error: $message');
          await Future.delayed(Duration(seconds: 2));
          notifierAuthState.checkAuthStatus();
        },
      );
    });
  }

  void goToHome() {
    appNavigation.home();
  }

  Future<void> goToOnboarding(AuthService authService) async {
    // async вместо await
    final isOnboardingCompleted = await authService.isOnboardingCompleted();

    if (isOnboardingCompleted) {
      appNavigation.registration();
    } else {
      appNavigation.onboarding();
    }
  }
}
