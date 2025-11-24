import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/add_car/domain/add_car_flow_notifier.dart';
import 'package:mobile_study/features/settings/add_car/models/add_car_state.dart';
import 'package:mobile_study/features/settings/add_car/view/become_host_screen.dart';

class AddCarDi {
  // static final addCarFlowProvider =
  //     NotifierProvider.autoDispose<AddCarFlowNotifier, AddCarState>(
  //       () => AddCarFlowNotifier(
  //         navigation: NavigatorDi.appNavigationProvider.read(ref.read(NavigatorDi.appNavigationProvider),
  //       ),
  //     );

  static final addCarFlowProvider =
      NotifierProvider.autoDispose<AddCarFlowNotifier, AddCarState>(
        AddCarFlowNotifier.new,
      );
}
