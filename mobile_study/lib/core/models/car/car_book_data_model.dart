import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/constants/rent_status.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';
import 'package:mobile_study/core/models/car/car_details.dart';

part 'car_book_data_model.g.dart';
part 'car_book_data_model.freezed.dart';

@freezed
sealed class CarBookDataModel with _$CarBookDataModel {
  const CarBookDataModel._();

  const factory CarBookDataModel({
    required String id,
    @JsonKey(name: "car") required CarCardModel carCardModel,
    @JsonKey(name: "start_rent_date") required String startRentDate,
    @JsonKey(name: "end_rent_date") required String endRentDate,
    @JsonKey(name: "location") required String adress,
    @JsonKey(name: "price_of_insurance") required String priceOfInsurance,
    @JsonKey(name: "total_price") required String totalPrice,
    @JsonKey(name: "driver_name") required String driverName,
    @JsonKey(name: "driver_license_number") required String driverLicenseNumber,
    @JsonEnum() required RentStatus status,
  }) = _CarBookDataModel;

  factory CarBookDataModel.fromJson(Map<String, dynamic> json) =>
      _$CarBookDataModelFromJson(json);
}
