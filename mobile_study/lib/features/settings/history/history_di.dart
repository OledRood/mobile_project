import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/navigator_di.dart';
import 'package:mobile_study/features/settings/history/domain/history_view_model.dart';
import 'package:mobile_study/features/settings/history/models/history_model.dart';

class HistoryDi {
  static final historyViewModel =
      StateNotifierProvider<HistoryViewModel, HistoryState>((ref) {
        return HistoryViewModel(
          appNavigation: ref.read(NavigatorDi.appNavigationProvider),
        );
      });
}
