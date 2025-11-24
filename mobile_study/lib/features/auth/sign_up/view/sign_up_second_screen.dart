import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:mobile_study/features/auth/auth_di.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';
import 'package:mobile_study/ui/widgets/custom_text_field.dart';

final _maskFormatter = MaskTextInputFormatter(mask: '##/##/####');

class SignUpSecondScreen extends ConsumerWidget {
  const SignUpSecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(AuthDi.signUpViewModelStep2.notifier);
    final state = ref.watch(AuthDi.signUpViewModelStep2);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(14),
          child: GestureDetector(
            onTap: () {
              viewModel.goBack();
            },
            child: CustomIconWidget(icon: Icons.chevron_left),
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: 'Фамилия',
                      hint: 'Введите фамилию',
                      controller: viewModel.lastNameController,
                      keyboardType: TextInputType.name,
                      onSubmitted: (_) => viewModel.onLastNameSubmit(),
                      isLoading: state.isLoading,
                      errorText: state.lastNameError,
                      onChanged: (_) => viewModel.resetLastName(),
                      focusNode: viewModel.lastNameFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[а-яА-ЯёЁa-zA-Z\s-]'),
                        ),
                      ],
                      // controller: viewModel.passwordController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Имя',
                      hint: 'Введите имя',
                      controller: viewModel.firstNameController,
                      keyboardType: TextInputType.name,
                      onSubmitted: (_) => viewModel.onFirstNameSubmit(),
                      isLoading: state.isLoading,
                      errorText: state.firstNameError,
                      onChanged: (_) => viewModel.resetFirstName(),
                      focusNode: viewModel.firstNameFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[а-яА-ЯёЁa-zA-Z\s-]'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Отчество',
                      hint: 'Введите отчество',
                      controller: viewModel.middleNameController,
                      keyboardType: TextInputType.name,
                      onSubmitted: (_) => viewModel.onMiddleNameSubmit(),
                      isLoading: state.isLoading,
                      onChanged: (_) => viewModel.resetMiddleName(),
                      focusNode: viewModel.middleNameFocusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[а-яА-ЯёЁa-zA-Z\s-]'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Дата рождения',
                      hint: 'DD/MM/YYYY',
                      prefIcon: AppIcons.calendar,
                      controller: viewModel.dateOfBirthController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => viewModel.onDateOfBirthSubmit(),
                      onChanged: (_) => viewModel.resetDateOfBirth(),
                      isLoading: state.isLoading,
                      errorText: state.dateOfBirthError,
                      focusNode: viewModel.dateOfBirthFocusNode,
                      inputFormatters: [_maskFormatter],
                    ),
                    const SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text("Пол")),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCheckboxWidget(
                            isActive: state.isMen,
                            onTap: () => viewModel.onTapGender(true),
                          ),
                          Text("Мужской"),
                          SizedBox(width: 32),
                          CustomCheckboxWidget(
                            isActive: !state.isMen,
                            onTap: () => viewModel.onTapGender(false),
                          ),
                          Text("Женский"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
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
                      viewModel.goFromStep2();
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

class CustomCheckboxWidget extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const CustomCheckboxWidget({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.only(right: 8.0),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        child: isActive
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
      ),
    );
  }
}
