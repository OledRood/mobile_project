import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';

class SignUpViewModelFinal extends StateNotifier<void> {
  final AppNavigation appNavigation;

  SignUpViewModelFinal({required this.appNavigation}) : super(null);

  void goToHome() {
    appNavigation.home();
  }
}
