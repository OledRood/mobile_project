// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_new_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateNewPasswordState {

 String? get emailError; String? get passwordError; String? get confirmPasswordError; bool get isPasswordVisible; bool get isConfirmPasswordVisible; bool get isLoading;
/// Create a copy of CreateNewPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewPasswordStateCopyWith<CreateNewPasswordState> get copyWith => _$CreateNewPasswordStateCopyWithImpl<CreateNewPasswordState>(this as CreateNewPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewPasswordState&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,emailError,passwordError,confirmPasswordError,isPasswordVisible,isConfirmPasswordVisible,isLoading);

@override
String toString() {
  return 'CreateNewPasswordState(emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $CreateNewPasswordStateCopyWith<$Res>  {
  factory $CreateNewPasswordStateCopyWith(CreateNewPasswordState value, $Res Function(CreateNewPasswordState) _then) = _$CreateNewPasswordStateCopyWithImpl;
@useResult
$Res call({
 String? emailError, String? passwordError, String? confirmPasswordError, bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading
});




}
/// @nodoc
class _$CreateNewPasswordStateCopyWithImpl<$Res>
    implements $CreateNewPasswordStateCopyWith<$Res> {
  _$CreateNewPasswordStateCopyWithImpl(this._self, this._then);

  final CreateNewPasswordState _self;
  final $Res Function(CreateNewPasswordState) _then;

/// Create a copy of CreateNewPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateNewPasswordState].
extension CreateNewPasswordStatePatterns on CreateNewPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateNewPasswordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateNewPasswordState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateNewPasswordState value)  $default,){
final _that = this;
switch (_that) {
case _CreateNewPasswordState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateNewPasswordState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateNewPasswordState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? emailError,  String? passwordError,  String? confirmPasswordError,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNewPasswordState() when $default != null:
return $default(_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? emailError,  String? passwordError,  String? confirmPasswordError,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _CreateNewPasswordState():
return $default(_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? emailError,  String? passwordError,  String? confirmPasswordError,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _CreateNewPasswordState() when $default != null:
return $default(_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _CreateNewPasswordState extends CreateNewPasswordState {
  const _CreateNewPasswordState({this.emailError, this.passwordError, this.confirmPasswordError, this.isPasswordVisible = false, this.isConfirmPasswordVisible = false, this.isLoading = false}): super._();
  

@override final  String? emailError;
@override final  String? passwordError;
@override final  String? confirmPasswordError;
@override@JsonKey() final  bool isPasswordVisible;
@override@JsonKey() final  bool isConfirmPasswordVisible;
@override@JsonKey() final  bool isLoading;

/// Create a copy of CreateNewPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNewPasswordStateCopyWith<_CreateNewPasswordState> get copyWith => __$CreateNewPasswordStateCopyWithImpl<_CreateNewPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNewPasswordState&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,emailError,passwordError,confirmPasswordError,isPasswordVisible,isConfirmPasswordVisible,isLoading);

@override
String toString() {
  return 'CreateNewPasswordState(emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$CreateNewPasswordStateCopyWith<$Res> implements $CreateNewPasswordStateCopyWith<$Res> {
  factory _$CreateNewPasswordStateCopyWith(_CreateNewPasswordState value, $Res Function(_CreateNewPasswordState) _then) = __$CreateNewPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 String? emailError, String? passwordError, String? confirmPasswordError, bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading
});




}
/// @nodoc
class __$CreateNewPasswordStateCopyWithImpl<$Res>
    implements _$CreateNewPasswordStateCopyWith<$Res> {
  __$CreateNewPasswordStateCopyWithImpl(this._self, this._then);

  final _CreateNewPasswordState _self;
  final $Res Function(_CreateNewPasswordState) _then;

/// Create a copy of CreateNewPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,}) {
  return _then(_CreateNewPasswordState(
emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
