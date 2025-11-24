import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';

part 'settings_model.freezed.dart';

class SettingListItem {
  final String title;
  final dynamic icon;
  final VoidCallback onTap;

  SettingListItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    User? user,
    @Default(false) bool isLoading,
    @Default([]) List<SettingListItem?> settingsItems,
  }) = _SettingsState;
}
