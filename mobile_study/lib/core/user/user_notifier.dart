import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/core/user/user_repository.dart';
import 'package:mobile_study/core/user/user_service.dart';

class UserNotifier extends StateNotifier<User?> {
  final IUserRepository _userRepository;

  UserNotifier(this._userRepository) : super(null);

  Future<void> loadUser({bool forceRefresh = false}) async {
    try {
      final user = await _userRepository.fetchUser(forceRefresh: forceRefresh);

      state = user;
    } catch (e) {
      debugPrint('Error loading user: ${e.toString()}');
    }
  }

  Future<void> clearUser() async {
    await _userRepository.clearUser();
    state = null;
  }

  Future<void> updateUserProfile(User user, {File? avatar}) async {
    try {
      await _userRepository.updateUser(user, avatarFile: avatar);
      await loadUser(forceRefresh: true);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUser(User user) async {
    await _userRepository.saveUser(user);
    state = user;
  }
}

class UserDi {
  static final userNotifierProvider =
      StateNotifierProvider<UserNotifier, User?>((ref) {
        return UserNotifier(ref.read(userRepositoryProvider));
      });
}
