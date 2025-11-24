// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistrationDataModel _$RegistrationDataModelFromJson(
  Map<String, dynamic> json,
) => _RegistrationDataModel(
  email: json['email'] as String,
  password: json['password'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  middleName: json['middleName'] as String?,
  birthDate: json['birthDate'] as String?,
  isMale: json['isMale'] as bool?,
  driverLicense: json['driverLicense'] as String?,
  dateOfIssue: json['dateOfIssue'] as String?,
);

Map<String, dynamic> _$RegistrationDataModelToJson(
  _RegistrationDataModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'middleName': instance.middleName,
  'birthDate': instance.birthDate,
  'isMale': instance.isMale,
  'driverLicense': instance.driverLicense,
  'dateOfIssue': instance.dateOfIssue,
};
