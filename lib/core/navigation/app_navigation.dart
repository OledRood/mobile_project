import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_study/core/navigation/app_routes.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';

/// Основной класс для управления навигацией в приложении
class AppNavigation {
  final Ref _ref;
  final authService;

  AppNavigation(this._ref, {this.authService});

  /// Получение экземпляра GoRouter
  GoRouter get _router => _ref.read(NavigatorDi.routerProvider);

  /// Навигация на главную страницу
  void home() {
    _router.go(AppRoutes.home.path);
  }

  void noConnection() {
    _router.push(AppRoutes.noConnection.path);
  }

  void splash() {
    _router.go(AppRoutes.splash.path);
  }

  void onboarding() {
    _router.go(AppRoutes.onboarding.path);
  }

  void signUp() {
    _router.go(AppRoutes.signUp.path);
  }

  void signUpSecond() {
    _router.push(AppRoutes.signUpSecond.path);
  }

  void signUpThird() {
    _router.push(AppRoutes.signUpThird.path);
  }

  void signUpFinal() {
    _router.push(AppRoutes.signUpFinal.path);
  }

  void signIn() {
    _router.push(AppRoutes.signIn.path);
  }

  void registration() {
    _router.go(AppRoutes.registration.path);
  }

  void goBack() {
    if (_router.canPop()) {
      _router.pop();
    }
  }
}
