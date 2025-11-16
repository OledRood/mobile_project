import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/widgets/congratulation_screen.dart';

class SignUpFinalScreen extends ConsumerWidget {
  const SignUpFinalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(AuthDi.signUpViewModelFinal.notifier);

    return CongratulationScreen(
      title: 'Пользуйтесь с удовольствием',
      message: 'Поздравляем',
      subtitle:
          'Вы успешно зарегистрировались.\nОбработка ваших персональных данных\nзаймет около двух часов.\nСпасибо за ожидание.',
      onButtonPressed: () {
        viewModel.goToHome();
      },
      buttonText: "Далее",
    );
  }
}
