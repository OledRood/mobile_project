import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_study/core/navigation/app_routes.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/add_car/view/add_car_step1_screen.dart';

/// Основной класс для управления навигацией в приложении
class AppNavigation {
  final Ref _ref;
  final authService;

  AppNavigation(this._ref, {this.authService});

  /// Получение экземпляра GoRouter
  GoRouter get _router => _ref.read(NavigatorDi.routerProvider);

  /// Навигация на главную страницу
  void home() async {
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

  void addCarBecomeHost() {
    _router.push(AppRoutes.addCarBecomeHost.path);
  }

  void addCarStep1() {
    _router.push(AppRoutes.addCarStep1.path);
  }

  void addCarStep2() {
    _router.push(AppRoutes.addCarStep2.path);
  }

  void addCarSuccessful() {
    _router.go(AppRoutes.addCarSuccessful.path);
  }

  void addCarPhoto() {
    _router.push(AppRoutes.addCarPhoto.path);
  }

  void signUpSecond() {
    _router.push(AppRoutes.signUpSecond.path);
  }

  void signUpThird() {
    _router.push(AppRoutes.signUpThird.path);
  }

  void signUpFinal() {
    _router.go(AppRoutes.signUpFinal.path);
  }

  void signIn() {
    _router.push(AppRoutes.signIn.path);
  }

  void goSignIn() {
    _router.go(AppRoutes.signIn.path);
  }

  void registration() {
    _router.go(AppRoutes.registration.path);
  }

  void createNewPassword(CreateNewPasswordParams params) {
    _router.push(AppRoutes.createNewPassword.path, extra: params);
  }

  void goCreateNewPassword(CreateNewPasswordParams params) {
    _router.push(AppRoutes.createNewPassword.path, extra: params);
  }

  void profile() {
    _router.push(AppRoutes.profile.path);
  }

  void searchResults() {
    _router.pushReplacement(AppRoutes.searchResults.path);
  }

  void loader() {
    _router.push(AppRoutes.loader.path);
  }

  void history() {
    _router.push(AppRoutes.history.path);
  }

  void carSuccessful() {
    _router.go(AppRoutes.carSuccessful.path);
  }

  void notification() {
    _router.push(AppRoutes.notification.path);
  }

  void help() {
    _router.push(AppRoutes.help.path);
  }

  void inviteFriend() {
    _router.push(AppRoutes.inviteFriend.path);
  }

  void changePassword() {
    _router.push(AppRoutes.changePassword.path);
  }

  void carDetails(CarParams params) {
    _router.push(AppRoutes.carDetails.path, extra: params);
  }

  void carRent(CarParams params) {
    _router.push(AppRoutes.carRent.path, extra: params);
  }

  void carBook(BookParams params) {
    _router.push(AppRoutes.carBook.path, extra: params);
  }

  void goBack() {
    if (_router.canPop()) {
      _router.pop();
    }
  }
}
