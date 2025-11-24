import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/onboarding/onboarding_di.dart';
import 'package:mobile_study/ui/theme/models/app_colors.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(OnboardingDi.onboardingViewModel);
    final viewModel = ref.watch(OnboardingDi.onboardingViewModel.notifier);

    final displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextButton(
              onPressed: () => viewModel.skipOnboarding(),
              child: Text(
                "Пропустить",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.4, // 40% высоты экрана
              child: SvgPicture.asset(
                state.image,
                width: displayWidth,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(flex: 2),
            const TextsWidgets(),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Row(
                    children: List.generate(3, (index) {
                      final bool isActive = index == state.buttonIndex;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 40 : 16,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: 131,
                    child: FilledButton(
                      onPressed: () => viewModel.pressNextButton(),
                      child: Text(
                        state.buttonText,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class TextsWidgets extends ConsumerWidget {
  const TextsWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(OnboardingDi.onboardingViewModel);
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.title,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            state.description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
