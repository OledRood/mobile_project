import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_notifier.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/change_password/domain/change_password_viewmodel.dart';
import 'package:mobile_study/features/settings/change_password/models/change_password_model.dart';
import 'package:mobile_study/features/settings/settings/domain/settings_view_model.dart';
import 'package:mobile_study/features/settings/settings/models/settings_model.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';

class ChangeDi {
  static final changePasswordViewModel =
      StateNotifierProvider<ChangePasswordViewModel, ChangePasswordState>((
        ref,
      ) {
        return ChangePasswordViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authNotifier: ref.read(authNotifierProvider.notifier),
          scaffoldMessengerManager: ref.read(
            MessageDi.scaffoldMessengerManager,
          ),
        );
      });
}
