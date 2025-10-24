// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthDataModel {

 String get email; String get password; String? get lastName; String? get firstName; String? get middleName; String? get birthDate; bool? get isMale; String? get driverLicense; String? get dateOfIssue; File? get driverLicenseFile; File? get passportFile; File? get accountPhotoFile;
/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDataModelCopyWith<AuthDataModel> get copyWith => _$AuthDataModelCopyWithImpl<AuthDataModel>(this as AuthDataModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDataModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.isMale, isMale) || other.isMale == isMale)&&(identical(other.driverLicense, driverLicense) || other.driverLicense == driverLicense)&&(identical(other.dateOfIssue, dateOfIssue) || other.dateOfIssue == dateOfIssue)&&(identical(other.driverLicenseFile, driverLicenseFile) || other.driverLicenseFile == driverLicenseFile)&&(identical(other.passportFile, passportFile) || other.passportFile == passportFile)&&(identical(other.accountPhotoFile, accountPhotoFile) || other.accountPhotoFile == accountPhotoFile));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,lastName,firstName,middleName,birthDate,isMale,driverLicense,dateOfIssue,driverLicenseFile,passportFile,accountPhotoFile);

@override
String toString() {
  return 'AuthDataModel(email: $email, password: $password, lastName: $lastName, firstName: $firstName, middleName: $middleName, birthDate: $birthDate, isMale: $isMale, driverLicense: $driverLicense, dateOfIssue: $dateOfIssue, driverLicenseFile: $driverLicenseFile, passportFile: $passportFile, accountPhotoFile: $accountPhotoFile)';
}


}

/// @nodoc
abstract mixin class $AuthDataModelCopyWith<$Res>  {
  factory $AuthDataModelCopyWith(AuthDataModel value, $Res Function(AuthDataModel) _then) = _$AuthDataModelCopyWithImpl;
@useResult
$Res call({
 String email, String password, String? lastName, String? firstName, String? middleName, String? birthDate, bool? isMale, String? driverLicense, String? dateOfIssue, File? driverLicenseFile, File? passportFile, File? accountPhotoFile
});




}
/// @nodoc
class _$AuthDataModelCopyWithImpl<$Res>
    implements $AuthDataModelCopyWith<$Res> {
  _$AuthDataModelCopyWithImpl(this._self, this._then);

  final AuthDataModel _self;
  final $Res Function(AuthDataModel) _then;

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? lastName = freezed,Object? firstName = freezed,Object? middleName = freezed,Object? birthDate = freezed,Object? isMale = freezed,Object? driverLicense = freezed,Object? dateOfIssue = freezed,Object? driverLicenseFile = freezed,Object? passportFile = freezed,Object? accountPhotoFile = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,isMale: freezed == isMale ? _self.isMale : isMale // ignore: cast_nullable_to_non_nullable
as bool?,driverLicense: freezed == driverLicense ? _self.driverLicense : driverLicense // ignore: cast_nullable_to_non_nullable
as String?,dateOfIssue: freezed == dateOfIssue ? _self.dateOfIssue : dateOfIssue // ignore: cast_nullable_to_non_nullable
as String?,driverLicenseFile: freezed == driverLicenseFile ? _self.driverLicenseFile : driverLicenseFile // ignore: cast_nullable_to_non_nullable
as File?,passportFile: freezed == passportFile ? _self.passportFile : passportFile // ignore: cast_nullable_to_non_nullable
as File?,accountPhotoFile: freezed == accountPhotoFile ? _self.accountPhotoFile : accountPhotoFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthDataModel].
extension AuthDataModelPatterns on AuthDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthDataModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String? lastName,  String? firstName,  String? middleName,  String? birthDate,  bool? isMale,  String? driverLicense,  String? dateOfIssue,  File? driverLicenseFile,  File? passportFile,  File? accountPhotoFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
return $default(_that.email,_that.password,_that.lastName,_that.firstName,_that.middleName,_that.birthDate,_that.isMale,_that.driverLicense,_that.dateOfIssue,_that.driverLicenseFile,_that.passportFile,_that.accountPhotoFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String? lastName,  String? firstName,  String? middleName,  String? birthDate,  bool? isMale,  String? driverLicense,  String? dateOfIssue,  File? driverLicenseFile,  File? passportFile,  File? accountPhotoFile)  $default,) {final _that = this;
switch (_that) {
case _AuthDataModel():
return $default(_that.email,_that.password,_that.lastName,_that.firstName,_that.middleName,_that.birthDate,_that.isMale,_that.driverLicense,_that.dateOfIssue,_that.driverLicenseFile,_that.passportFile,_that.accountPhotoFile);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String? lastName,  String? firstName,  String? middleName,  String? birthDate,  bool? isMale,  String? driverLicense,  String? dateOfIssue,  File? driverLicenseFile,  File? passportFile,  File? accountPhotoFile)?  $default,) {final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
return $default(_that.email,_that.password,_that.lastName,_that.firstName,_that.middleName,_that.birthDate,_that.isMale,_that.driverLicense,_that.dateOfIssue,_that.driverLicenseFile,_that.passportFile,_that.accountPhotoFile);case _:
  return null;

}
}

}

/// @nodoc


class _AuthDataModel implements AuthDataModel {
  const _AuthDataModel({required this.email, required this.password, this.lastName, this.firstName, this.middleName, this.birthDate, this.isMale, this.driverLicense, this.dateOfIssue, this.driverLicenseFile, this.passportFile, this.accountPhotoFile});
  

@override final  String email;
@override final  String password;
@override final  String? lastName;
@override final  String? firstName;
@override final  String? middleName;
@override final  String? birthDate;
@override final  bool? isMale;
@override final  String? driverLicense;
@override final  String? dateOfIssue;
@override final  File? driverLicenseFile;
@override final  File? passportFile;
@override final  File? accountPhotoFile;

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDataModelCopyWith<_AuthDataModel> get copyWith => __$AuthDataModelCopyWithImpl<_AuthDataModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDataModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.isMale, isMale) || other.isMale == isMale)&&(identical(other.driverLicense, driverLicense) || other.driverLicense == driverLicense)&&(identical(other.dateOfIssue, dateOfIssue) || other.dateOfIssue == dateOfIssue)&&(identical(other.driverLicenseFile, driverLicenseFile) || other.driverLicenseFile == driverLicenseFile)&&(identical(other.passportFile, passportFile) || other.passportFile == passportFile)&&(identical(other.accountPhotoFile, accountPhotoFile) || other.accountPhotoFile == accountPhotoFile));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,lastName,firstName,middleName,birthDate,isMale,driverLicense,dateOfIssue,driverLicenseFile,passportFile,accountPhotoFile);

@override
String toString() {
  return 'AuthDataModel(email: $email, password: $password, lastName: $lastName, firstName: $firstName, middleName: $middleName, birthDate: $birthDate, isMale: $isMale, driverLicense: $driverLicense, dateOfIssue: $dateOfIssue, driverLicenseFile: $driverLicenseFile, passportFile: $passportFile, accountPhotoFile: $accountPhotoFile)';
}


}

/// @nodoc
abstract mixin class _$AuthDataModelCopyWith<$Res> implements $AuthDataModelCopyWith<$Res> {
  factory _$AuthDataModelCopyWith(_AuthDataModel value, $Res Function(_AuthDataModel) _then) = __$AuthDataModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String? lastName, String? firstName, String? middleName, String? birthDate, bool? isMale, String? driverLicense, String? dateOfIssue, File? driverLicenseFile, File? passportFile, File? accountPhotoFile
});




}
/// @nodoc
class __$AuthDataModelCopyWithImpl<$Res>
    implements _$AuthDataModelCopyWith<$Res> {
  __$AuthDataModelCopyWithImpl(this._self, this._then);

  final _AuthDataModel _self;
  final $Res Function(_AuthDataModel) _then;

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? lastName = freezed,Object? firstName = freezed,Object? middleName = freezed,Object? birthDate = freezed,Object? isMale = freezed,Object? driverLicense = freezed,Object? dateOfIssue = freezed,Object? driverLicenseFile = freezed,Object? passportFile = freezed,Object? accountPhotoFile = freezed,}) {
  return _then(_AuthDataModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,isMale: freezed == isMale ? _self.isMale : isMale // ignore: cast_nullable_to_non_nullable
as bool?,driverLicense: freezed == driverLicense ? _self.driverLicense : driverLicense // ignore: cast_nullable_to_non_nullable
as String?,dateOfIssue: freezed == dateOfIssue ? _self.dateOfIssue : dateOfIssue // ignore: cast_nullable_to_non_nullable
as String?,driverLicenseFile: freezed == driverLicenseFile ? _self.driverLicenseFile : driverLicenseFile // ignore: cast_nullable_to_non_nullable
as File?,passportFile: freezed == passportFile ? _self.passportFile : passportFile // ignore: cast_nullable_to_non_nullable
as File?,accountPhotoFile: freezed == accountPhotoFile ? _self.accountPhotoFile : accountPhotoFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
