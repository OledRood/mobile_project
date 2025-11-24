// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  middleName: json['middle_name'] as String?,
  avatar: json['avatar'] as String?,
  createdAt: json['created_at'] as String?,
  isMale: json['is_male'] as bool?,
  birthDate: json['birth_date'] as String?,
  driverLicense: json['driver_license'] as String?,
  dateOfIssue: json['date_of_issue'] as String?,
  driverLicensePhoto: json['driver_license_photo'] as String?,
  passportPhoto: json['passport_photo'] as String?,
  role: json['role'] as String?,
  googleEmail: json['googleEmail'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'middle_name': instance.middleName,
  'avatar': instance.avatar,
  'created_at': instance.createdAt,
  'is_male': instance.isMale,
  'birth_date': instance.birthDate,
  'driver_license': instance.driverLicense,
  'date_of_issue': instance.dateOfIssue,
  'driver_license_photo': instance.driverLicensePhoto,
  'passport_photo': instance.passportPhoto,
  'role': instance.role,
  'googleEmail': instance.googleEmail,
};
