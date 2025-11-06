import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_car_model.freezed.dart';

@freezed
sealed class AddCarState with _$AddCarState {
  const factory AddCarState({@Default(false) bool isLoading}) = _AddCarState;
}
