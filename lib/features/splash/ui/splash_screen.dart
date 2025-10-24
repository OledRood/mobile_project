import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/features/splash/splash_di.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(SplashDi.splashViewModel.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                style: Theme.of(context).textTheme.displayMedium,
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
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
