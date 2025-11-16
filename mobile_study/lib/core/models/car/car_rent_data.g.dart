// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_rent_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarRentData _$CarRentDataFromJson(Map<String, dynamic> json) => _CarRentData(
  id: json['id'] as String,
  autoName: json['autoName'] as String,
  autoMark: json['autoMark'] as String,
  pricePerDay: json['pricePerDay'] as String,
  startRentDate: json['startRentDate'] as String,
  endRentDate: json['endRentDate'] as String,
  adress: json['adress'] as String,
  priceOfInsurance: json['priceOfInsurance'] as String,
  totalPrice: json['totalPrice'] as String,
  priceOfDeposit: json['priceOfDeposit'] as String,
  transmission: json['transmission'] as String,
  fuel: json['fuel'] as String,
  image: json['image'] as String,
  driverName: json['driverName'] as String?,
  driverLicenseNumber: json['driverLicenseNumber'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$CarRentDataToJson(_CarRentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'autoName': instance.autoName,
      'autoMark': instance.autoMark,
      'pricePerDay': instance.pricePerDay,
      'startRentDate': instance.startRentDate,
      'endRentDate': instance.endRentDate,
      'adress': instance.adress,
      'priceOfInsurance': instance.priceOfInsurance,
      'totalPrice': instance.totalPrice,
      'priceOfDeposit': instance.priceOfDeposit,
      'transmission': instance.transmission,
      'fuel': instance.fuel,
      'image': instance.image,
      'driverName': instance.driverName,
      'driverLicenseNumber': instance.driverLicenseNumber,
      'status': instance.status,
    };
