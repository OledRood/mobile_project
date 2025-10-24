import 'package:go_router/go_router.dart';
import 'package:mobile_study/features/home/view/leader_screen.dart';
import 'package:mobile_study/features/home/view/search_result_screen.dart';
import 'package:mobile_study/features/profile/view/profile_screen.dart';
import 'package:mobile_study/ui/widgets/bottom_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/ui/create_new_password_screen.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/ui/forgot_password_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_final_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_second_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_third_screen.dart';
import 'package:mobile_study/features/favorites/favorites_screen.dart';
import 'package:mobile_study/features/history/view/history_screen.dart';
import 'package:mobile_study/features/home/view/home_screen.dart';
import 'package:mobile_study/features/no_connection/no_connection_screen.dart';
import 'package:mobile_study/features/onboarding/view/onboarding_screen.dart';
import 'package:mobile_study/features/auth/getting_start/registration_screen.dart';
import 'package:mobile_study/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:mobile_study/features/settings/view/settings_screen.dart';
import 'package:mobile_study/features/splash/ui/splash_screen.dart';

/// Маршруты приложения
enum AppRoutes {
  splash('/'),
  onboarding('/onboarding'),
  noConnection('/no-connection'),
  loader("/loader"),

  favorites('/favorites'),

  //registration
  registration('/registration'),

  signIn('/registration/signIn'),
  forgotPassword('/registration/signIn/forgot-password'),

  signUp('/registration/signUp'),
  signUpSecond('/registration/signUp/second'),
  signUpThird('/registration/signUp/third'),
  signUpFinal('/registration/signUp/final'),
  createNewPassword('/registration/create-new-password'),

  //home
  home('/home'),
  searchResults('/home/search-results'),

  //settings
  settings('/settings'),
  profile('/settings/profile'),
  history('/settings/history');

  const AppRoutes(this.path);
  final String path;
}

/// Конфигурация маршрутов для GoRouter
List<RouteBase> get appRoutes => [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => BottomNavigationShell(
      navigationShell: navigationShell,
    ), // см. файл bottom_navigation.dart
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const HomeScreen()),
            routes: [
              GoRoute(
                path: "search-results",
                name: AppRoutes.searchResults.name,
                builder: (context, state) => const SearchResultScreen(),
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRoutes.favorites.path,
            name: AppRoutes.favorites.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const FavoritesScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRoutes.settings.path,
            name: AppRoutes.settings.name,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const SettingsScreen()),
            routes: [
              GoRoute(
                path: 'profile', // Используем относительный путь здесь
                name: AppRoutes.profile.name,
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                path: 'history',
                name: AppRoutes.history.name,
                builder: (context, state) => const HistoryScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: AppRoutes.splash.path,
    name: AppRoutes.splash.name,
    builder: (context, state) => const SplashScreen(),
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
  GoRoute(
    path: AppRoutes.forgotPassword.path,
    name: AppRoutes.forgotPassword.name,
    builder: (context, state) {
      return ForgotPasswordScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.createNewPassword.path,
    name: AppRoutes.createNewPassword.name,
    builder: (context, state) {
      final params = state.extra as CreateNewPasswordParams?;
      final email = params?.email ?? '';
      return CreateNewPasswordScreen(email: email);
    },
  ),
  GoRoute(
    path: AppRoutes.loader.path,
    name: AppRoutes.loader.name,
    builder: (context, state) {
      return LoaderScreen();
    },
  ),
];

/// Начальный маршрут приложения
String get initialRoute => AppRoutes.splash.path;
