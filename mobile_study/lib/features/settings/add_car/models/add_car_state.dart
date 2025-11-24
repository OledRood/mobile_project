import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/features/settings/add_car/models/transmition_type.dart';

part "add_car_state.freezed.dart";

@freezed
sealed class AddCarState with _$AddCarState {
  const AddCarState._();

  const factory AddCarState({
    String? address,
    int? year,
    String? mark,
    String? model,
    TransmissionType? transmission,
    int? mileage,
    String? description,
    @Default([]) List<String> photos,
    @Default(false) bool isLoading,
  }) = _AddCarState;

  bool get isStep1Valid {
    final addr = address ?? '';
    return addr.isNotEmpty && addr.length > 3;
  }

  bool get isStep2Valid {
    final year = this.year;
    final yearValid =
        year != null && year >= 1990 && year <= DateTime.now().year;

    return (yearValid) &&
        (mark?.isNotEmpty == true) &&
        (model?.isNotEmpty == true) &&
        (transmission != null) &&
        (mileage != null);
  }

  bool get isPhotosValid => photos.isNotEmpty;
}
