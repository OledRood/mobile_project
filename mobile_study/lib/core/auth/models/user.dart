import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_study/core/auth/models/registration_data_model.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? avatar,
    String? createdAt,
    bool? isMan,
    String? birthDate,
    String? driverLicense,
    String? dateOfIssue,
    String? googleEmail,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromAuthRegistrationModel(RegistrationDataModel model) {
    return User(
      id: "",
      email: model.email,
      name: "${model.firstName ?? "Имя"} ${model.lastName ?? "Пользователя"}",
      avatar: model.accountPhotoFile?.path,
      createdAt: null,
      isMan: model.isMale,
      birthDate: model.birthDate,
      driverLicense: model.driverLicense,
      dateOfIssue: model.dateOfIssue,
    );
  }
}
