import 'dart:ui';

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_book_data_model.dart';
import 'package:mobile_study/core/models/car/car_details.dart';

part 'car_book_model.freezed.dart';

@freezed
sealed class CarBookState with _$CarBookState {
  const factory CarBookState({
    @Default(false) bool isLoading,
    String? error,
    @Default(1) int rentDays,
    CarBookDataModel? carBookModel,
    @Default(false) bool isShowCancelButton,
  }) = _CarBookState;
}
