// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  avatar: json['avatar'] as String?,
  createdAt: json['createdAt'] as String?,
  isMan: json['isMan'] as bool?,
  birthDate: json['birthDate'] as String?,
  driverLicense: json['driverLicense'] as String?,
  dateOfIssue: json['dateOfIssue'] as String?,
  googleEmail: json['googleEmail'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'avatar': instance.avatar,
  'createdAt': instance.createdAt,
  'isMan': instance.isMan,
  'birthDate': instance.birthDate,
  'driverLicense': instance.driverLicense,
  'dateOfIssue': instance.dateOfIssue,
  'googleEmail': instance.googleEmail,
};
