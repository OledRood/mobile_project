import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/core/utils/validators.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

import '../../../../ui/theme/models/app_images.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(AuthDi.signInViewModel.notifier);
    final state = ref.watch(AuthDi.signInViewModel);
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Text(
                'Войдите в аккаунт',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 1),
              Text(
                'Пожалуйста, введите свои данные',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 1),
              CustomTextField(
                label: 'Электронная почта',
                hint: 'Введите электронную почту',
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (_) => viewModel.onEmailSubmit(),
                isLoading: state.isLoading,
                errorText: state.emailError,
                onChanged: (_) => viewModel.resetEmail(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Zа-яА-ЯёЁ0-9@._+-]'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Пароль',
                hint: 'Введите ваш пароль',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9!@#$%^&*()_+=\-\[\]{};:\",.<>?/\\|`~]'),
                  ),
                ],
                controller: viewModel.passwordController,
                onSubmitted: (_) => viewModel.onPasswordSubmit(),
                svgIcon: state.isPasswordVisible
                    ? AppImages.visible_off
                    : AppImages.visible_on,
                onIconPressed: () => viewModel.changePasswordVisibility(),
                obscureText: !state.isPasswordVisible,
                isLoading: state.isLoading,
                errorText: state.passwordError,
                onChanged: (_) => viewModel.resetPassword(),
                focusNode: viewModel.passwordFocusNode,
              ),

              Spacer(flex: 1),
              TextButton(onPressed: () {}, child: const Text("Забыли пароль?")),
              Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    viewModel.tryGoHome();
                  },
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Войти"),
                ),
              ),
              Spacer(flex: 1),
              GoogleSignInButton(
                isLoading: state.isLoading,
                isKeyboardOpen: isKeyboardOpen,
                onPressed: () {viewModel.googleSignIn(); },
              ),

              Spacer(flex: 1),
              TextButton(
                onPressed: () => viewModel.onPressGoToSignUp(),
                // viewModel.navigateToRegistration,
                child: const Text("Зарегистрироваться"),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatefulWidget {
  final bool isLoading;
  final bool isKeyboardOpen;
  final VoidCallback onPressed;

  const GoogleSignInButton({
    super.key,
    required this.isLoading,
    required this.isKeyboardOpen,
    required this.onPressed,
  });

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    final show = !widget.isKeyboardOpen;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: show ? 1.0 : 0.0,
      curve: Curves.easeInOut,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: show ? 1.0 : 0.85,
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          height: show ? 48 : 0,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          child: Visibility(
            visible: show,
            maintainSize: false,
            maintainAnimation: false,
            maintainState: false,
            child: SizedBox(
              height: 52,
              width: 342,
              child: OutlinedButton(
                onPressed: widget.isLoading ? null : widget.onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.googleIcon,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 12),
                    const Text("Войти через Google"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
