import 'dart:ui';

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_details.dart';

part 'car_details_model.freezed.dart';

@freezed
sealed class CarDetailsState with _$CarDetailsState {
  const factory CarDetailsState({
    @Default(false) bool isLoading,
    String? error,
    CarDetails? carDetails,
  }) = _CarDetailsState;
}
