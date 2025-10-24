import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/features/splash/domain/splash_viewmodel.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';

class SplashDi {
  static final splashViewModel =
      StateNotifierProvider.autoDispose<SplashViewModel, void>((ref) {
        return SplashViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          ref: ref,
        );
      });
}
