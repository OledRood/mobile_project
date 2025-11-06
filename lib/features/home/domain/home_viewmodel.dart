import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
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

  Future<void> onDetailsButtonPressed(String id) async {
    appNavigation.carDetails(CarParams(carId: id));
  }

  Future<void> onRentButtonPressed(String id) async {
    appNavigation.carRent(CarParams(carId: id));
  }

  Future<void> onSearchTextSubmitted() async {
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
}
