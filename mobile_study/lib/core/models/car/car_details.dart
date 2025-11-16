import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'car_details.g.dart';
part 'car_details.freezed.dart';

@freezed
abstract class CarDetails with _$CarDetails {
  const factory CarDetails({
    required String id,
    required String name,
    required String description,
    required bool isFavorite,
    required String location,
    required String imageUrl,
    required String pricePerDay,
  }) = _CarDetails;

  factory CarDetails.fromJson(Map<String, dynamic> json) =>
      _$CarDetailsFromJson(json);
}
