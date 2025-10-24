import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/ui/theme/models/app_icons.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';
import 'package:mobile_study/ui/widgets/custom_icon.dart';

part 'settings_model.freezed.dart';

class SettingListItem {
  final String title;
  final String iconPath;
  final bool isSvg;
  final VoidCallback onTap;

  SettingListItem({
    required this.title,
    required this.iconPath,
    this.isSvg = true,
    required this.onTap,
  });
}

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    String? profileImage,
    String? userName,
    String? userEmail,
    @Default(false) bool isLoading,
    @Default([]) List<SettingListItem?> settingsItems,
  }) = _SettingsState;
}
