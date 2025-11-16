import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_data_model.freezed.dart';

@freezed
sealed class RegistrationDataModel with _$RegistrationDataModel {
  const factory RegistrationDataModel({
    required String email,
    required String password,
    String? lastName,
    String? firstName,
    String? middleName,
    String? birthDate,
    bool? isMale,
    String? driverLicense,
    String? dateOfIssue,
    File? driverLicenseFile,
    File? passportFile,
    File? accountPhotoFile,
  }) = _RegistrationDataModel;
}

final registrationDataProvider = StateProvider<RegistrationDataModel?>((ref) {
  return null;
});
