// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarBookState {

 bool get isLoading; String? get error; int get rentDays; CarBookDataModel? get carBookModel; bool get isShowCancelButton;
/// Create a copy of CarBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarBookStateCopyWith<CarBookState> get copyWith => _$CarBookStateCopyWithImpl<CarBookState>(this as CarBookState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarBookState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.rentDays, rentDays) || other.rentDays == rentDays)&&(identical(other.carBookModel, carBookModel) || other.carBookModel == carBookModel)&&(identical(other.isShowCancelButton, isShowCancelButton) || other.isShowCancelButton == isShowCancelButton));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,rentDays,carBookModel,isShowCancelButton);

@override
String toString() {
  return 'CarBookState(isLoading: $isLoading, error: $error, rentDays: $rentDays, carBookModel: $carBookModel, isShowCancelButton: $isShowCancelButton)';
}


}

/// @nodoc
abstract mixin class $CarBookStateCopyWith<$Res>  {
  factory $CarBookStateCopyWith(CarBookState value, $Res Function(CarBookState) _then) = _$CarBookStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, int rentDays, CarBookDataModel? carBookModel, bool isShowCancelButton
});


$CarBookDataModelCopyWith<$Res>? get carBookModel;

}
/// @nodoc
class _$CarBookStateCopyWithImpl<$Res>
    implements $CarBookStateCopyWith<$Res> {
  _$CarBookStateCopyWithImpl(this._self, this._then);

  final CarBookState _self;
  final $Res Function(CarBookState) _then;

/// Create a copy of CarBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? rentDays = null,Object? carBookModel = freezed,Object? isShowCancelButton = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,rentDays: null == rentDays ? _self.rentDays : rentDays // ignore: cast_nullable_to_non_nullable
as int,carBookModel: freezed == carBookModel ? _self.carBookModel : carBookModel // ignore: cast_nullable_to_non_nullable
as CarBookDataModel?,isShowCancelButton: null == isShowCancelButton ? _self.isShowCancelButton : isShowCancelButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CarBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarBookDataModelCopyWith<$Res>? get carBookModel {
    if (_self.carBookModel == null) {
    return null;
  }

  return $CarBookDataModelCopyWith<$Res>(_self.carBookModel!, (value) {
    return _then(_self.copyWith(carBookModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [CarBookState].
extension CarBookStatePatterns on CarBookState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarBookState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarBookState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarBookState value)  $default,){
final _that = this;
switch (_that) {
case _CarBookState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarBookState value)?  $default,){
final _that = this;
switch (_that) {
case _CarBookState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  int rentDays,  CarBookDataModel? carBookModel,  bool isShowCancelButton)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarBookState() when $default != null:
return $default(_that.isLoading,_that.error,_that.rentDays,_that.carBookModel,_that.isShowCancelButton);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  int rentDays,  CarBookDataModel? carBookModel,  bool isShowCancelButton)  $default,) {final _that = this;
switch (_that) {
case _CarBookState():
return $default(_that.isLoading,_that.error,_that.rentDays,_that.carBookModel,_that.isShowCancelButton);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  int rentDays,  CarBookDataModel? carBookModel,  bool isShowCancelButton)?  $default,) {final _that = this;
switch (_that) {
case _CarBookState() when $default != null:
return $default(_that.isLoading,_that.error,_that.rentDays,_that.carBookModel,_that.isShowCancelButton);case _:
  return null;

}
}

}

/// @nodoc


class _CarBookState implements CarBookState {
  const _CarBookState({this.isLoading = false, this.error, this.rentDays = 1, this.carBookModel, this.isShowCancelButton = false});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  int rentDays;
@override final  CarBookDataModel? carBookModel;
@override@JsonKey() final  bool isShowCancelButton;

/// Create a copy of CarBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarBookStateCopyWith<_CarBookState> get copyWith => __$CarBookStateCopyWithImpl<_CarBookState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarBookState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.rentDays, rentDays) || other.rentDays == rentDays)&&(identical(other.carBookModel, carBookModel) || other.carBookModel == carBookModel)&&(identical(other.isShowCancelButton, isShowCancelButton) || other.isShowCancelButton == isShowCancelButton));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,rentDays,carBookModel,isShowCancelButton);

@override
String toString() {
  return 'CarBookState(isLoading: $isLoading, error: $error, rentDays: $rentDays, carBookModel: $carBookModel, isShowCancelButton: $isShowCancelButton)';
}


}

/// @nodoc
abstract mixin class _$CarBookStateCopyWith<$Res> implements $CarBookStateCopyWith<$Res> {
  factory _$CarBookStateCopyWith(_CarBookState value, $Res Function(_CarBookState) _then) = __$CarBookStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, int rentDays, CarBookDataModel? carBookModel, bool isShowCancelButton
});


@override $CarBookDataModelCopyWith<$Res>? get carBookModel;

}
/// @nodoc
class __$CarBookStateCopyWithImpl<$Res>
    implements _$CarBookStateCopyWith<$Res> {
  __$CarBookStateCopyWithImpl(this._self, this._then);

  final _CarBookState _self;
  final $Res Function(_CarBookState) _then;

/// Create a copy of CarBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? rentDays = null,Object? carBookModel = freezed,Object? isShowCancelButton = null,}) {
  return _then(_CarBookState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,rentDays: null == rentDays ? _self.rentDays : rentDays // ignore: cast_nullable_to_non_nullable
as int,carBookModel: freezed == carBookModel ? _self.carBookModel : carBookModel // ignore: cast_nullable_to_non_nullable
as CarBookDataModel?,isShowCancelButton: null == isShowCancelButton ? _self.isShowCancelButton : isShowCancelButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CarBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarBookDataModelCopyWith<$Res>? get carBookModel {
    if (_self.carBookModel == null) {
    return null;
  }

  return $CarBookDataModelCopyWith<$Res>(_self.carBookModel!, (value) {
    return _then(_self.copyWith(carBookModel: value));
  });
}
}

// dart format on
