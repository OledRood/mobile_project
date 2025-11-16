import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_routes.dart';

/// Провайдер GoRouter
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: initialRoute, routes: appRoutes);
});
