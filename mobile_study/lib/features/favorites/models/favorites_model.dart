import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';

part 'favorites_model.freezed.dart';

@freezed
sealed class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(false) bool isLoading,
    List<CarCardModel>? favoritesList,
    String? errorMessage,
  }) = _FavoritesState;
}
