import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/auth/auth_repository.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/domain/create_new_password_viewmodel.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/domain/forgot_password_viewmodel.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/model/create_new_password_model.dart';
import 'package:mobile_study/features/auth/forgot_password.dart/model/forgot_password_model.dart';
import 'package:mobile_study/features/auth/sign_up/domain/sign_up_view_model_final.dart';
import 'package:mobile_study/features/auth/sign_up/domain/sign_up_view_model_step1.dart';
import 'package:mobile_study/features/auth/sign_up/domain/sign_up_view_model_step2.dart';
import 'package:mobile_study/features/auth/sign_up/domain/sign_up_view_model_step3.dart';
import 'package:mobile_study/features/auth/sign_up/models/sign_up_model.dart';
import 'package:mobile_study/features/auth/getting_start/registration_viewmodel.dart';
import 'package:mobile_study/features/auth/sign_in/models/sign_in_model.dart';
import 'package:mobile_study/features/auth/sign_in/domain/sign_in_viewmodel.dart';
import 'package:mobile_study/core/auth/models/auth_data_model.dart'
    as auth_data;
import 'package:mobile_study/core/auth/auth_notifier.dart';

class AuthDi {
  static final authDataProvider = auth_data.authDataProvider;
  static final signInViewModel =
      StateNotifierProvider<SignInViewModel, SignInState>((ref) {
        return SignInViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authRepository: ref.read(authRepositoryProvider),
        );
      });
  static final registrationViewModel =
      StateNotifierProvider<RegistrationViewModel, void>((ref) {
        return RegistrationViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
        );
      });
  static final signUpViewModelStep1 =
      StateNotifierProvider<SignUpViewModelStep1, SignUpStateStep1>((ref) {
        return SignUpViewModelStep1(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authDataNotifier: ref.read(authDataProvider.notifier),
        );
      });
  static final signUpViewModelStep2 =
      StateNotifierProvider<SignUpViewModelStep2, SignUpStateStep2>((ref) {
        return SignUpViewModelStep2(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authDataNotifier: ref.read(authDataProvider.notifier),
        );
      });
  static final signUpViewModelStep3 =
      StateNotifierProvider<SignUpViewModelStep3, SignUpStateStep3>((ref) {
        return SignUpViewModelStep3(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authDataNotifier: ref.read(authDataProvider.notifier),
          authNotifier: ref.read(authProvider.notifier),
          scaffoldMessengerManager: ref.read(
            MessageDi.scaffoldMessengerManager,
          ),
        );
      });

  static final signUpViewModelFinal =
      StateNotifierProvider<SignUpViewModelFinal, void>((ref) {
        return SignUpViewModelFinal(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
        );
      });
  static final forgotPasswordViewModel =
      StateNotifierProvider.autoDispose<
        ForgotPasswordViewModel,
        ForgotPasswordState
      >((ref) {
        return ForgotPasswordViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authNotifier: ref.read(authProvider.notifier),
          scaffoldMessengerManager: ref.read(
            MessageDi.scaffoldMessengerManager,
          ),
        );
      });

  static final createNewPasswordViewModel =
      StateNotifierProvider.autoDispose<
        CreateNewPasswordViewModel,
        CreateNewPasswordState
      >((ref) {
        return CreateNewPasswordViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authNotifier: ref.read(authProvider.notifier),
          scaffoldMessengerManager: ref.read(
            MessageDi.scaffoldMessengerManager,
          ),
        );
      });
}
