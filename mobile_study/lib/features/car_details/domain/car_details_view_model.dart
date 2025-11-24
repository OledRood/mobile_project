import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/car_details/models/car_details_model.dart';

class CarDetailsViewModel extends StateNotifier<CarDetailsState> {
  final String carId;
  final CarService carService;
  final ScaffoldMessengerManager messageManager;
  final AppNavigation navigator;

  CarDetailsViewModel({
    required this.carId,
    required this.carService,
    required this.messageManager,
    required this.navigator,
  }) : super(const CarDetailsState()) {
    loadCarDetails(carId);
  }

  Future<void> loadCarDetails(String id) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final carDetails = await carService.getCarDetails(id);

      if (carDetails == null) {
        state = state.copyWith(
          isLoading: false,
          error: "Ошибка загрузки данных",
        );
        return;
      }
      state = state.copyWith(isLoading: false, carDetails: carDetails);
    } on ApiException catch (e) {
      if (e.statusCode == 409) {
        state = state.copyWith(
          isLoading: false,
          error: "Машина недоступна для аренды",
        );
        return;
      }
      state = state.copyWith(
        isLoading: false,
        error: "Ошибка загрузки данных: ${e.message}",
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Произошла ошибка при загрузке данных",
      );
    }
  }

  Future<void> addToFavorite() async {
    if (state.isLoading) return;
    debugPrint("Old favorite status: ${state.carDetails?.isFavorite}");
    try {
      final newFavoriteStatus = await carService.setNewFavoriteStatus(
        state.carDetails!.id,
        !(state.carDetails!.isFavorite),
      );
      if (newFavoriteStatus == null) {
        messageManager.showSnackBar("Ошибка добавления в избранное");
        return;
      }
      state = state.copyWith(
        carDetails: state.carDetails!.copyWith(isFavorite: newFavoriteStatus),
      );
      debugPrint("New favorite status: ${state.carDetails?.isFavorite}");
    } catch (e) {
      messageManager.showSnackBar("Ошибка добавления в избранное: $e");
    }
  }

  void onTapRentButton() {
    if (state.isLoading) return;
    final carId = state.carDetails?.id;
    if (carId == null) {
      navigator.goBack();
      messageManager.showSnackBar("Неизвестная ошибка");
      return;
    }
    navigator.carRent(CarParams(carId: carId));
  }
}
