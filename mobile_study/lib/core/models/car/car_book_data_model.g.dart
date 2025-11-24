// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_book_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarBookDataModel _$CarBookDataModelFromJson(Map<String, dynamic> json) =>
    _CarBookDataModel(
      id: json['id'] as String,
      carCardModel: CarCardModel.fromJson(json['car'] as Map<String, dynamic>),
      startRentDate: json['start_rent_date'] as String,
      endRentDate: json['end_rent_date'] as String,
      adress: json['location'] as String,
      priceOfInsurance: json['price_of_insurance'] as String,
      totalPrice: json['total_price'] as String,
      driverName: json['driver_name'] as String,
      driverLicenseNumber: json['driver_license_number'] as String,
      status: $enumDecode(_$RentStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$CarBookDataModelToJson(_CarBookDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car': instance.carCardModel,
      'start_rent_date': instance.startRentDate,
      'end_rent_date': instance.endRentDate,
      'location': instance.adress,
      'price_of_insurance': instance.priceOfInsurance,
      'total_price': instance.totalPrice,
      'driver_name': instance.driverName,
      'driver_license_number': instance.driverLicenseNumber,
      'status': instance.status,
    };

const _$RentStatusEnumMap = {
  RentStatus.active: 'active',
  RentStatus.completed: 'completed',
  RentStatus.cancelled: 'cancelled',
};
