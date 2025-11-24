import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/services/api_service.dart';

part 'car_card_model.freezed.dart';

@freezed
sealed class CarCardModel with _$CarCardModel {
  const CarCardModel._();

  const factory CarCardModel({
    required String id,
    required String name,
    required String mark,
    required String pricePerDay,
    required String transmission,
    required String fuel,
    required String? image,
  }) = _CarCardModel;

  factory CarCardModel.fromJson(Map<String, dynamic> json) {
    return CarCardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      mark: json['mark'] as String,
      pricePerDay: json['price_per_day'] as String,
      transmission: json['transmission'] as String,
      fuel: json['fuel'] as String,
      image: json['image_url'] != null
          ? '${ApiServiceDi.baseUrl}${json['image_url']}'
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mark': mark,
      'price_per_day': pricePerDay,
      'transmission': transmission,
      'fuel': fuel,
      'image_url': image?.replaceFirst(ApiServiceDi.baseUrl, ''),
    };
  }
}
