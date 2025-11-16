// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarDetails _$CarDetailsFromJson(Map<String, dynamic> json) => _CarDetails(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  isFavorite: json['isFavorite'] as bool,
  location: json['location'] as String,
  imageUrl: json['imageUrl'] as String,
  pricePerDay: json['pricePerDay'] as String,
);

Map<String, dynamic> _$CarDetailsToJson(_CarDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isFavorite': instance.isFavorite,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'pricePerDay': instance.pricePerDay,
    };
