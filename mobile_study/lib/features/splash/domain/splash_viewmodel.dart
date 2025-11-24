import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/user/models/user.dart';
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
    FlutterNativeSplash.remove();

    await Future.delayed(const Duration(seconds: 2));

    var authState = ref.read(authNotifierProvider);

    if (authState is AuthLoading || authState is AuthInitial) {
      debugPrint("Splash: Auth is still loading, waiting for result...");
      try {
        authState = await ref
            .read(authNotifierProvider.notifier)
            .stream
            .firstWhere(
              (state) => state is! AuthLoading && state is! AuthInitial,
            );
      } catch (e) {
        authState = AuthState.error(ApiException("Stream error"));
      }
    }

    _handleNavigation(authState);
  }

  Future<void> _handleNavigation(AuthState state) async {
    final authService = ref.read(authServiceProvider);

    state.when(
      //сюда не попадем
      initial: () {},
      loading: () {},

      authenticated: (_) {
        appNavigation.home();
      },

      unauthenticated: () async {
        await _goToOnboardingOrLogin(authService);
      },

      error: (exception) {
        debugPrint("Splash: Error -> $exception");
        if (exception.statusCode == 401) {
          _goToOnboardingOrLogin(authService);
        } else {
          appNavigation.noConnection();
        }
      },
    );
  }

  Future<void> _goToOnboardingOrLogin(AuthService authService) async {
    final isCompleted = await authService.isOnboardingCompleted();
    if (isCompleted) {
      appNavigation.registration();
    } else {
      appNavigation.onboarding();
    }
  }
}
