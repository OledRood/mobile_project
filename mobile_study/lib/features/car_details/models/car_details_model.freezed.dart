// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarDetailsState {

 bool get isLoading; String? get error; CarDetails? get carDetails;
/// Create a copy of CarDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarDetailsStateCopyWith<CarDetailsState> get copyWith => _$CarDetailsStateCopyWithImpl<CarDetailsState>(this as CarDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.carDetails, carDetails) || other.carDetails == carDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,carDetails);

@override
String toString() {
  return 'CarDetailsState(isLoading: $isLoading, error: $error, carDetails: $carDetails)';
}


}

/// @nodoc
abstract mixin class $CarDetailsStateCopyWith<$Res>  {
  factory $CarDetailsStateCopyWith(CarDetailsState value, $Res Function(CarDetailsState) _then) = _$CarDetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, CarDetails? carDetails
});


$CarDetailsCopyWith<$Res>? get carDetails;

}
/// @nodoc
class _$CarDetailsStateCopyWithImpl<$Res>
    implements $CarDetailsStateCopyWith<$Res> {
  _$CarDetailsStateCopyWithImpl(this._self, this._then);

  final CarDetailsState _self;
  final $Res Function(CarDetailsState) _then;

/// Create a copy of CarDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? carDetails = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,carDetails: freezed == carDetails ? _self.carDetails : carDetails // ignore: cast_nullable_to_non_nullable
as CarDetails?,
  ));
}
/// Create a copy of CarDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarDetailsCopyWith<$Res>? get carDetails {
    if (_self.carDetails == null) {
    return null;
  }

  return $CarDetailsCopyWith<$Res>(_self.carDetails!, (value) {
    return _then(_self.copyWith(carDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [CarDetailsState].
extension CarDetailsStatePatterns on CarDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _CarDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _CarDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  CarDetails? carDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarDetailsState() when $default != null:
return $default(_that.isLoading,_that.error,_that.carDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  CarDetails? carDetails)  $default,) {final _that = this;
switch (_that) {
case _CarDetailsState():
return $default(_that.isLoading,_that.error,_that.carDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  CarDetails? carDetails)?  $default,) {final _that = this;
switch (_that) {
case _CarDetailsState() when $default != null:
return $default(_that.isLoading,_that.error,_that.carDetails);case _:
  return null;

}
}

}

/// @nodoc


class _CarDetailsState implements CarDetailsState {
  const _CarDetailsState({this.isLoading = false, this.error, this.carDetails});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  CarDetails? carDetails;

/// Create a copy of CarDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarDetailsStateCopyWith<_CarDetailsState> get copyWith => __$CarDetailsStateCopyWithImpl<_CarDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.carDetails, carDetails) || other.carDetails == carDetails));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,carDetails);

@override
String toString() {
  return 'CarDetailsState(isLoading: $isLoading, error: $error, carDetails: $carDetails)';
}


}

/// @nodoc
abstract mixin class _$CarDetailsStateCopyWith<$Res> implements $CarDetailsStateCopyWith<$Res> {
  factory _$CarDetailsStateCopyWith(_CarDetailsState value, $Res Function(_CarDetailsState) _then) = __$CarDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, CarDetails? carDetails
});


@override $CarDetailsCopyWith<$Res>? get carDetails;

}
/// @nodoc
class __$CarDetailsStateCopyWithImpl<$Res>
    implements _$CarDetailsStateCopyWith<$Res> {
  __$CarDetailsStateCopyWithImpl(this._self, this._then);

  final _CarDetailsState _self;
  final $Res Function(_CarDetailsState) _then;

/// Create a copy of CarDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? carDetails = freezed,}) {
  return _then(_CarDetailsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,carDetails: freezed == carDetails ? _self.carDetails : carDetails // ignore: cast_nullable_to_non_nullable
as CarDetails?,
  ));
}

/// Create a copy of CarDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarDetailsCopyWith<$Res>? get carDetails {
    if (_self.carDetails == null) {
    return null;
  }

  return $CarDetailsCopyWith<$Res>(_self.carDetails!, (value) {
    return _then(_self.copyWith(carDetails: value));
  });
}
}

// dart format on
