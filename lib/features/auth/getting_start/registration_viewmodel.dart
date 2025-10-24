import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';

class RegistrationViewModel extends StateNotifier<void> {
  final AppNavigation appNavigation;

  RegistrationViewModel({required this.appNavigation}) : super(null);

  void signIn() {
    appNavigation.signIn();
  }

  void signUp() {
    appNavigation.signUp();
  }
}
