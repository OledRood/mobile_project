import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data_model.freezed.dart';

@freezed
sealed class AuthDataModel with _$AuthDataModel {
  const factory AuthDataModel({
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
  }) = _AuthDataModel;
}

final authDataProvider = StateProvider<AuthDataModel?>((ref) {
  return null;
});
