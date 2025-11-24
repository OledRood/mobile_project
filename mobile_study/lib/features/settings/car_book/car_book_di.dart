import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/settings/car_book/domain/car_book_view_model.dart';
import 'package:mobile_study/features/settings/car_book/models/car_book_model.dart';

class CarBookDi {
  static final carBookViewModelProvider = StateNotifierProvider.autoDispose
      .family<CarBookViewModel, CarBookState, String>((ref, bookId) {
        return CarBookViewModel(
          carService: ref.read(CarServiceDi().carServiceProvider),
          bookId: bookId,
          messageManager: ref.read(MessageDi.scaffoldMessengerManager),
          navigator: ref.read(NavigatorDi.appNavigationProvider),
        );
      });
}
