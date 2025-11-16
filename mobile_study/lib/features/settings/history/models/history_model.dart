import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';
import 'package:mobile_study/core/models/car/car_rent_data.dart';

part 'history_model.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(false) bool isLoading,
    List<CarRentData>? historyList,
    String? errorMessage,
  }) = _HistoryState;
}
