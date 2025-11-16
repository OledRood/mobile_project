import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(AuthDi.forgotPasswordViewModel.notifier);
    final state = ref.watch(AuthDi.forgotPasswordViewModel);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(14),
          child: GestureDetector(
            onTap: () => viewModel.goBack(),
            child: CustomIconWidget(icon: Icons.chevron_left),
          ),
        ),
        title: Text(
          "Забыли пароль?",
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
                        'Введите вашу электронную почту, и мы отправим вам код для восстановления пароля',
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
                        isLoading: state.isLoading,
                        errorText: state.emailError,
                        onChanged: (_) => viewModel.resetEmailError(),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Zа-яА-ЯёЁ0-9@._+-]'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      if (state.timer != null) ...[
                        CustomTextField(
                          label: 'Код подтверждения',
                          hint: 'Введите код из письма',
                          controller: viewModel.codeController,
                          keyboardType: TextInputType.number,
                          focusNode: viewModel.codeFocusNode,
                          isLoading: state.isLoading,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                        ),
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Код действителен:',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                            ),
                            Text(
                              viewModel.getTime(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: state.timer == null && !state.isLoading
                                ? () => viewModel.resendCode()
                                : null,
                            child: Text(
                              'Отправить код повторно',
                              style: TextStyle(
                                color: state.timer == null && !state.isLoading
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      ],

                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),

            // Кнопка внизу
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            if (state.timer == null) {
                              // Если кода еще нет - отправляем код
                              viewModel.sendCode();
                            } else {
                              // Если код уже отправлен - проверяем и переходим дальше
                              viewModel.sendCode();
                            }
                          },
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
                        : Text(
                            state.timer == null
                                ? "Отправить код"
                                : "Продолжить",
                          ),
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
