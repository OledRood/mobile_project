import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

class CreateNewPasswordScreen extends ConsumerStatefulWidget {
  final String email;

  const CreateNewPasswordScreen({super.key, required this.email});

  @override
  ConsumerState<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState
    extends ConsumerState<CreateNewPasswordScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(AuthDi.createNewPasswordViewModel.notifier).init(widget.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(AuthDi.createNewPasswordViewModel.notifier);
    final state = ref.watch(AuthDi.createNewPasswordViewModel);

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          "Новый пароль",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Придумайте новый пароль для вашей учетной записи',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 24),
                      CustomTextField(
                        label: 'Электронная почта',
                        hint: 'Введите электронную почту',
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (_) => viewModel.onEmailSubmit(),
                        isLoading: true,
                        errorText: state.emailError,
                        onChanged: (_) {},
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Zа-яА-ЯёЁ0-9@._+-]'),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      CustomTextField(
                        label: 'Новый пароль',
                        hint: 'Введите новый пароль',
                        controller: viewModel.passwordController,
                        onSubmitted: (_) => viewModel.onPasswordSubmit(),
                        svgIcon: state.isPasswordVisible
                            ? AppIcons.visible_off
                            : AppIcons.visible_on,
                        onIconPressed: () =>
                            viewModel.changePasswordVisibility(),
                        obscureText: !state.isPasswordVisible,
                        isLoading: state.isLoading,
                        errorText: state.passwordError,
                        onChanged: (_) => viewModel.resetPassword(),
                        focusNode: viewModel.passwordFocusNode,
                      ),
                      SizedBox(height: 8),
                      CustomTextField(
                        label: 'Повторите пароль',
                        hint: 'Введите пароль еще раз',
                        controller: viewModel.confirmPasswordController,
                        onSubmitted: (_) => viewModel.onConfirmPasswordSubmit(),
                        svgIcon: state.isConfirmPasswordVisible
                            ? AppIcons.visible_off
                            : AppIcons.visible_on,
                        onIconPressed: () =>
                            viewModel.changeConfirmPasswordVisible(),
                        obscureText: !state.isConfirmPasswordVisible,
                        isLoading: state.isLoading,
                        errorText: state.confirmPasswordError,
                        onChanged: (_) => viewModel.resetConfirmPassword(),
                        focusNode: viewModel.confirmPasswordFocusNode,
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: state.isLoading
                        ? null
                        : () => viewModel.submitNewPassword(),
                    child: state.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : Text("Сохранить пароль"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
