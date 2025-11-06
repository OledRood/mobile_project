import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';

class HistoryViewModel extends StateNotifier<void> {
  final AppNavigation appNavigation;

  HistoryViewModel({required this.appNavigation}) : super(null);
}
