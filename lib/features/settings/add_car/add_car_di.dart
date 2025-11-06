import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/add_car/domain/add_car_view_model.dart';
import 'package:mobile_study/features/settings/add_car/models/add_car_model.dart';

class AddCarDi {
  static final addCarViewModel =
      StateNotifierProvider<AddCarViewModel, AddCarState>((ref) {
        return AddCarViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authService: ref.read(authServiceProvider),
        );
      });
}
