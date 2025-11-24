import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/models/car/car_card_model.dart';
import 'package:mobile_study/core/models/car/car_details.dart';

part 'car_rent_data.g.dart';
part 'car_rent_data.freezed.dart';

@freezed
sealed class CarRentData with _$CarRentData {
  const CarRentData._();

  const factory CarRentData({
    required String id,
    required String autoName,
    required String autoMark,
    required CarCardModel carCardModel,
    required String pricePerDay,
    required String? startRentDate,
    required String? endRentDate,
    required String adress,
    required String priceOfInsurance,
    required String totalPrice,
    required String priceOfDeposit,
    String? driverName,
    String? driverLicenseNumber,
    required String status,
  }) = _CarRentData;

  factory CarRentData.fromJson(Map<String, dynamic> json) =>
      _$CarRentDataFromJson(json);

  factory CarRentData.fromDetails(CarDetails carDetails) {
    return CarRentData(
      id: carDetails.id,
      autoName: carDetails.name,
      autoMark: carDetails.mark,
      carCardModel: CarCardModel(
        id: carDetails.id,
        name: carDetails.name,
        mark: carDetails.mark,
        pricePerDay: carDetails.pricePerDay,
        transmission: carDetails.transmission,
        fuel: carDetails.fuel,
        image: carDetails.imageUrlCard,
      ),
      pricePerDay: carDetails.pricePerDay,
      startRentDate: null,
      endRentDate: null,
      adress: carDetails.location,
      priceOfInsurance: carDetails.priceOfInsurance,
      totalPrice: "0",
      status: carDetails.status,
      priceOfDeposit: carDetails.priceOfDeposit,
    );
  }
  Map<String, String> get getFieldsForBooking {
    final start = DateTime.parse(startRentDate!);
    final end = DateTime.parse(endRentDate!);
    final startDateFormatted =
        "${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}";
    final endDateFormatted =
        "${end.year}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}";

    return {
      "start_rent_date": startDateFormatted,
      "end_rent_date": endDateFormatted,
      "price_of_insurance": priceOfInsurance,
      "total_price": totalPrice,
      "price_of_deposit": priceOfDeposit,
    };
  }
}
