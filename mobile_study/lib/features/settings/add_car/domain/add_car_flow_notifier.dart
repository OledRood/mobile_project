import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/message/scaffold_messenger_manager.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/settings/add_car/models/add_car_state.dart';
import 'package:mobile_study/features/settings/add_car/models/transmition_type.dart';

class AddCarFlowNotifier extends AutoDisposeNotifier<AddCarState> {
  AppNavigation get _navigation => ref.read(NavigatorDi.appNavigationProvider);
  ScaffoldMessengerManager get scaffoldMessenger =>
      ref.read(MessageDi.scaffoldMessengerManager);

  CarService get _carService => ref.read(CarServiceDi().carServiceProvider);

  @override
  AddCarState build() {
    ref.keepAlive();
    return const AddCarState();
  }

  // Step 0
  void submitBecomeHost() {
    _navigation.addCarStep1();
  }

  // Step 1
  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void submitStep1() {
    if (state.address != null && state.address!.isNotEmpty ||
        state.address!.length > 3) {
      _navigation.addCarStep2();
    }
  }

  // Step 2
  void setDetails({
    required int year,
    required String make,
    required String model,
    required TransmissionType transmission,
    required int mileage,
    String? description,
  }) {
    state = state.copyWith(
      year: year,
      mark: make,
      model: model,
      transmission: transmission,
      mileage: mileage,
      description: description,
    );
  }

  void setDetailsYear(String yearStr) {
    final year = int.tryParse(yearStr);
    state = state.copyWith(year: year);
  }

  bool isYearValid(String yearStr) {
    final year = int.tryParse(yearStr);
    if (year == null) return false;
    return year >= 1990 && year <= DateTime.now().year;
  }

  void setDetailsMark(String mark) {
    state = state.copyWith(mark: mark);
  }

  void setDetailsModel(String model) {
    state = state.copyWith(model: model);
  }

  void setDetailsMeleage(String mileageStr) {
    final mileage = int.tryParse(mileageStr);
    if (mileage == null) return;
    state = state.copyWith(mileage: mileage);
  }

  void setDetailsTransmission(TransmissionType? value) {
    if (value == null) return;
    state = state.copyWith(transmission: value);
  }

  void setDetailsDescription(String description) {
    state = state.copyWith(description: description);
  }

  void submitStep2() {
    if (state.isStep2Valid) {
      _navigation.addCarPhoto();
    }
  }

  // Step 3
  void addPhoto(String path) {
    state = state.copyWith(photos: [...state.photos, path]);
    debugPrint(state.photos.toString());
  }

  void removePhoto(String path) {
    state = state.copyWith(
      photos: state.photos.where((p) => p != path).toList(),
    );
  }

  void makeMainPhoto(String path) {
    final currentPhotos = List<String>.from(state.photos);
    if (currentPhotos.indexOf(path) == 0) return;
    currentPhotos.remove(path);
    currentPhotos.insert(0, path);
    state = state.copyWith(photos: currentPhotos);
  }

  // Final Submit
  Future<void> submitCar() async {
    if (state.isLoading) return;
    if ((!state.isPhotosValid) ||
        (!state.isStep1Valid) ||
        (!state.isStep2Valid)) {
      scaffoldMessenger.showSnackBar(
        "Пожалуйста, заполните все необходимые данные перед отправкой.",
      );
      return;
    }
    try {
      state = state.copyWith(isLoading: true);
      await _carService.createCar({
        'address': state.address!,
        'year': state.year!,
        'mark': state.mark!,
        'model': state.model!,
        'transmission': state.transmission.toString(),
        'mileage': state.mileage!,
        'description': state.description ?? '',
      }, state.photos);
      state = state.copyWith(isLoading: false);
      _navigation.addCarSuccessful();
      clear();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint("Error: ${e.toString()}");
      scaffoldMessenger.showSnackBar(
        "Произошла ошибка при создании автомобиля. ${e.toString()}",
      );
    }
  }

  void goToHome() {
    _navigation.home();
  }

  void clear() {
    state = const AddCarState();
  }
}

final addCarFlowProvider =
    NotifierProvider.autoDispose<AddCarFlowNotifier, AddCarState>(
      AddCarFlowNotifier.new,
    );
