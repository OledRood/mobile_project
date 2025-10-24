import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/router_notifier.dart'
    as router_notifier;

import '../auth/auth_service.dart';

/// Dependency Injection для системы навигации
class NavigatorDi {
  /// Провайдер для GoRouter (используем из router_notifier.dart)
  static final routerProvider = router_notifier.routerProvider;

  /// Провайдер для AppNavigation
  static final appNavigationProvider = Provider<AppNavigation>((ref) {
    return AppNavigation(ref, authService: ref.watch(authServiceProvider));
  });
}
