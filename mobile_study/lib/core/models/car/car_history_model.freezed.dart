// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarHistoryModel {

@JsonKey(name: "id") String get rentId; RentStatus get status; String get name;@JsonKey(name: "start_rent_date") String get startRentDate;@JsonKey(name: "end_rent_date") String get endRentDate;
/// Create a copy of CarHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarHistoryModelCopyWith<CarHistoryModel> get copyWith => _$CarHistoryModelCopyWithImpl<CarHistoryModel>(this as CarHistoryModel, _$identity);

  /// Serializes this CarHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarHistoryModel&&(identical(other.rentId, rentId) || other.rentId == rentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.startRentDate, startRentDate) || other.startRentDate == startRentDate)&&(identical(other.endRentDate, endRentDate) || other.endRentDate == endRentDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rentId,status,name,startRentDate,endRentDate);

@override
String toString() {
  return 'CarHistoryModel(rentId: $rentId, status: $status, name: $name, startRentDate: $startRentDate, endRentDate: $endRentDate)';
}


}

/// @nodoc
abstract mixin class $CarHistoryModelCopyWith<$Res>  {
  factory $CarHistoryModelCopyWith(CarHistoryModel value, $Res Function(CarHistoryModel) _then) = _$CarHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String rentId, RentStatus status, String name,@JsonKey(name: "start_rent_date") String startRentDate,@JsonKey(name: "end_rent_date") String endRentDate
});




}
/// @nodoc
class _$CarHistoryModelCopyWithImpl<$Res>
    implements $CarHistoryModelCopyWith<$Res> {
  _$CarHistoryModelCopyWithImpl(this._self, this._then);

  final CarHistoryModel _self;
  final $Res Function(CarHistoryModel) _then;

/// Create a copy of CarHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rentId = null,Object? status = null,Object? name = null,Object? startRentDate = null,Object? endRentDate = null,}) {
  return _then(_self.copyWith(
rentId: null == rentId ? _self.rentId : rentId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RentStatus,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startRentDate: null == startRentDate ? _self.startRentDate : startRentDate // ignore: cast_nullable_to_non_nullable
as String,endRentDate: null == endRentDate ? _self.endRentDate : endRentDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CarHistoryModel].
extension CarHistoryModelPatterns on CarHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CarHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CarHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String rentId,  RentStatus status,  String name, @JsonKey(name: "start_rent_date")  String startRentDate, @JsonKey(name: "end_rent_date")  String endRentDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarHistoryModel() when $default != null:
return $default(_that.rentId,_that.status,_that.name,_that.startRentDate,_that.endRentDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String rentId,  RentStatus status,  String name, @JsonKey(name: "start_rent_date")  String startRentDate, @JsonKey(name: "end_rent_date")  String endRentDate)  $default,) {final _that = this;
switch (_that) {
case _CarHistoryModel():
return $default(_that.rentId,_that.status,_that.name,_that.startRentDate,_that.endRentDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String rentId,  RentStatus status,  String name, @JsonKey(name: "start_rent_date")  String startRentDate, @JsonKey(name: "end_rent_date")  String endRentDate)?  $default,) {final _that = this;
switch (_that) {
case _CarHistoryModel() when $default != null:
return $default(_that.rentId,_that.status,_that.name,_that.startRentDate,_that.endRentDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarHistoryModel extends CarHistoryModel {
  const _CarHistoryModel({@JsonKey(name: "id") required this.rentId, required this.status, required this.name, @JsonKey(name: "start_rent_date") required this.startRentDate, @JsonKey(name: "end_rent_date") required this.endRentDate}): super._();
  factory _CarHistoryModel.fromJson(Map<String, dynamic> json) => _$CarHistoryModelFromJson(json);

@override@JsonKey(name: "id") final  String rentId;
@override final  RentStatus status;
@override final  String name;
@override@JsonKey(name: "start_rent_date") final  String startRentDate;
@override@JsonKey(name: "end_rent_date") final  String endRentDate;

/// Create a copy of CarHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarHistoryModelCopyWith<_CarHistoryModel> get copyWith => __$CarHistoryModelCopyWithImpl<_CarHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarHistoryModel&&(identical(other.rentId, rentId) || other.rentId == rentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.startRentDate, startRentDate) || other.startRentDate == startRentDate)&&(identical(other.endRentDate, endRentDate) || other.endRentDate == endRentDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rentId,status,name,startRentDate,endRentDate);

@override
String toString() {
  return 'CarHistoryModel(rentId: $rentId, status: $status, name: $name, startRentDate: $startRentDate, endRentDate: $endRentDate)';
}


}

/// @nodoc
abstract mixin class _$CarHistoryModelCopyWith<$Res> implements $CarHistoryModelCopyWith<$Res> {
  factory _$CarHistoryModelCopyWith(_CarHistoryModel value, $Res Function(_CarHistoryModel) _then) = __$CarHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String rentId, RentStatus status, String name,@JsonKey(name: "start_rent_date") String startRentDate,@JsonKey(name: "end_rent_date") String endRentDate
});




}
/// @nodoc
class __$CarHistoryModelCopyWithImpl<$Res>
    implements _$CarHistoryModelCopyWith<$Res> {
  __$CarHistoryModelCopyWithImpl(this._self, this._then);

  final _CarHistoryModel _self;
  final $Res Function(_CarHistoryModel) _then;

/// Create a copy of CarHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rentId = null,Object? status = null,Object? name = null,Object? startRentDate = null,Object? endRentDate = null,}) {
  return _then(_CarHistoryModel(
rentId: null == rentId ? _self.rentId : rentId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RentStatus,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startRentDate: null == startRentDate ? _self.startRentDate : startRentDate // ignore: cast_nullable_to_non_nullable
as String,endRentDate: null == endRentDate ? _self.endRentDate : endRentDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
