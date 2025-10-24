import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/core/utils/validators.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_second_screen.dart';
import 'package:mobile_study/features/auth/sign_up/view/sign_up_third_screen.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';
import 'package:mobile_study/ui/widgets/confirm_exit_dialog.dart';

import '../../../../ui/theme/models/app_colors.dart';
import '../../../../ui/theme/models/app_images.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignUpFirstScreen();
  }
}

class SignUpFirstScreen extends ConsumerWidget {
  const SignUpFirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(AuthDi.signUpViewModelStep1.notifier);
    final state = ref.watch(AuthDi.signUpViewModelStep1);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(14),
          child: GestureDetector(
            onTap: () async {
              // Показываем диалог подтверждения
              final confirmed = await ConfirmExitDialog.show(context);

              // Если пользователь подтвердил - очищаем данные и выходим
              if (confirmed) {
                viewModel.confirmAndExit();
              }
            },
            child: SvgPicture.asset(
              AppImages.leftChevron,
              width: 24,
              height: 24,
            ),
          ),
        ),
        title: Text(
          "Создать аккаунт",
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      SizedBox(height: 8),
                      CustomTextField(
                        label: 'Придумайте пароль',
                        hint: 'Введите пароль',
                        controller: viewModel.passwordController,
                        onSubmitted: (_) => viewModel.onPasswordSubmit(),
                        svgIcon: state.isPasswordVisible
                            ? AppImages.visible_off
                            : AppImages.visible_on,
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
                        hint: 'Введите пароль',
                        controller: viewModel.confirmPasswordController,
                        onSubmitted: (_) => viewModel.onConfirmPasswordSubmit(),
                        svgIcon: state.isConfirmPasswordVisible
                            ? AppImages.visible_off
                            : AppImages.visible_on,
                        onIconPressed: () =>
                            viewModel.changeConfirmPasswordVisible(),
                        obscureText: !state.isConfirmPasswordVisible,
                        isLoading: state.isLoading,
                        errorText: state.confirmPasswordError,
                        onChanged: (_) => viewModel.resetConfirmPassword(),
                        focusNode: viewModel.confirmPasswordFocusNode,
                        icon: state.isConfirmPasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: state.checkPolitics,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(
                              color: state.checkPoliticsError != null
                                  ? AppColors.textFieldError
                                  : Theme.of(context).colorScheme.outline,
                            ),
                            visualDensity: VisualDensity.compact,
                            isError: state.checkPoliticsError != null,
                            onChanged: (newValue) =>
                                viewModel.updateCheckPolitics(newValue!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Я согласен с условиями обслуживания и политикой конфиденциальности',
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 342,
                  child: FilledButton(
                    onPressed: () {
                      viewModel.goFromStep1();
                    },
                    child: const Text("Далее"),
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
