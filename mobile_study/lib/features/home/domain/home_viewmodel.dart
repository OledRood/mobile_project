import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_study/core/auth/auth_service.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';
import 'package:mobile_study/core/navigation/app_navigation.dart';
import 'package:mobile_study/core/navigation/navigation_params.dart';
import 'package:mobile_study/core/services/api_service.dart';
import 'package:mobile_study/core/services/car_service.dart';
import 'package:mobile_study/features/home/models/home_model.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final AppNavigation appNavigation;
  final AuthService authService;
  final CarService carService;

  HomeViewModel({
    required this.appNavigation,
    required this.authService,
    required this.carService,
  }) : super(const HomeState()) {
    init();
  }

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> init() async {
    await _getRecommendations();
  }

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true, searchResults: null);
    await _getRecommendations();
  }

  Future<void> _getRecommendations() async {
    try {
      final recommendations = await carService.getHomeRecommendations();
      for (var car in recommendations) {
        debugPrint("  - ${car.name}: ${car.image}");
      }
      state = state.copyWith(
        recommendations: recommendations,
        isLoading: false,
      );
    } on ApiException catch (e) {
      if (e.statusCode == 400) {
        state = state.copyWith(isLoading: false, errorMessage: e.message);
        appNavigation.noConnection();
        return;
      }
    } catch (e) {
      debugPrint("Error: $e");
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> onDetailsButtonPressed(String id) async {
    appNavigation.carDetails(CarParams(carId: id));
  }

  Future<void> onRentButtonPressed(String id) async {
    appNavigation.carRent(CarParams(carId: id));
  }

  Future<void> onSearchTextChanged() async {
    if (searchController.text.isEmpty) {
      state = state.copyWith(isShowSearchButton: false);
    } else {
      state = state.copyWith(isShowSearchButton: true);
    }
  }

  Future<void> onSearchTextSubmitted() async {
    if (searchController.text.isEmpty) return;
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
