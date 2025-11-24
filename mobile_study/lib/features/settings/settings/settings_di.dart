import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/settings_service.dart';
import 'package:mobile_study/core/user/user_notifier.dart';
import 'package:mobile_study/features/settings/settings/domain/settings_view_model.dart';
import 'package:mobile_study/features/settings/settings/models/settings_model.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';

class SettingsDi {
  static final settingsViewModel =
      StateNotifierProvider.autoDispose<SettingsViewModel, SettingsState>((
        ref,
      ) {
        return SettingsViewModel(
          ref: ref,
          themeNotifier: ref.read(themeModeProvider.notifier),
          settingsService: ref.read(settingsServiceProvider),
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          userNotifier: ref.read(UserDi.userNotifierProvider.notifier),
        );
      });
}
