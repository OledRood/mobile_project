import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
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
    final carDetails = await carService.getCarDetails(id);

    if (carDetails == null) {
      state = state.copyWith(isLoading: false, error: "Ошибка загрузки данных");
      return;
    }
    state = state.copyWith(isLoading: false, carDetails: carDetails);
  }

  Future<void> addToFavorite() async {
    if (state.isLoading) return;
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
