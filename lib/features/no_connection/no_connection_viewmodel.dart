import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';

class NoConnectionViewModel extends StateNotifier<void> {
  final AppNavigation appNavigation;
  final Ref ref;

  NoConnectionViewModel({required this.appNavigation, required this.ref})
    : super(null);

  Future<void> onPressRetry() async {
    final notifierAuthState = ref.read(authProvider.notifier);
    await notifierAuthState.checkAuthStatus();
    appNavigation.goBack();
  }
}
