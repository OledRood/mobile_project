import 'package:go_router/go_router.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_final_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_second_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_third_screen.dart';
import 'package:mobile_study/features/home/ui/home_screen.dart';
import 'package:mobile_study/features/no_connection/no_connection_screen.dart';
import 'package:mobile_study/features/onboarding/view/onboarding_screen.dart';
import 'package:mobile_study/features/auth/getting_start/registration_screen.dart';
import 'package:mobile_study/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:mobile_study/features/splash/ui/splash_screen.dart';

/// Маршруты приложения
enum AppRoutes {
  splash('/'),
  home('/home'),
  onboarding('/onboarding'),

  noConnection('/no-connection'),

  registration('/registration'),
  signIn('/registration/signIn'),
  signUp('/registration/signUp'),
  signUpSecond('/registration/signUp/second'),
  signUpThird('/registration/signUp/third'),
  signUpFinal('/registration/signUp/final');

  const AppRoutes(this.path);
  final String path;
}

/// Конфигурация маршрутов для GoRouter
List<RouteBase> get appRoutes => [
  GoRoute(
    path: AppRoutes.splash.path,
    name: AppRoutes.splash.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRoutes.home.path,
    name: AppRoutes.home.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: AppRoutes.onboarding.path,
    name: AppRoutes.onboarding.name,
    builder: (context, state) {
      return OnboardingScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.noConnection.path,
    name: AppRoutes.noConnection.name,
    builder: (context, state) {
      return NoConnectionScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signIn.path,
    name: AppRoutes.signIn.name,
    builder: (context, state) {
      return SignInScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.registration.path,
    name: AppRoutes.registration.name,
    builder: (context, state) => RegistrationScreen(),
  ),
  GoRoute(
    path: AppRoutes.signUp.path,
    name: AppRoutes.signUp.name,
    builder: (context, state) {
      return SignUpScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signUpSecond.path,
    builder: (context, state) => SignUpSecondScreen(),
  ),
  GoRoute(
    path: AppRoutes.signUpThird.path,
    builder: (context, state) => SignUpThirdScreen(),
  ),
  GoRoute(
    path: AppRoutes.signUpFinal.path,
    builder: (context, state) {
      return SignUpFinalScreen();
    },
  ),
];

/// Начальный маршрут приложения
String get initialRoute => AppRoutes.splash.path;
