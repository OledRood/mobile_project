// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpStateStep1 {

 bool get checkPolitics; String? get emailError; String? get passwordError; String? get checkPoliticsError; String? get confirmPasswordError; bool get isPasswordVisible; bool get isConfirmPasswordVisible; bool get isLoading;
/// Create a copy of SignUpStateStep1
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateStep1CopyWith<SignUpStateStep1> get copyWith => _$SignUpStateStep1CopyWithImpl<SignUpStateStep1>(this as SignUpStateStep1, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStateStep1&&(identical(other.checkPolitics, checkPolitics) || other.checkPolitics == checkPolitics)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.checkPoliticsError, checkPoliticsError) || other.checkPoliticsError == checkPoliticsError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,checkPolitics,emailError,passwordError,checkPoliticsError,confirmPasswordError,isPasswordVisible,isConfirmPasswordVisible,isLoading);

@override
String toString() {
  return 'SignUpStateStep1(checkPolitics: $checkPolitics, emailError: $emailError, passwordError: $passwordError, checkPoliticsError: $checkPoliticsError, confirmPasswordError: $confirmPasswordError, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SignUpStateStep1CopyWith<$Res>  {
  factory $SignUpStateStep1CopyWith(SignUpStateStep1 value, $Res Function(SignUpStateStep1) _then) = _$SignUpStateStep1CopyWithImpl;
@useResult
$Res call({
 bool checkPolitics, String? emailError, String? passwordError, String? checkPoliticsError, String? confirmPasswordError, bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading
});




}
/// @nodoc
class _$SignUpStateStep1CopyWithImpl<$Res>
    implements $SignUpStateStep1CopyWith<$Res> {
  _$SignUpStateStep1CopyWithImpl(this._self, this._then);

  final SignUpStateStep1 _self;
  final $Res Function(SignUpStateStep1) _then;

/// Create a copy of SignUpStateStep1
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkPolitics = null,Object? emailError = freezed,Object? passwordError = freezed,Object? checkPoliticsError = freezed,Object? confirmPasswordError = freezed,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
checkPolitics: null == checkPolitics ? _self.checkPolitics : checkPolitics // ignore: cast_nullable_to_non_nullable
as bool,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,checkPoliticsError: freezed == checkPoliticsError ? _self.checkPoliticsError : checkPoliticsError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpStateStep1].
extension SignUpStateStep1Patterns on SignUpStateStep1 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpStateStep1 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpStateStep1() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpStateStep1 value)  $default,){
final _that = this;
switch (_that) {
case _SignUpStateStep1():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpStateStep1 value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpStateStep1() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool checkPolitics,  String? emailError,  String? passwordError,  String? checkPoliticsError,  String? confirmPasswordError,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpStateStep1() when $default != null:
return $default(_that.checkPolitics,_that.emailError,_that.passwordError,_that.checkPoliticsError,_that.confirmPasswordError,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool checkPolitics,  String? emailError,  String? passwordError,  String? checkPoliticsError,  String? confirmPasswordError,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SignUpStateStep1():
return $default(_that.checkPolitics,_that.emailError,_that.passwordError,_that.checkPoliticsError,_that.confirmPasswordError,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool checkPolitics,  String? emailError,  String? passwordError,  String? checkPoliticsError,  String? confirmPasswordError,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SignUpStateStep1() when $default != null:
return $default(_that.checkPolitics,_that.emailError,_that.passwordError,_that.checkPoliticsError,_that.confirmPasswordError,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpStateStep1 extends SignUpStateStep1 {
  const _SignUpStateStep1({this.checkPolitics = false, this.emailError, this.passwordError, this.checkPoliticsError, this.confirmPasswordError, this.isPasswordVisible = false, this.isConfirmPasswordVisible = false, this.isLoading = false}): super._();
  

@override@JsonKey() final  bool checkPolitics;
@override final  String? emailError;
@override final  String? passwordError;
@override final  String? checkPoliticsError;
@override final  String? confirmPasswordError;
@override@JsonKey() final  bool isPasswordVisible;
@override@JsonKey() final  bool isConfirmPasswordVisible;
@override@JsonKey() final  bool isLoading;

/// Create a copy of SignUpStateStep1
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateStep1CopyWith<_SignUpStateStep1> get copyWith => __$SignUpStateStep1CopyWithImpl<_SignUpStateStep1>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpStateStep1&&(identical(other.checkPolitics, checkPolitics) || other.checkPolitics == checkPolitics)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.checkPoliticsError, checkPoliticsError) || other.checkPoliticsError == checkPoliticsError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,checkPolitics,emailError,passwordError,checkPoliticsError,confirmPasswordError,isPasswordVisible,isConfirmPasswordVisible,isLoading);

@override
String toString() {
  return 'SignUpStateStep1(checkPolitics: $checkPolitics, emailError: $emailError, passwordError: $passwordError, checkPoliticsError: $checkPoliticsError, confirmPasswordError: $confirmPasswordError, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateStep1CopyWith<$Res> implements $SignUpStateStep1CopyWith<$Res> {
  factory _$SignUpStateStep1CopyWith(_SignUpStateStep1 value, $Res Function(_SignUpStateStep1) _then) = __$SignUpStateStep1CopyWithImpl;
@override @useResult
$Res call({
 bool checkPolitics, String? emailError, String? passwordError, String? checkPoliticsError, String? confirmPasswordError, bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading
});




}
/// @nodoc
class __$SignUpStateStep1CopyWithImpl<$Res>
    implements _$SignUpStateStep1CopyWith<$Res> {
  __$SignUpStateStep1CopyWithImpl(this._self, this._then);

  final _SignUpStateStep1 _self;
  final $Res Function(_SignUpStateStep1) _then;

/// Create a copy of SignUpStateStep1
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkPolitics = null,Object? emailError = freezed,Object? passwordError = freezed,Object? checkPoliticsError = freezed,Object? confirmPasswordError = freezed,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,}) {
  return _then(_SignUpStateStep1(
checkPolitics: null == checkPolitics ? _self.checkPolitics : checkPolitics // ignore: cast_nullable_to_non_nullable
as bool,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,checkPoliticsError: freezed == checkPoliticsError ? _self.checkPoliticsError : checkPoliticsError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SignUpStateStep2 {

 String? get lastNameError; String? get firstNameError; String? get dateOfBirthError; bool get isMen; bool get isLoading;
/// Create a copy of SignUpStateStep2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateStep2CopyWith<SignUpStateStep2> get copyWith => _$SignUpStateStep2CopyWithImpl<SignUpStateStep2>(this as SignUpStateStep2, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStateStep2&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.dateOfBirthError, dateOfBirthError) || other.dateOfBirthError == dateOfBirthError)&&(identical(other.isMen, isMen) || other.isMen == isMen)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,lastNameError,firstNameError,dateOfBirthError,isMen,isLoading);

@override
String toString() {
  return 'SignUpStateStep2(lastNameError: $lastNameError, firstNameError: $firstNameError, dateOfBirthError: $dateOfBirthError, isMen: $isMen, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SignUpStateStep2CopyWith<$Res>  {
  factory $SignUpStateStep2CopyWith(SignUpStateStep2 value, $Res Function(SignUpStateStep2) _then) = _$SignUpStateStep2CopyWithImpl;
@useResult
$Res call({
 String? lastNameError, String? firstNameError, String? dateOfBirthError, bool isMen, bool isLoading
});




}
/// @nodoc
class _$SignUpStateStep2CopyWithImpl<$Res>
    implements $SignUpStateStep2CopyWith<$Res> {
  _$SignUpStateStep2CopyWithImpl(this._self, this._then);

  final SignUpStateStep2 _self;
  final $Res Function(SignUpStateStep2) _then;

/// Create a copy of SignUpStateStep2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastNameError = freezed,Object? firstNameError = freezed,Object? dateOfBirthError = freezed,Object? isMen = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirthError: freezed == dateOfBirthError ? _self.dateOfBirthError : dateOfBirthError // ignore: cast_nullable_to_non_nullable
as String?,isMen: null == isMen ? _self.isMen : isMen // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpStateStep2].
extension SignUpStateStep2Patterns on SignUpStateStep2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpStateStep2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpStateStep2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpStateStep2 value)  $default,){
final _that = this;
switch (_that) {
case _SignUpStateStep2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpStateStep2 value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpStateStep2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? lastNameError,  String? firstNameError,  String? dateOfBirthError,  bool isMen,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpStateStep2() when $default != null:
return $default(_that.lastNameError,_that.firstNameError,_that.dateOfBirthError,_that.isMen,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? lastNameError,  String? firstNameError,  String? dateOfBirthError,  bool isMen,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SignUpStateStep2():
return $default(_that.lastNameError,_that.firstNameError,_that.dateOfBirthError,_that.isMen,_that.isLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? lastNameError,  String? firstNameError,  String? dateOfBirthError,  bool isMen,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SignUpStateStep2() when $default != null:
return $default(_that.lastNameError,_that.firstNameError,_that.dateOfBirthError,_that.isMen,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpStateStep2 extends SignUpStateStep2 {
  const _SignUpStateStep2({this.lastNameError, this.firstNameError, this.dateOfBirthError, this.isMen = false, this.isLoading = false}): super._();
  

@override final  String? lastNameError;
@override final  String? firstNameError;
@override final  String? dateOfBirthError;
@override@JsonKey() final  bool isMen;
@override@JsonKey() final  bool isLoading;

/// Create a copy of SignUpStateStep2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateStep2CopyWith<_SignUpStateStep2> get copyWith => __$SignUpStateStep2CopyWithImpl<_SignUpStateStep2>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpStateStep2&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.dateOfBirthError, dateOfBirthError) || other.dateOfBirthError == dateOfBirthError)&&(identical(other.isMen, isMen) || other.isMen == isMen)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,lastNameError,firstNameError,dateOfBirthError,isMen,isLoading);

@override
String toString() {
  return 'SignUpStateStep2(lastNameError: $lastNameError, firstNameError: $firstNameError, dateOfBirthError: $dateOfBirthError, isMen: $isMen, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateStep2CopyWith<$Res> implements $SignUpStateStep2CopyWith<$Res> {
  factory _$SignUpStateStep2CopyWith(_SignUpStateStep2 value, $Res Function(_SignUpStateStep2) _then) = __$SignUpStateStep2CopyWithImpl;
@override @useResult
$Res call({
 String? lastNameError, String? firstNameError, String? dateOfBirthError, bool isMen, bool isLoading
});




}
/// @nodoc
class __$SignUpStateStep2CopyWithImpl<$Res>
    implements _$SignUpStateStep2CopyWith<$Res> {
  __$SignUpStateStep2CopyWithImpl(this._self, this._then);

  final _SignUpStateStep2 _self;
  final $Res Function(_SignUpStateStep2) _then;

/// Create a copy of SignUpStateStep2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastNameError = freezed,Object? firstNameError = freezed,Object? dateOfBirthError = freezed,Object? isMen = null,Object? isLoading = null,}) {
  return _then(_SignUpStateStep2(
lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirthError: freezed == dateOfBirthError ? _self.dateOfBirthError : dateOfBirthError // ignore: cast_nullable_to_non_nullable
as String?,isMen: null == isMen ? _self.isMen : isMen // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SignUpStateStep3 {

 bool get isLoading; File? get driverLicenseFile; File? get accountPhotoFile; File? get passportFile; String? get driverLicenseError; String? get dateOfIssueError; String? get driverLicenseFileError; String? get passportFileError;
/// Create a copy of SignUpStateStep3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateStep3CopyWith<SignUpStateStep3> get copyWith => _$SignUpStateStep3CopyWithImpl<SignUpStateStep3>(this as SignUpStateStep3, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpStateStep3&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.driverLicenseFile, driverLicenseFile) || other.driverLicenseFile == driverLicenseFile)&&(identical(other.accountPhotoFile, accountPhotoFile) || other.accountPhotoFile == accountPhotoFile)&&(identical(other.passportFile, passportFile) || other.passportFile == passportFile)&&(identical(other.driverLicenseError, driverLicenseError) || other.driverLicenseError == driverLicenseError)&&(identical(other.dateOfIssueError, dateOfIssueError) || other.dateOfIssueError == dateOfIssueError)&&(identical(other.driverLicenseFileError, driverLicenseFileError) || other.driverLicenseFileError == driverLicenseFileError)&&(identical(other.passportFileError, passportFileError) || other.passportFileError == passportFileError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,driverLicenseFile,accountPhotoFile,passportFile,driverLicenseError,dateOfIssueError,driverLicenseFileError,passportFileError);

@override
String toString() {
  return 'SignUpStateStep3(isLoading: $isLoading, driverLicenseFile: $driverLicenseFile, accountPhotoFile: $accountPhotoFile, passportFile: $passportFile, driverLicenseError: $driverLicenseError, dateOfIssueError: $dateOfIssueError, driverLicenseFileError: $driverLicenseFileError, passportFileError: $passportFileError)';
}


}

/// @nodoc
abstract mixin class $SignUpStateStep3CopyWith<$Res>  {
  factory $SignUpStateStep3CopyWith(SignUpStateStep3 value, $Res Function(SignUpStateStep3) _then) = _$SignUpStateStep3CopyWithImpl;
@useResult
$Res call({
 bool isLoading, File? driverLicenseFile, File? accountPhotoFile, File? passportFile, String? driverLicenseError, String? dateOfIssueError, String? driverLicenseFileError, String? passportFileError
});




}
/// @nodoc
class _$SignUpStateStep3CopyWithImpl<$Res>
    implements $SignUpStateStep3CopyWith<$Res> {
  _$SignUpStateStep3CopyWithImpl(this._self, this._then);

  final SignUpStateStep3 _self;
  final $Res Function(SignUpStateStep3) _then;

/// Create a copy of SignUpStateStep3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? driverLicenseFile = freezed,Object? accountPhotoFile = freezed,Object? passportFile = freezed,Object? driverLicenseError = freezed,Object? dateOfIssueError = freezed,Object? driverLicenseFileError = freezed,Object? passportFileError = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,driverLicenseFile: freezed == driverLicenseFile ? _self.driverLicenseFile : driverLicenseFile // ignore: cast_nullable_to_non_nullable
as File?,accountPhotoFile: freezed == accountPhotoFile ? _self.accountPhotoFile : accountPhotoFile // ignore: cast_nullable_to_non_nullable
as File?,passportFile: freezed == passportFile ? _self.passportFile : passportFile // ignore: cast_nullable_to_non_nullable
as File?,driverLicenseError: freezed == driverLicenseError ? _self.driverLicenseError : driverLicenseError // ignore: cast_nullable_to_non_nullable
as String?,dateOfIssueError: freezed == dateOfIssueError ? _self.dateOfIssueError : dateOfIssueError // ignore: cast_nullable_to_non_nullable
as String?,driverLicenseFileError: freezed == driverLicenseFileError ? _self.driverLicenseFileError : driverLicenseFileError // ignore: cast_nullable_to_non_nullable
as String?,passportFileError: freezed == passportFileError ? _self.passportFileError : passportFileError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpStateStep3].
extension SignUpStateStep3Patterns on SignUpStateStep3 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpStateStep3 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpStateStep3() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpStateStep3 value)  $default,){
final _that = this;
switch (_that) {
case _SignUpStateStep3():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpStateStep3 value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpStateStep3() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  File? driverLicenseFile,  File? accountPhotoFile,  File? passportFile,  String? driverLicenseError,  String? dateOfIssueError,  String? driverLicenseFileError,  String? passportFileError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpStateStep3() when $default != null:
return $default(_that.isLoading,_that.driverLicenseFile,_that.accountPhotoFile,_that.passportFile,_that.driverLicenseError,_that.dateOfIssueError,_that.driverLicenseFileError,_that.passportFileError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  File? driverLicenseFile,  File? accountPhotoFile,  File? passportFile,  String? driverLicenseError,  String? dateOfIssueError,  String? driverLicenseFileError,  String? passportFileError)  $default,) {final _that = this;
switch (_that) {
case _SignUpStateStep3():
return $default(_that.isLoading,_that.driverLicenseFile,_that.accountPhotoFile,_that.passportFile,_that.driverLicenseError,_that.dateOfIssueError,_that.driverLicenseFileError,_that.passportFileError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  File? driverLicenseFile,  File? accountPhotoFile,  File? passportFile,  String? driverLicenseError,  String? dateOfIssueError,  String? driverLicenseFileError,  String? passportFileError)?  $default,) {final _that = this;
switch (_that) {
case _SignUpStateStep3() when $default != null:
return $default(_that.isLoading,_that.driverLicenseFile,_that.accountPhotoFile,_that.passportFile,_that.driverLicenseError,_that.dateOfIssueError,_that.driverLicenseFileError,_that.passportFileError);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpStateStep3 extends SignUpStateStep3 {
  const _SignUpStateStep3({this.isLoading = false, this.driverLicenseFile, this.accountPhotoFile, this.passportFile, this.driverLicenseError, this.dateOfIssueError, this.driverLicenseFileError, this.passportFileError}): super._();
  

@override@JsonKey() final  bool isLoading;
@override final  File? driverLicenseFile;
@override final  File? accountPhotoFile;
@override final  File? passportFile;
@override final  String? driverLicenseError;
@override final  String? dateOfIssueError;
@override final  String? driverLicenseFileError;
@override final  String? passportFileError;

/// Create a copy of SignUpStateStep3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateStep3CopyWith<_SignUpStateStep3> get copyWith => __$SignUpStateStep3CopyWithImpl<_SignUpStateStep3>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpStateStep3&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.driverLicenseFile, driverLicenseFile) || other.driverLicenseFile == driverLicenseFile)&&(identical(other.accountPhotoFile, accountPhotoFile) || other.accountPhotoFile == accountPhotoFile)&&(identical(other.passportFile, passportFile) || other.passportFile == passportFile)&&(identical(other.driverLicenseError, driverLicenseError) || other.driverLicenseError == driverLicenseError)&&(identical(other.dateOfIssueError, dateOfIssueError) || other.dateOfIssueError == dateOfIssueError)&&(identical(other.driverLicenseFileError, driverLicenseFileError) || other.driverLicenseFileError == driverLicenseFileError)&&(identical(other.passportFileError, passportFileError) || other.passportFileError == passportFileError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,driverLicenseFile,accountPhotoFile,passportFile,driverLicenseError,dateOfIssueError,driverLicenseFileError,passportFileError);

@override
String toString() {
  return 'SignUpStateStep3(isLoading: $isLoading, driverLicenseFile: $driverLicenseFile, accountPhotoFile: $accountPhotoFile, passportFile: $passportFile, driverLicenseError: $driverLicenseError, dateOfIssueError: $dateOfIssueError, driverLicenseFileError: $driverLicenseFileError, passportFileError: $passportFileError)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateStep3CopyWith<$Res> implements $SignUpStateStep3CopyWith<$Res> {
  factory _$SignUpStateStep3CopyWith(_SignUpStateStep3 value, $Res Function(_SignUpStateStep3) _then) = __$SignUpStateStep3CopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, File? driverLicenseFile, File? accountPhotoFile, File? passportFile, String? driverLicenseError, String? dateOfIssueError, String? driverLicenseFileError, String? passportFileError
});




}
/// @nodoc
class __$SignUpStateStep3CopyWithImpl<$Res>
    implements _$SignUpStateStep3CopyWith<$Res> {
  __$SignUpStateStep3CopyWithImpl(this._self, this._then);

  final _SignUpStateStep3 _self;
  final $Res Function(_SignUpStateStep3) _then;

/// Create a copy of SignUpStateStep3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? driverLicenseFile = freezed,Object? accountPhotoFile = freezed,Object? passportFile = freezed,Object? driverLicenseError = freezed,Object? dateOfIssueError = freezed,Object? driverLicenseFileError = freezed,Object? passportFileError = freezed,}) {
  return _then(_SignUpStateStep3(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,driverLicenseFile: freezed == driverLicenseFile ? _self.driverLicenseFile : driverLicenseFile // ignore: cast_nullable_to_non_nullable
as File?,accountPhotoFile: freezed == accountPhotoFile ? _self.accountPhotoFile : accountPhotoFile // ignore: cast_nullable_to_non_nullable
as File?,passportFile: freezed == passportFile ? _self.passportFile : passportFile // ignore: cast_nullable_to_non_nullable
as File?,driverLicenseError: freezed == driverLicenseError ? _self.driverLicenseError : driverLicenseError // ignore: cast_nullable_to_non_nullable
as String?,dateOfIssueError: freezed == dateOfIssueError ? _self.dateOfIssueError : dateOfIssueError // ignore: cast_nullable_to_non_nullable
as String?,driverLicenseFileError: freezed == driverLicenseFileError ? _self.driverLicenseFileError : driverLicenseFileError // ignore: cast_nullable_to_non_nullable
as String?,passportFileError: freezed == passportFileError ? _self.passportFileError : passportFileError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
