import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_rent_data.g.dart';
part 'car_rent_data.freezed.dart';

@freezed
abstract class CarRentData with _$CarRentData {
  const factory CarRentData({
    required String id,
    required String autoName,
    required String autoMark,
    required String pricePerDay,
    required String startRentDate,
    required String endRentDate,
    required String adress,
    required String priceOfInsurance,
    required String totalPrice,
    required String priceOfDeposit,
    required String transmission,
    required String fuel,
    required String image,
    String? driverName,
    String? driverLicenseNumber,
    String? status,
  }) = _CarRentData;

  factory CarRentData.fromJson(Map<String, dynamic> json) =>
      _$CarRentDataFromJson(json);
}
