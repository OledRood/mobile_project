import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/network/connection_notifier.dart';

class NoConnectionViewModel extends StateNotifier<void> {
  final AppNavigation appNavigation;
  final Ref ref;

  NoConnectionViewModel({required this.appNavigation, required this.ref})
    : super(null);

  Future<void> onPressRetry() async {
    ref.read(connectionErrorProvider.notifier).resetError();
    final authNotifier = ref.read(authNotifierProvider.notifier);
    debugPrint("Retry: Forcing checkAuthStatus...");
    await authNotifier.checkAuthStatus();
  }
}
