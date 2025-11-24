import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/models/auth_state.dart';
import 'package:mobile_study/core/navigation/app_routes.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/network/connection_notifier.dart';

/// Провайдер GoRouter
final routerProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    refreshListenable: notifier,
    initialLocation: initialRoute,
    routes: appRoutes,
    redirect: (context, state) {
      final isConnectionError = ref.read(connectionErrorProvider);
      final authState = ref.read(authNotifierProvider);
      final currentPath = state.uri
          .toString(); // Важно брать полный URI с параметрами!

      if (isConnectionError) {
        if (currentPath != AppRoutes.noConnection.path) {
          debugPrint(
            'RouterNotifier: Connection error detected on $currentPath. Saving path...',
          );
          // --- СОХРАНЯЕМ ПУТЬ ---
          var pathWithParams = currentPath;
          final extra = state.extra;
          if (extra != null) {
            if (extra is CarParams) {
              final separator = pathWithParams.contains('?') ? '&' : '?';
              pathWithParams += '${separator}id=${extra.carId}';
            } else if (extra is BookParams) {
              final separator = pathWithParams.contains('?') ? '&' : '?';
              pathWithParams += '${separator}id=${extra.bookId}';
            } else if (extra is CreateNewPasswordParams) {
              final separator = pathWithParams.contains('?') ? '&' : '?';
              pathWithParams += '${separator}email=${extra.email}';
            }
          }
          ref.read(connectionErrorProvider.notifier).savePath(pathWithParams);
          return AppRoutes.noConnection.path;
        }
        return null;
      }

      // 2. ВЫХОД ИЗ NO CONNECTION
      if (currentPath == AppRoutes.noConnection.path && !isConnectionError) {
        debugPrint(
          'RouterNotifier: Connection restored. Attempting to restore path...',
        );
        final savedPath = ref
            .read(connectionErrorProvider.notifier)
            .previousPath;
        debugPrint('RouterNotifier: Saved path is: $savedPath');

        if (authState is Authenticated) {
          if (savedPath != null && savedPath.isNotEmpty) {
            debugPrint('RouterNotifier: Restoring to $savedPath');
            return savedPath;
          }
          debugPrint('RouterNotifier: No saved path, going to Home');
          return AppRoutes.home.path;
        }

        if (authState is AuthUnauthenticated) {
          return AppRoutes.signIn.path;
        }

        return null;
      }

      return null;
    },
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<bool>(connectionErrorProvider, (_, __) => notifyListeners());
    _ref.listen<AuthState>(authNotifierProvider, (_, __) => notifyListeners());
  }
}
