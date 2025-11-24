import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/constants/app_endpoints.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:mobile_study/core/user/user_service.dart';

abstract class IUserRepository {
  Future<User?> fetchUser({bool forceRefresh = false});
  Future<void> saveUser(User user);
  Future<void> clearUser();
  Future<void> updateUser(User user, {File? avatarFile});
}

class UserRepository implements IUserRepository {
  final ApiService apiService;
  final UserService userService;

  UserRepository(this.apiService, this.userService);

  @override
  Future<User?> fetchUser({bool forceRefresh = false}) async {
    try {
      if (!forceRefresh) {
        final cachedUser = await userService.getUser();
        if (cachedUser != null) {
          return cachedUser;
        }
      }

      final data = await apiService.get(AppEndpoints.usersMe);

      final user = User.fromJson(data);
      await userService.saveUser(user);

      return user;
    } catch (e) {
      debugPrint('Error fetching user from API: ${e.toString()}');
      if (forceRefresh) {
        return await userService.getUser();
      }
      return null;
    }
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      final data = await apiService.post(AppEndpoints.usersMe, user.toJson());
      final newUser = User.fromJson(data);
      await userService.saveUser(newUser);
    } catch (e) {
      debugPrint('Error saving user: ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<void> clearUser() {
    return userService.clearUser();
  }

  @override
  Future<void> updateUser(User user, {File? avatarFile}) async {
    try {
      final Map<String, dynamic> fields = user.fieldsToUpdateUser;

      final Map<String, File?> files = {};
      if (avatarFile != null) {
        files['avatar'] = avatarFile;
      }

      await apiService.putMultipart(
        AppEndpoints.usersMe,
        fields: fields,
        files: files,
      );
    } catch (e) {
      rethrow;
    }
  }
}

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return UserRepository(
    ref.read(ApiServiceDi.apiServiceProvider),
    ref.read(userServiceProvider),
  );
});
