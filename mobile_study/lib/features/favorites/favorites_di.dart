import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/favorites/domain/favorites_viewmodel.dart';
import 'package:mobile_study/features/favorites/models/favorites_model.dart';

class FavoritesDi {
  static final favoritesViewModel =
      StateNotifierProvider<FavoritesViewModel, FavoritesState>((ref) {
        return FavoritesViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          authService: ref.read(authServiceProvider),
          carService: ref.read(CarServiceDi().carServiceProvider),
        );
      });
}
