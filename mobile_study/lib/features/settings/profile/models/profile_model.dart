import 'dart:ui';

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/user/models/user.dart';

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
    User? user,
    bool? isMan,
    String? googleEmail,
    List<ProfileListItem?>? profileItems,
  }) = _ProfileState;
}
