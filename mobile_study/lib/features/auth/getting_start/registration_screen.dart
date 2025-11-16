import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(AuthDi.registrationViewModel.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        'DriveNext',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Поможем найти вою следующую поездку",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Spacer(flex: 2),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 343,
                          width: 343,
                          child: Image.asset(AppImages.splashImage),
                        ),
                      ),
                      Spacer(flex: 2),
                      SizedBox(
                        width: 342,
                        child: FilledButton(
                          onPressed: () => viewModel.signIn(),
                          child: Text("Войти"),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 342,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () => viewModel.signUp(),
                          child: const Text("Зарегистрироваться"),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
