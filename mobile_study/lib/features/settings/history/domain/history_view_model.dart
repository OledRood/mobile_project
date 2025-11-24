import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/constants/rent_status.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/settings/history/models/history_model.dart';

class HistoryViewModel extends StateNotifier<HistoryState> {
  final AppNavigation appNavigation;
  final CarService _carService;

  HistoryViewModel({
    required this.appNavigation,
    required CarService carService,
  }) : _carService = carService,
       super(const HistoryState()) {
    getHistoryList();
  }

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

  String getDateString(int id) {
    final item = state.historyList?[id];
    if (item == null) return '';
    if (item.status == RentStatus.active) {
      return "Начало аренды: ${item.startRentDate}";
    }
    return "Аренда завершена: ${item.endRentDate}";
  }

  operDetails(String rentId) {
    appNavigation.carBook(BookParams(bookId: rentId));
  }
}
