import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_study/core/constants/rent_status.dart';

part 'car_history_model.freezed.dart';
part 'car_history_model.g.dart';

@freezed
sealed class CarHistoryModel with _$CarHistoryModel {
  const CarHistoryModel._();

  const factory CarHistoryModel({
    @JsonKey(name: "id") required String rentId,
    required RentStatus status,
    required String name,
    @JsonKey(name: "start_rent_date") required String startRentDate,
    @JsonKey(name: "end_rent_date") required String endRentDate,
  }) = _CarHistoryModel;

  factory CarHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$CarHistoryModelFromJson(json);
}
