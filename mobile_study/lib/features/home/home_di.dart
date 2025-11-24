import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/home/domain/home_viewmodel.dart';
import 'package:mobile_study/features/home/models/home_model.dart';

class HomeDi {
  static final homeViewModel = StateNotifierProvider<HomeViewModel, HomeState>((
    ref,
  ) {
    return HomeViewModel(
      appNavigation: ref.read(NavigatorDi.appNavigationProvider),
      authService: ref.read(authServiceProvider),
      carService: ref.read(CarServiceDi().carServiceProvider),
    );
  });
}
