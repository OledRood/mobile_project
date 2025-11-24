import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/user/user_notifier.dart';
import 'package:mobile_study/features/settings/profile/domain/profile_view_model.dart';
import 'package:mobile_study/features/settings/profile/models/profile_model.dart';

class ProfileDi {
  static final profileViewModel =
      StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>((ref) {
        return ProfileViewModel(
          ref: ref,
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          scaffoldMessenger: ref.read(MessageDi.scaffoldMessengerManager),
          userNotifier: ref.read(UserDi.userNotifierProvider.notifier),
          authNotifier: ref.read(authNotifierProvider.notifier),
        );
      });
}
