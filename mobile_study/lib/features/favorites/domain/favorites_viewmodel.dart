import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/favorites/models/favorites_model.dart';
import 'package:mobile_study/features/home/models/home_model.dart';

class FavoritesViewModel extends StateNotifier<FavoritesState> {
  final AppNavigation appNavigation;
  final AuthService authService;
  final CarService carService;

  FavoritesViewModel({
    required this.appNavigation,
    required this.authService,
    required this.carService,
  }) : super(const FavoritesState()) {
    init();
  }

  Future<void> init() async {
    await _getFavoritesList();
  }

  Future<void> refresh() async {
    await _getFavoritesList();
  }

  Future<void> _getFavoritesList() async {
    state = state.copyWith(isLoading: true);
    try {
      final favoritesList = await carService.getFavorites();
      if (favoritesList == null || favoritesList.isEmpty) {
        state = state.copyWith(
          errorMessage: "Список избранных автомобилей пуст",
          isLoading: false,
        );
        return;
      }
      state = state.copyWith(favoritesList: favoritesList, isLoading: false);
    } on ApiException catch (e) {
      state = state.copyWith(errorMessage: e.message, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Произошла ошибка при загрузке избранного",
        isLoading: false,
      );
    }
  }

  Future<void> onDetailsButtonPressed(String id) async {
    appNavigation.carDetails(CarParams(carId: id));
  }

  Future<void> onRentButtonPressed(String id) async {
    appNavigation.carRent(CarParams(carId: id));
  }
}
