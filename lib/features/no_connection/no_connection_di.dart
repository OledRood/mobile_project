import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/no_connection/no_connection_viewmodel.dart';

class NoConnectionDi {
  static final noConnectionViewModel =
      StateNotifierProvider<NoConnectionViewModel, void>((ref) {
        return NoConnectionViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
          ref: ref,
        );
      });
}
