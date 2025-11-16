import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/car_rent/models/car_rent_model.dart';

class CarRentViewModel extends StateNotifier<CarRentState> {
  final String? carId;
  final CarService carService;
  final ScaffoldMessengerManager messageManager;
  final AppNavigation navigator;

  CarRentViewModel({
    this.carId,
    required this.carService,
    required this.messageManager,
    required this.navigator,
  }) : super(const CarRentState()) {
    loadCarRent(carId);
  }

  Future<void> loadCarRent(String? id) async {
    if (id == null) {
      state = state.copyWith(error: "Неизвестный автомобиль");
      return;
    }
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null);
    final CarRent = await carService.getCarRentData(id);

    if (CarRent == null) {
      state = state.copyWith(isLoading: false, error: "Ошибка загрузки данных");
      return;
    }
    state = state.copyWith(isLoading: false, carRentData: CarRent);
  }

  void onTapRentButton() {
    if (state.isLoading) return;
    final carId = state.carRentData?.id;
    if (carId == null) {
      navigator.goBack();
      messageManager.showSnackBar("Неизвестная ошибка");
      return;
    }
    navigator.carRent(CarParams(carId: carId));
  }

  void goToHome() {
    navigator.home();
  }

  void goToSuccessfull() {
    if (state.isLoading) return;
    navigator.carSuccessful();
  }
}
