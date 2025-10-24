import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/profile/domain/profile_view_model.dart';
import 'package:mobile_study/features/profile/models/profile_model.dart';

class ProfileDi {
  static final profileViewModel =
      StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
        return ProfileViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authService: ref.read(authServiceProvider),
        );
      });
}
