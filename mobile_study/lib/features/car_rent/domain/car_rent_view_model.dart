import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/models/car/car_rent_data.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/car_rent/domain/repositories/deposit_repository.dart';
import 'package:mobile_study/features/car_rent/models/car_rent_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CarRentViewModel extends StateNotifier<CarRentState> {
  final String? carId;
  final CarService carService;
  final ScaffoldMessengerManager messageManager;
  final AppNavigation navigator;
  final ScaffoldMessengerManager scaffoldMessengerManager;
  final DepositRepository depositRepository;

  CarRentViewModel({
    this.carId,
    required this.carService,
    required this.messageManager,
    required this.navigator,
    required this.scaffoldMessengerManager,
    required this.depositRepository,
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
    try {
      CarRentData? carRentData = await carService.getCarRentData(id);

      if (carRentData == null) {
        state = state.copyWith(
          isLoading: false,
          error: "Данные не были получены",
        );
        return;
      }

      final pricePerDay = int.tryParse(carRentData.pricePerDay) ?? 0;
      final priceOfInsurance = int.tryParse(carRentData.priceOfInsurance) ?? 0;
      final total = (pricePerDay + priceOfInsurance) * 3;

      carRentData = carRentData.copyWith(
        startRentDate: DateTime.now().toString(),
        endRentDate: DateTime.now().add(const Duration(days: 3)).toString(),
        totalPrice: total.toString(),
      );

      state = state.copyWith(
        isLoading: false,
        carRentData: carRentData,
        rentDays: 3,
      );
    } on ApiException catch (e) {
      if (e.statusCode == 409) {
        state = state.copyWith(
          isLoading: false,
          error: "Машина недоступна для аренды",
        );
        return;
      }
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Ошибка: ${e.toString()}",
      );
    }
  }

  Future<void> loadDepositInfo() async {
    state = state.copyWith(depositInfo: const AsyncValue.loading());

    try {
      final info = await depositRepository.fetchDepositRules(carId);

      state = state.copyWith(depositInfo: AsyncValue.data(info));
    } catch (e, st) {
      state = state.copyWith(depositInfo: AsyncValue.error(e, st));
    }
  }

  void updateStartDate(DateTime startDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final carRentData = state.carRentData;

    if (carRentData == null) return;

    if (startDate.isBefore(today)) {
      scaffoldMessengerManager.showSnackBar(
        "Дата начала аренды не может быть в прошлом",
      );
      return;
    }

    final endRentString = carRentData.endRentDate;
    DateTime? endDate;

    if (endRentString != null) {
      endDate = DateTime.tryParse(endRentString); // tryParse безопаснее

      if (endDate != null) {
        // Обновляем время окончания, чтобы оно совпадало со временем начала
        endDate = DateTime(
          endDate.year,
          endDate.month,
          endDate.day,
          startDate.hour,
          startDate.minute,
        );

        if (startDate.isAfter(endDate)) {
          scaffoldMessengerManager.showSnackBar(
            "Дата начала не может быть позже даты окончания",
          );
          return;
        }

        if (startDate.isAtSameMomentAs(endDate)) {
          scaffoldMessengerManager.showSnackBar(
            "Бронь на один день невозможна",
          );
          return;
        }
      }
    }

    int? rentDays;
    String? totalPrice;

    if (endDate != null) {
      final startFlat = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
      );
      final endFlat = DateTime(endDate.year, endDate.month, endDate.day);

      rentDays = endFlat.difference(startFlat).inDays;

      final price = double.tryParse(state.carRentData!.pricePerDay) ?? 0;
      final insurance =
          double.tryParse(state.carRentData!.priceOfInsurance) ?? 0;

      totalPrice = ((price + insurance) * rentDays).toInt().toString();
    }

    state = state.copyWith(
      rentDays: rentDays ?? state.rentDays,
      carRentData: state.carRentData?.copyWith(
        startRentDate: startDate.toString(),
        endRentDate: endDate?.toString() ?? state.carRentData?.endRentDate,
        totalPrice: totalPrice ?? state.carRentData?.totalPrice ?? "0",
      ),
    );
  }

  void updateEndDate(DateTime endDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final carRentData = state.carRentData;
    if (carRentData == null) return;

    if (endDate.isBefore(today)) {
      scaffoldMessengerManager.showSnackBar(
        "Дата окончания не может быть в прошлом",
      );
      return;
    }

    final startRentString = carRentData.startRentDate;
    DateTime? startDate;

    if (startRentString != null) {
      startDate = DateTime.tryParse(startRentString); // tryParse безопаснее

      if (startDate != null) {
        // Применяем время начала к дате окончания
        endDate = DateTime(
          endDate.year,
          endDate.month,
          endDate.day,
          startDate.hour,
          startDate.minute,
        );

        if (endDate.isBefore(startDate)) {
          scaffoldMessengerManager.showSnackBar(
            "Дата окончания не может быть раньше даты начала",
          );
          return;
        }

        if (endDate.isAtSameMomentAs(startDate)) {
          scaffoldMessengerManager.showSnackBar(
            "Бронь на один день невозможна",
          );
          return;
        }
      }
    }

    int? rentDays;
    String? totalPrice;

    if (startDate != null) {
      final startFlat = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
      );
      final endFlat = DateTime(endDate.year, endDate.month, endDate.day);

      rentDays = endFlat.difference(startFlat).inDays;

      final price = double.tryParse(carRentData.pricePerDay) ?? 0;
      final insurance = double.tryParse(carRentData.priceOfInsurance) ?? 0;

      totalPrice = ((price + insurance) * rentDays).toInt().toString();
    }

    state = state.copyWith(
      rentDays: rentDays ?? state.rentDays,
      carRentData: state.carRentData?.copyWith(
        endRentDate: endDate.toString(),
        totalPrice: totalPrice ?? carRentData.totalPrice,
      ),
    );
  }

  String formatRentDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return 'Выберите дату';

    try {
      final date = DateTime.parse(isoDate);

      return DateFormat('HH:mm, d MMMM yyyy', 'ru').format(date);
    } catch (e) {
      // Если пришел мусор, возвращаем как есть или пустую строку
      return isoDate;
    }
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

  Future<void> goToSuccessfull() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);

    if (state.carRentData?.startRentDate == null ||
        state.carRentData?.endRentDate == null) {
      scaffoldMessengerManager.showSnackBar("Выберите даты аренды");
      state = state.copyWith(isLoading: false);
      return;
    }

    try {
      final result = await carService.bookCar(state.carRentData!);
      if (result) {
        navigator.carSuccessful();
      }
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint("error booking car: ${e.toString()}");
      scaffoldMessengerManager.showSnackBar("Ошибка бронирования");
      return;
    }
  }

  void goBack() {
    if (state.isLoading) return;
    navigator.goBack();
  }
}
