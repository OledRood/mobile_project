import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/features/settings/add_car/models/add_car_model.dart';

class AddCarViewModel extends StateNotifier<AddCarState> {
  final AppNavigation appNavigation;
  final AuthService authService;

  AddCarViewModel({required this.appNavigation, required this.authService})
    : super(const AddCarState());
}
