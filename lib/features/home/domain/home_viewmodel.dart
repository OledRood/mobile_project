import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/features/home/models/home_model.dart';
import 'package:mobile_study/features/home/models/search_result_model.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final AppNavigation appNavigation;
  final AuthService authService;

  HomeViewModel({required this.appNavigation, required this.authService})
    : super(const HomeState()) {
    init();
  }

  TextEditingController searchController = TextEditingController();

  Future<void> init() async {
    await _getInitResultList();
  }

  Future<void> _getInitResultList() async {
    await Future.delayed(const Duration(seconds: 2));
    final searchResults = List.generate(
      3,
      (index) => SearchResultModel.mockedData(index),
    );

    state = state.copyWith(searchResults: searchResults);
  }

  Future<void> onSearchTextSubmitted() async {
    debugPrint("onSearchTextSubmitted: ${searchController.text}");
    if (state.isLoading) return;
    state = state.copyWith(
      isLoading: true,
      searchResults: null,
      viewState: HomeViewState.loading,
      errorMessage: null,
    );
    appNavigation.loader();
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      isLoading: false,
      viewState: HomeViewState.searchResults,
      searchResults: List.generate(
        5,
        (index) => SearchResultModel.mockedData(index),
      ),
    );
    appNavigation.searchResults();
  }

  void onBorrowButtonPressed(String id) {
    debugPrint("Забронировано элемент с id: $id");
  }

  void onDetailButtonPressed(String id) {
    debugPrint("Показать детали для элемента с id: $id");
  }
}
