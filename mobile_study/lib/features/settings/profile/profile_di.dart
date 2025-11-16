import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/profile/domain/profile_view_model.dart';
import 'package:mobile_study/features/settings/profile/models/profile_model.dart';
import 'package:mobile_study/features/settings/settings_di.dart';

class ProfileDi {
  static final profileViewModel =
      StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>((ref) {
        return ProfileViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authService: ref.read(authServiceProvider),
          scaffoldMessenger: ref.read(MessageDi.scaffoldMessengerManager),
          settingsViewModel: ref.read(SettingsDi.settingsViewModel.notifier),
          authNotifier: ref.read(authProvider.notifier),
        );
      });
}
