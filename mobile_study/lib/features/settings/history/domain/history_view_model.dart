import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/settings/history/models/history_model.dart';

class HistoryViewModel extends StateNotifier<HistoryState> {
  final AppNavigation appNavigation;

  HistoryViewModel({required this.appNavigation})
    : super(const HistoryState()) {
    getHistoryList();
  }

  final CarService _carService = CarService();

  Future<void> getHistoryList() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final historyList = await _carService.getUserRentHistory();
      state = state.copyWith(isLoading: false, historyList: historyList);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Ошибка загрузки списка: $e',
      );
    }
  }

  operDetails(String index) {
    appNavigation.carDetails(CarParams(carId: index));
  }
}
