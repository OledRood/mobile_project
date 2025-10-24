import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/onboarding/domain/onboarding_view_model.dart';
import 'package:mobile_study/features/onboarding/models/onboarding_model.dart';

import '../../core/auth/auth_service.dart';

class OnboardingDi {
  static final onboardingViewModel =
      StateNotifierProvider<OnboardingViewModel, OnboardingState>((ref) {
        return OnboardingViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authService: ref.read(authServiceProvider),
        );
      });
}
