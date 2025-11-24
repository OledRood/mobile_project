import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/auth/models/registration_data_model.dart';
import 'package:mobile_study/core/services/api_service.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(toJson: true)
sealed class User with _$User {
  const User._();

  const factory User({
    required String id,
    required String email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middle_name') String? middleName,
    String? avatar,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'is_male') bool? isMale,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'driver_license') String? driverLicense,
    @JsonKey(name: 'date_of_issue') String? dateOfIssue,
    @JsonKey(name: 'driver_license_photo') String? driverLicensePhoto,
    @JsonKey(name: 'passport_photo') String? passportPhoto,
    String? role,
    String? googleEmail,
  }) = _User;

  // Computed property для полного имени
  String get name {
    final parts = [firstName, lastName].where((p) => p != null && p.isNotEmpty);
    return parts.isEmpty ? email : parts.join(' ');
  }

  Map<String, String> get fieldsToUpdateUser {
    return {
      'first_name': firstName ?? '',
      'last_name': lastName ?? '',
      'middle_name': middleName ?? '',
      'birth_date': birthDate ?? '',
    };
  }

  String get fullAvatarUrl => "${ApiServiceDi.fullBaseUrl}/${avatar ?? ''}";

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromAuthRegistrationModel(RegistrationDataModel model) {
    return User(
      id: "",
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      middleName: model.middleName,
      avatar: model.accountPhotoFile?.path,
      createdAt: null,
      isMale: model.isMale,
      birthDate: model.birthDate,
      driverLicense: model.driverLicense,
      dateOfIssue: model.dateOfIssue,
    );
  }
}
