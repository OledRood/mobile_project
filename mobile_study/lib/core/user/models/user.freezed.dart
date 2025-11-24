// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get email;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName;@JsonKey(name: 'middle_name') String? get middleName; String? get avatar;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'is_male') bool? get isMale;@JsonKey(name: 'birth_date') String? get birthDate;@JsonKey(name: 'driver_license') String? get driverLicense;@JsonKey(name: 'date_of_issue') String? get dateOfIssue;@JsonKey(name: 'driver_license_photo') String? get driverLicensePhoto;@JsonKey(name: 'passport_photo') String? get passportPhoto; String? get role; String? get googleEmail;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isMale, isMale) || other.isMale == isMale)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.driverLicense, driverLicense) || other.driverLicense == driverLicense)&&(identical(other.dateOfIssue, dateOfIssue) || other.dateOfIssue == dateOfIssue)&&(identical(other.driverLicensePhoto, driverLicensePhoto) || other.driverLicensePhoto == driverLicensePhoto)&&(identical(other.passportPhoto, passportPhoto) || other.passportPhoto == passportPhoto)&&(identical(other.role, role) || other.role == role)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,middleName,avatar,createdAt,isMale,birthDate,driverLicense,dateOfIssue,driverLicensePhoto,passportPhoto,role,googleEmail);

@override
String toString() {
  return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, avatar: $avatar, createdAt: $createdAt, isMale: $isMale, birthDate: $birthDate, driverLicense: $driverLicense, dateOfIssue: $dateOfIssue, driverLicensePhoto: $driverLicensePhoto, passportPhoto: $passportPhoto, role: $role, googleEmail: $googleEmail)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'middle_name') String? middleName, String? avatar,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'is_male') bool? isMale,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'driver_license') String? driverLicense,@JsonKey(name: 'date_of_issue') String? dateOfIssue,@JsonKey(name: 'driver_license_photo') String? driverLicensePhoto,@JsonKey(name: 'passport_photo') String? passportPhoto, String? role, String? googleEmail
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? avatar = freezed,Object? createdAt = freezed,Object? isMale = freezed,Object? birthDate = freezed,Object? driverLicense = freezed,Object? dateOfIssue = freezed,Object? driverLicensePhoto = freezed,Object? passportPhoto = freezed,Object? role = freezed,Object? googleEmail = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isMale: freezed == isMale ? _self.isMale : isMale // ignore: cast_nullable_to_non_nullable
as bool?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,driverLicense: freezed == driverLicense ? _self.driverLicense : driverLicense // ignore: cast_nullable_to_non_nullable
as String?,dateOfIssue: freezed == dateOfIssue ? _self.dateOfIssue : dateOfIssue // ignore: cast_nullable_to_non_nullable
as String?,driverLicensePhoto: freezed == driverLicensePhoto ? _self.driverLicensePhoto : driverLicensePhoto // ignore: cast_nullable_to_non_nullable
as String?,passportPhoto: freezed == passportPhoto ? _self.passportPhoto : passportPhoto // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,googleEmail: freezed == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'middle_name')  String? middleName,  String? avatar, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'is_male')  bool? isMale, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'driver_license')  String? driverLicense, @JsonKey(name: 'date_of_issue')  String? dateOfIssue, @JsonKey(name: 'driver_license_photo')  String? driverLicensePhoto, @JsonKey(name: 'passport_photo')  String? passportPhoto,  String? role,  String? googleEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.avatar,_that.createdAt,_that.isMale,_that.birthDate,_that.driverLicense,_that.dateOfIssue,_that.driverLicensePhoto,_that.passportPhoto,_that.role,_that.googleEmail);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'middle_name')  String? middleName,  String? avatar, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'is_male')  bool? isMale, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'driver_license')  String? driverLicense, @JsonKey(name: 'date_of_issue')  String? dateOfIssue, @JsonKey(name: 'driver_license_photo')  String? driverLicensePhoto, @JsonKey(name: 'passport_photo')  String? passportPhoto,  String? role,  String? googleEmail)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.avatar,_that.createdAt,_that.isMale,_that.birthDate,_that.driverLicense,_that.dateOfIssue,_that.driverLicensePhoto,_that.passportPhoto,_that.role,_that.googleEmail);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'middle_name')  String? middleName,  String? avatar, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'is_male')  bool? isMale, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'driver_license')  String? driverLicense, @JsonKey(name: 'date_of_issue')  String? dateOfIssue, @JsonKey(name: 'driver_license_photo')  String? driverLicensePhoto, @JsonKey(name: 'passport_photo')  String? passportPhoto,  String? role,  String? googleEmail)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.avatar,_that.createdAt,_that.isMale,_that.birthDate,_that.driverLicense,_that.dateOfIssue,_that.driverLicensePhoto,_that.passportPhoto,_that.role,_that.googleEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User extends User {
  const _User({required this.id, required this.email, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, @JsonKey(name: 'middle_name') this.middleName, this.avatar, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'is_male') this.isMale, @JsonKey(name: 'birth_date') this.birthDate, @JsonKey(name: 'driver_license') this.driverLicense, @JsonKey(name: 'date_of_issue') this.dateOfIssue, @JsonKey(name: 'driver_license_photo') this.driverLicensePhoto, @JsonKey(name: 'passport_photo') this.passportPhoto, this.role, this.googleEmail}): super._();
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override@JsonKey(name: 'middle_name') final  String? middleName;
@override final  String? avatar;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'is_male') final  bool? isMale;
@override@JsonKey(name: 'birth_date') final  String? birthDate;
@override@JsonKey(name: 'driver_license') final  String? driverLicense;
@override@JsonKey(name: 'date_of_issue') final  String? dateOfIssue;
@override@JsonKey(name: 'driver_license_photo') final  String? driverLicensePhoto;
@override@JsonKey(name: 'passport_photo') final  String? passportPhoto;
@override final  String? role;
@override final  String? googleEmail;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isMale, isMale) || other.isMale == isMale)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.driverLicense, driverLicense) || other.driverLicense == driverLicense)&&(identical(other.dateOfIssue, dateOfIssue) || other.dateOfIssue == dateOfIssue)&&(identical(other.driverLicensePhoto, driverLicensePhoto) || other.driverLicensePhoto == driverLicensePhoto)&&(identical(other.passportPhoto, passportPhoto) || other.passportPhoto == passportPhoto)&&(identical(other.role, role) || other.role == role)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,middleName,avatar,createdAt,isMale,birthDate,driverLicense,dateOfIssue,driverLicensePhoto,passportPhoto,role,googleEmail);

@override
String toString() {
  return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, avatar: $avatar, createdAt: $createdAt, isMale: $isMale, birthDate: $birthDate, driverLicense: $driverLicense, dateOfIssue: $dateOfIssue, driverLicensePhoto: $driverLicensePhoto, passportPhoto: $passportPhoto, role: $role, googleEmail: $googleEmail)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'middle_name') String? middleName, String? avatar,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'is_male') bool? isMale,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'driver_license') String? driverLicense,@JsonKey(name: 'date_of_issue') String? dateOfIssue,@JsonKey(name: 'driver_license_photo') String? driverLicensePhoto,@JsonKey(name: 'passport_photo') String? passportPhoto, String? role, String? googleEmail
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? avatar = freezed,Object? createdAt = freezed,Object? isMale = freezed,Object? birthDate = freezed,Object? driverLicense = freezed,Object? dateOfIssue = freezed,Object? driverLicensePhoto = freezed,Object? passportPhoto = freezed,Object? role = freezed,Object? googleEmail = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isMale: freezed == isMale ? _self.isMale : isMale // ignore: cast_nullable_to_non_nullable
as bool?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,driverLicense: freezed == driverLicense ? _self.driverLicense : driverLicense // ignore: cast_nullable_to_non_nullable
as String?,dateOfIssue: freezed == dateOfIssue ? _self.dateOfIssue : dateOfIssue // ignore: cast_nullable_to_non_nullable
as String?,driverLicensePhoto: freezed == driverLicensePhoto ? _self.driverLicensePhoto : driverLicensePhoto // ignore: cast_nullable_to_non_nullable
as String?,passportPhoto: freezed == passportPhoto ? _self.passportPhoto : passportPhoto // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,googleEmail: freezed == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
