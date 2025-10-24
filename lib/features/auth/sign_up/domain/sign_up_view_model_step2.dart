import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/utils/validators.dart';
import 'package:mobile_study/features/auth/sign_up/models/sign_up_model.dart';
import 'package:mobile_study/core/auth/models/auth_data_model.dart';

class SignUpViewModelStep2 extends StateNotifier<SignUpStateStep2> {
  final AppNavigation appNavigation;
  final StateController<AuthDataModel?> authDataNotifier;

  SignUpViewModelStep2({
    required this.appNavigation,
    required this.authDataNotifier,
  }) : super(SignUpStateStep2());

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode middleNameFocusNode = FocusNode();
  final FocusNode dateOfBirthFocusNode = FocusNode();

  void onLastNameSubmit() {
    if (state.isLoading) return;
    firstNameFocusNode.requestFocus();
    checkLastName();
  }

  void checkLastName() {
    if (lastNameController.text.length <= 1) {
      state = state.copyWith(lastNameError: "Поле обязательно для заполнения");
    } else {
      state = state.copyWith(lastNameError: null);
    }
  }

  void resetLastName() {
    if (state.isLoading) return;
    state = state.copyWith(lastNameError: null);
  }

  void onFirstNameSubmit() {
    if (state.isLoading) return;
    middleNameFocusNode.requestFocus();
    checkFirstName();
  }

  void checkFirstName() {
    if (firstNameController.text.isEmpty) {
      state = state.copyWith(firstNameError: "Поле обязательно для заполнения");
    } else {
      state = state.copyWith(firstNameError: null);
    }
  }

  void resetFirstName() {
    if (state.isLoading) return;
    state = state.copyWith(firstNameError: null);
  }

  void onMiddleNameSubmit() {
    if (state.isLoading) return;
    dateOfBirthFocusNode.requestFocus();
  }

  void resetMiddleName() {}

  void goBack() {
    appNavigation.goBack();
  }

  void onDateOfBirthSubmit() {
    if (state.isLoading) return;
    checkDateOfBirth();
    goFromStep2();
  }

  void resetDateOfBirth() {
    if (state.isLoading) return;
    state = state.copyWith(dateOfBirthError: null);
  }

  void checkDateOfBirth() {
    final date = dateOfBirthController.text;
    final error = Validators.validateBirthdayDate(date);
    state = state.copyWith(dateOfBirthError: error);
  }

  void onTapGender(bool isMen) {
    if (state.isLoading) return;
    state = state.copyWith(isMen: isMen);
  }

  void goFromStep2() {
    if (state.isLoading) return;
    checkDateOfBirth();
    checkFirstName();
    checkLastName();
    if (state.hasErrors) return;

    state = state.copyWith(isLoading: true);

    final currentData = authDataNotifier.state;
    authDataNotifier.state = currentData?.copyWith(
      lastName: lastNameController.text,
      firstName: firstNameController.text,
      middleName: middleNameController.text,
      birthDate: dateOfBirthController.text,
      isMale: state.isMen,
    );

    appNavigation.signUpThird();
    state = state.copyWith(isLoading: false);
  }

  @override
  void dispose() {
    lastNameController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    dateOfBirthController.dispose();
    lastNameFocusNode.dispose();
    firstNameFocusNode.dispose();
    middleNameFocusNode.dispose();

    super.dispose();
  }

  void skip() {
    appNavigation.signUpThird();
  }
}
