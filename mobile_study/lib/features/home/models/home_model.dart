import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';

part 'home_model.freezed.dart';

enum HomeViewState { initial, loading, searchResults }

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    List<CarCardModel>? searchResults,
    List<CarCardModel>? recommendations,
    @Default(false) bool isShowSearchButton,
    String? errorMessage,
    @Default(HomeViewState.initial) HomeViewState viewState,
  }) = _HomeState;
}
