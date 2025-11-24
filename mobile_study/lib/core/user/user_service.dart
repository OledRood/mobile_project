import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/user/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _userKey = 'user_data';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;

    try {
      return User.fromJson(jsonDecode(jsonString));
    } catch (e) {
      await prefs.remove(_userKey);
      return null;
    }
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}

final userServiceProvider = Provider<UserService>((ref) => UserService());
