import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

class ProfileListItem {
  final String title;
  final String subtitle;

  final VoidCallback onTap;

  ProfileListItem({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    String? accountPhoto,
    String? userName,
    String? userEmail,
    bool? isMan,
    String? googleEmail,
    String? dateOfCreation,
    List<ProfileListItem?>? profileItems,
  }) = _ProfileState;
}
