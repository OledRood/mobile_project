import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/message/message_di.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/car_rent/domain/car_rent_view_model.dart';
import 'package:mobile_study/features/car_rent/domain/repositories/deposit_repository.dart';
import 'package:mobile_study/features/car_rent/domain/repositories/deposit_repository_impl.dart';
import 'package:mobile_study/features/car_rent/models/car_rent_model.dart';

class CarRentDi {
  static final carRentViewModelProvider = StateNotifierProvider.autoDispose
      .family<CarRentViewModel, CarRentState, String?>((ref, carId) {
        return CarRentViewModel(
          depositRepository: ref.watch(depositRepositoryProvider),
          carService: ref.read(CarServiceDi().carServiceProvider),
          carId: carId,
          messageManager: ref.read(MessageDi.scaffoldMessengerManager),
          navigator: ref.read(NavigatorDi.appNavigationProvider),
          scaffoldMessengerManager: ref.read(
            MessageDi.scaffoldMessengerManager,
          ),
        );
      });
  static final depositRepositoryProvider = Provider<DepositRepository>((ref) {
    return DepositRepositoryImpl();
  });
  static final depositRulesProvider = FutureProvider.autoDispose<String>((
    ref,
  ) async {
    final repo = ref.watch(depositRepositoryProvider);
    return repo.fetchDepositRules(null);
  });
}
