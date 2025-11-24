import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_study/core/constants/rent_status.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/car_details/models/car_details_model.dart';
import 'package:mobile_study/features/settings/car_book/models/car_book_model.dart';

class CarBookViewModel extends StateNotifier<CarBookState> {
  final String bookId;
  final CarService carService;
  final ScaffoldMessengerManager messageManager;
  final AppNavigation navigator;

  CarBookViewModel({
    required this.bookId,
    required this.carService,
    required this.messageManager,
    required this.navigator,
  }) : super(const CarBookState()) {
    getCarBook(bookId);
  }

  Future<void> getCarBook(String bookId) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final carBookModel = await carService.getCarBookById(bookId);

      final rentDays = countRentDays(
        carBookModel.startRentDate,
        carBookModel.endRentDate!,
      );

      state = state.copyWith(
        isLoading: false,
        carBookModel: carBookModel,
        rentDays: rentDays,
        isShowCancelButton: carBookModel.status == RentStatus.active,
      );
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
      state = state.copyWith(isLoading: false, error: "Произошла ошибка $e");
    }
  }

  String formatRentDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return 'Выберите дату';

    try {
      final date = DateTime.parse(isoDate);

      return DateFormat('HH:mm, d MMMM yyyy', 'ru').format(date);
    } catch (e) {
      return isoDate;
    }
  }

  String get formatStatusText {
    final status = state.carBookModel?.status;
    if (status == null) return "Неизвестно";

    switch (status) {
      case RentStatus.active:
        return "Активна";
      case RentStatus.completed:
        return "Завершена";
      case RentStatus.cancelled:
        return "Отменена";
    }
  }

  int countRentDays(String startIsoDate, String endIsoDate) {
    try {
      final startDate = DateTime.parse(startIsoDate);
      final endDate = DateTime.parse(endIsoDate);
      final difference = endDate.difference(startDate).inDays;
      return difference > 0 ? difference : 1;
    } catch (e) {
      return 1;
    }
  }

  void onTapCancelButton() {
    if (state.isLoading) return;
    final bookId = state.carBookModel?.id;
    if (state.carBookModel?.status != RentStatus.active) {
      messageManager.showSnackBar(
        "Бронирование не активно и не может быть отменено",
      );
      return;
    }
    if (bookId == null) {
      messageManager.showSnackBar("Не удалось получить данные бронирования");
      return;
    }
    canceledBook(bookId);
  }

  Future<void> canceledBook(bookId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final newStatus = await carService.canceledBook(bookId);
      if (newStatus != RentStatus.cancelled) {
        throw ApiException('Не удалось отменить бронирование');
      }
      state = state.copyWith(
        isLoading: false,
        carBookModel: state.carBookModel?.copyWith(status: newStatus),
        isShowCancelButton: false,
      );
      messageManager.showSnackBar("Бронирование успешно отменено");
      navigator.goBack();
    } on ApiException catch (e) {
      messageManager.showSnackBar("Ошибка отмены бронирования: ${e.message}");
      return;
    } catch (e) {
      messageManager.showSnackBar(
        "Произошла ошибка при отмене бронирования: $e",
      );
      return;
    }
  }
}
