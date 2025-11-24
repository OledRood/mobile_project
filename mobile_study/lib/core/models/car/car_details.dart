import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/services/api_service.dart';
part 'car_details.freezed.dart';

@freezed
abstract class CarDetails with _$CarDetails {
  const factory CarDetails({
    required String id,
    required String name,
    required String mark,
    required String description,
    required bool isFavorite,
    required String location,
    required String imageUrlDetail,
    required String imageUrlCard,
    required String pricePerDay,
    required String transmission,
    required String fuel,
    required String priceOfDeposit,
    required String priceOfInsurance,
    required String status,
  }) = _CarDetails;

  factory CarDetails.fromJson(Map<String, dynamic> json) {
    return CarDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      mark: json['mark'] as String,
      description: json['description'] as String,
      isFavorite: json['is_favorite'] as bool,
      location: json['location'] as String,
      transmission: json['transmission'] as String,
      fuel: json['fuel'] as String,
      imageUrlDetail: json['detail_image_url'] != null
          ? '${ApiServiceDi.baseUrl}${json['detail_image_url']}'
          : '',
      imageUrlCard: json['image_url'] != null
          ? '${ApiServiceDi.baseUrl}${json['image_url']}'
          : '',
      pricePerDay: json['price_per_day'] as String,
      priceOfDeposit: json['price_of_deposit'] as String,
      priceOfInsurance: json['price_of_insurance'] as String,
      status: json['status'] as String,
    );
  }
}
