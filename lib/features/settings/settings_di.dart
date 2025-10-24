import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/domain/settings_view_model.dart';
import 'package:mobile_study/features/settings/models/settings_model.dart';
import 'package:mobile_study/ui/theme/theme_provider.dart';

class SettingsDi {
  static final settingsViewModel =
      StateNotifierProvider<SettingsViewModel, SettingsState>((ref) {
        return SettingsViewModel(
          themeNotifier: ref.read(themeModeProvider.notifier),
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authService: ref.read(authServiceProvider),
        );
      });
}
