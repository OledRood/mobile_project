import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_data_model.freezed.dart';
part 'registration_data_model.g.dart';

@freezed
sealed class RegistrationDataModel with _$RegistrationDataModel {
  const factory RegistrationDataModel({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? middleName,
    String? birthDate,
    bool? isMale,
    String? driverLicense,
    String? dateOfIssue,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? driverLicenseFile,
    @JsonKey(includeFromJson: false, includeToJson: false) File? passportFile,
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? accountPhotoFile,
  }) = _RegistrationDataModel;

  factory RegistrationDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataModelFromJson(json);
}

final registrationDataProvider = StateProvider<RegistrationDataModel?>(
  (ref) => null,
);
