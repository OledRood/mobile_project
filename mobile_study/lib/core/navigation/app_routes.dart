import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_study/features/car_details/view/car_details_screen.dart';
import 'package:mobile_study/features/car_rent/view/car_rent_view.dart';
import 'package:mobile_study/features/car_rent/view/car_successful_view.dart';
import 'package:mobile_study/features/favorites/view/favorites_view.dart';
import 'package:mobile_study/features/settings/add_car/view/add_car_photo.dart';
import 'package:mobile_study/features/settings/add_car/view/add_car_step1_screen.dart';
import 'package:mobile_study/features/settings/add_car/view/add_car_step2_screen.dart';
import 'package:mobile_study/features/home/view/leader_screen.dart';
import 'package:mobile_study/features/home/view/search_result_screen.dart';
import 'package:mobile_study/features/settings/add_car/view/add_car_successful_screen.dart';
import 'package:mobile_study/features/settings/add_car/view/become_host_screen.dart';
import 'package:mobile_study/features/settings/car_book/view/car_book_view.dart';
import 'package:mobile_study/features/settings/change_password/ui/change_password_view.dart';
import 'package:mobile_study/features/settings/help/help_screen.dart';
import 'package:mobile_study/features/settings/invite_friend/invite_friend_view.dart';
import 'package:mobile_study/features/settings/notifications/notificatioin_screen.dart';
import 'package:mobile_study/features/settings/profile/view/profile_screen.dart';
import 'package:mobile_study/ui/widgets/bottom_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/ui/create_new_password_screen.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/ui/forgot_password_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_final_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_second_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_third_screen.dart';
import 'package:mobile_study/features/settings/history/view/history_view.dart';
import 'package:mobile_study/features/home/view/home_screen.dart';
import 'package:mobile_study/features/no_connection/no_connection_screen.dart';
import 'package:mobile_study/features/onboarding/view/onboarding_screen.dart';
import 'package:mobile_study/features/auth/getting_start/registration_screen.dart';
import 'package:mobile_study/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:mobile_study/features/settings/settings/view/settings_screen.dart';
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
  carDetails("/home/car-details"),

  // car
  carRent("/car-rent"),
  carSuccessful("/car-successful"),
  carBook("/car-book"),
  //settings
  settings('/settings'),
  profile('/settings/profile'),
  history('/settings/history'),
  notification('/settings/notification'),
  inviteFriend('/settings/invite-friend'),
  changePassword('/settings/profile/change-password'),
  help('/settings/help'),
  addCar('/settings/add-car/'),
  addCarBecomeHost('/settings/add-car/become-host'),
  addCarStep1('/settings/add-car/step-1'),
  addCarStep2('/settings/add-car/step-2'),
  addCarPhoto('/settings/add-car/photo'),
  addCarSuccessful('/settings/add-car/successful');

  const AppRoutes(this.path);
  final String path;
}

/// Конфигурация маршрутов для GoRouter
List<RouteBase> get appRoutes => [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        BottomNavigationShell(navigationShell: navigationShell),
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
              GoRoute(
                path: "car-details",
                name: AppRoutes.carDetails.name,
                builder: (context, state) {
                  final params = state.extra as CarParams?;
                  final id = params?.carId ?? state.uri.queryParameters['id'] ?? '';
                  return CarDetailsScreen(carId: id);
                },
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
                routes: [
                  GoRoute(
                    path: 'change-password',
                    name: AppRoutes.changePassword.name,
                    builder: (context, state) => const ChangePasswordScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'history',
                name: AppRoutes.history.name,
                builder: (context, state) => const HistoryScreen(),
              ),

              GoRoute(
                path: 'notification',
                name: AppRoutes.notification.name,
                builder: (context, state) => const NotificatioinScreen(),
              ),

              GoRoute(
                path: 'help',
                name: AppRoutes.help.name,
                builder: (context, state) => const HelpScreen(),
              ),
              GoRoute(
                path: 'invite-friend',
                name: AppRoutes.inviteFriend.name,
                builder: (context, state) => const InviteFriendScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: AppRoutes.carBook.path,
    name: AppRoutes.carBook.name,
    builder: (context, state) {
      final params = state.extra as BookParams?;
      final id = params?.bookId ?? state.uri.queryParameters['id'] ?? '';
      return CarBookView(bookId: id);
    },
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
    path: AppRoutes.addCarBecomeHost.path,
    name: AppRoutes.addCarBecomeHost.name,
    builder: (context, state) {
      return BecomeHostScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.addCarStep1.path,
    name: AppRoutes.addCarStep1.name,
    builder: (context, state) {
      return AddCarStep1Screen();
    },
  ),
  GoRoute(
    path: AppRoutes.addCarStep2.path,
    name: AppRoutes.addCarStep2.name,
    builder: (context, state) {
      return AddCarStep2Screen();
    },
  ),
  GoRoute(
    path: AppRoutes.addCarPhoto.path,
    name: AppRoutes.addCarPhoto.name,
    builder: (context, state) {
      return AddCarPhotoScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.addCarSuccessful.path,
    name: AppRoutes.addCarSuccessful.name,
    builder: (context, state) {
      return AddCarSuccessfulScreen();
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
      final email = params?.email ?? state.uri.queryParameters['email'] ?? '';
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
  GoRoute(
    path: AppRoutes.carRent.path,
    name: AppRoutes.carRent.name,
    builder: (context, state) {
      final params = state.extra as CarParams?;
      final id = params?.carId ?? state.uri.queryParameters['id'] ?? '';

      return CarRentScreen(carId: id);
    },
  ),
  GoRoute(
    path: AppRoutes.carSuccessful.path,
    name: AppRoutes.carSuccessful.name,
    builder: (context, state) {
      return SuccessfulView();
    },
  ),
];

/// Начальный маршрут приложения
String get initialRoute => AppRoutes.splash.path;
