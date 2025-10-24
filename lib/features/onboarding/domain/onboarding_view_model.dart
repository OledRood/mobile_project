import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/features/onboarding/models/onboarding_model.dart';

import '../../../core/auth/auth_service.dart';
import '../../../core/auth/models/auth_state.dart';

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  final AppNavigation appNavigation;
  final AuthService authService;

  OnboardingViewModel({required this.appNavigation, required this.authService})
    : super(const OnboardingState.first());

  void pressNextButton() {
    switch (state) {
      case FirstState():
        state = const OnboardingState.second();
        break;
      case SecondState():
        state = const OnboardingState.third();
        break;
      default:
        goToLoginPage();
        break;
    }
  }

  void skipOnboarding() {
    goToLoginPage();
  }

  void goToLoginPage() {
    authService.setOnboardingCompleted();
    appNavigation.registration();
  }
}
