// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_rent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarRentState {

 bool get isLoading; String? get error; CarRentData? get carRentData; int get rentDays; AsyncValue<String> get depositInfo;
/// Create a copy of CarRentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarRentStateCopyWith<CarRentState> get copyWith => _$CarRentStateCopyWithImpl<CarRentState>(this as CarRentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarRentState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.carRentData, carRentData) || other.carRentData == carRentData)&&(identical(other.rentDays, rentDays) || other.rentDays == rentDays)&&(identical(other.depositInfo, depositInfo) || other.depositInfo == depositInfo));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,carRentData,rentDays,depositInfo);

@override
String toString() {
  return 'CarRentState(isLoading: $isLoading, error: $error, carRentData: $carRentData, rentDays: $rentDays, depositInfo: $depositInfo)';
}


}

/// @nodoc
abstract mixin class $CarRentStateCopyWith<$Res>  {
  factory $CarRentStateCopyWith(CarRentState value, $Res Function(CarRentState) _then) = _$CarRentStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, CarRentData? carRentData, int rentDays, AsyncValue<String> depositInfo
});


$CarRentDataCopyWith<$Res>? get carRentData;

}
/// @nodoc
class _$CarRentStateCopyWithImpl<$Res>
    implements $CarRentStateCopyWith<$Res> {
  _$CarRentStateCopyWithImpl(this._self, this._then);

  final CarRentState _self;
  final $Res Function(CarRentState) _then;

/// Create a copy of CarRentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? carRentData = freezed,Object? rentDays = null,Object? depositInfo = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,carRentData: freezed == carRentData ? _self.carRentData : carRentData // ignore: cast_nullable_to_non_nullable
as CarRentData?,rentDays: null == rentDays ? _self.rentDays : rentDays // ignore: cast_nullable_to_non_nullable
as int,depositInfo: null == depositInfo ? _self.depositInfo : depositInfo // ignore: cast_nullable_to_non_nullable
as AsyncValue<String>,
  ));
}
/// Create a copy of CarRentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarRentDataCopyWith<$Res>? get carRentData {
    if (_self.carRentData == null) {
    return null;
  }

  return $CarRentDataCopyWith<$Res>(_self.carRentData!, (value) {
    return _then(_self.copyWith(carRentData: value));
  });
}
}


/// Adds pattern-matching-related methods to [CarRentState].
extension CarRentStatePatterns on CarRentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarRentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarRentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarRentState value)  $default,){
final _that = this;
switch (_that) {
case _CarRentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarRentState value)?  $default,){
final _that = this;
switch (_that) {
case _CarRentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  CarRentData? carRentData,  int rentDays,  AsyncValue<String> depositInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarRentState() when $default != null:
return $default(_that.isLoading,_that.error,_that.carRentData,_that.rentDays,_that.depositInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  CarRentData? carRentData,  int rentDays,  AsyncValue<String> depositInfo)  $default,) {final _that = this;
switch (_that) {
case _CarRentState():
return $default(_that.isLoading,_that.error,_that.carRentData,_that.rentDays,_that.depositInfo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  CarRentData? carRentData,  int rentDays,  AsyncValue<String> depositInfo)?  $default,) {final _that = this;
switch (_that) {
case _CarRentState() when $default != null:
return $default(_that.isLoading,_that.error,_that.carRentData,_that.rentDays,_that.depositInfo);case _:
  return null;

}
}

}

/// @nodoc


class _CarRentState implements CarRentState {
  const _CarRentState({this.isLoading = false, this.error, this.carRentData, this.rentDays = 1, this.depositInfo = const AsyncValue.data('')});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  CarRentData? carRentData;
@override@JsonKey() final  int rentDays;
@override@JsonKey() final  AsyncValue<String> depositInfo;

/// Create a copy of CarRentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarRentStateCopyWith<_CarRentState> get copyWith => __$CarRentStateCopyWithImpl<_CarRentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarRentState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.carRentData, carRentData) || other.carRentData == carRentData)&&(identical(other.rentDays, rentDays) || other.rentDays == rentDays)&&(identical(other.depositInfo, depositInfo) || other.depositInfo == depositInfo));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,carRentData,rentDays,depositInfo);

@override
String toString() {
  return 'CarRentState(isLoading: $isLoading, error: $error, carRentData: $carRentData, rentDays: $rentDays, depositInfo: $depositInfo)';
}


}

/// @nodoc
abstract mixin class _$CarRentStateCopyWith<$Res> implements $CarRentStateCopyWith<$Res> {
  factory _$CarRentStateCopyWith(_CarRentState value, $Res Function(_CarRentState) _then) = __$CarRentStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, CarRentData? carRentData, int rentDays, AsyncValue<String> depositInfo
});


@override $CarRentDataCopyWith<$Res>? get carRentData;

}
/// @nodoc
class __$CarRentStateCopyWithImpl<$Res>
    implements _$CarRentStateCopyWith<$Res> {
  __$CarRentStateCopyWithImpl(this._self, this._then);

  final _CarRentState _self;
  final $Res Function(_CarRentState) _then;

/// Create a copy of CarRentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? carRentData = freezed,Object? rentDays = null,Object? depositInfo = null,}) {
  return _then(_CarRentState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,carRentData: freezed == carRentData ? _self.carRentData : carRentData // ignore: cast_nullable_to_non_nullable
as CarRentData?,rentDays: null == rentDays ? _self.rentDays : rentDays // ignore: cast_nullable_to_non_nullable
as int,depositInfo: null == depositInfo ? _self.depositInfo : depositInfo // ignore: cast_nullable_to_non_nullable
as AsyncValue<String>,
  ));
}

/// Create a copy of CarRentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarRentDataCopyWith<$Res>? get carRentData {
    if (_self.carRentData == null) {
    return null;
  }

  return $CarRentDataCopyWith<$Res>(_self.carRentData!, (value) {
    return _then(_self.copyWith(carRentData: value));
  });
}
}

// dart format on
