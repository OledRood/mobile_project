import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/home/models/home_model.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final AppNavigation appNavigation;
  final AuthService authService;

  HomeViewModel({required this.appNavigation, required this.authService})
    : super(const HomeState()) {
    init();
  }

  final CarService carService = CarService();

  TextEditingController searchController = TextEditingController();

  Future<void> init() async {
    await _getInitResultList();
  }

  Future<void> _getInitResultList() async {
    final searchResults = await carService.getHomeRecommendations();

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
    final searchResults = await carService.getSearchResutls(
      searchController.text,
    );

    state = state.copyWith(
      isLoading: false,
      viewState: HomeViewState.searchResults,
      searchResults: searchResults,
    );

    appNavigation.searchResults();
  }
}
