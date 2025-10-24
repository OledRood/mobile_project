import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/features/home/models/search_result_model.dart';

part 'home_model.freezed.dart';

enum HomeViewState { initial, loading, searchResults }

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    List<SearchResultModel>? searchResults,
    String? errorMessage,
    @Default(HomeViewState.initial) HomeViewState viewState,
  }) = _HomeState;
}
