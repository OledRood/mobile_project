// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarHistoryModel _$CarHistoryModelFromJson(Map<String, dynamic> json) =>
    _CarHistoryModel(
      rentId: json['id'] as String,
      status: $enumDecode(_$RentStatusEnumMap, json['status']),
      name: json['name'] as String,
      startRentDate: json['start_rent_date'] as String,
      endRentDate: json['end_rent_date'] as String,
    );

Map<String, dynamic> _$CarHistoryModelToJson(_CarHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.rentId,
      'status': instance.status,
      'name': instance.name,
      'start_rent_date': instance.startRentDate,
      'end_rent_date': instance.endRentDate,
    };

const _$RentStatusEnumMap = {
  RentStatus.active: 'active',
  RentStatus.completed: 'completed',
  RentStatus.cancelled: 'cancelled',
};
