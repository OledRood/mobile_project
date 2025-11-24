import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/car_details/domain/car_details_view_model.dart';
import 'package:mobile_study/features/car_details/models/car_details_model.dart';

class CarDetailsDi {
  static final carDetailsViewModelProvider = StateNotifierProvider.autoDispose
      .family<CarDetailsViewModel, CarDetailsState, String>((ref, carId) {
        return CarDetailsViewModel(
          carService: ref.read(CarServiceDi().carServiceProvider),
          carId: carId,
          messageManager: ref.read(MessageDi.scaffoldMessengerManager),
          navigator: ref.read(NavigatorDi.appNavigationProvider),
        );
      });
}
