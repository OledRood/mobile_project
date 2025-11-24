import 'dart:ui';

// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_details.dart';
import 'package:mobile_study/core/models/car/car_rent_data.dart';

part 'car_rent_model.freezed.dart';

@freezed
sealed class CarRentState with _$CarRentState {
  const factory CarRentState({
    @Default(false) bool isLoading,
    String? error,
    CarRentData? carRentData,
    @Default(1) int rentDays,
    @Default(AsyncValue.data('')) AsyncValue<String> depositInfo,
  }) = _CarRentState;
}
