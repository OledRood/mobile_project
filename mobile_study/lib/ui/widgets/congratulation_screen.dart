import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class CongratulationScreen extends ConsumerWidget {
  final String title;
  final String message;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const CongratulationScreen({
    super.key,
    required this.title,
    required this.message,
    required this.subtitle,
    required this.onButtonPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              Spacer(flex: 2),

              SvgPicture.asset(AppIcons.checkCircle, width: 96, height: 96),

              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Spacer(flex: 1),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 50,
                  width: 342,
                  child: FilledButton(
                    onPressed: onButtonPressed,
                    child: Text(buttonText),
                  ),
                ),
              ),
              // Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
