import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_history_model.dart';

part 'history_model.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(false) bool isLoading,
    List<CarHistoryModel>? historyList,
    String? errorMessage,
  }) = _HistoryState;
}
