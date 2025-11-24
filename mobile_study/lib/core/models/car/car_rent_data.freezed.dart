// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_rent_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarRentData {

 String get id; String get autoName; String get autoMark; CarCardModel get carCardModel; String get pricePerDay; String? get startRentDate; String? get endRentDate; String get adress; String get priceOfInsurance; String get totalPrice; String get priceOfDeposit; String? get driverName; String? get driverLicenseNumber; String get status;
/// Create a copy of CarRentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarRentDataCopyWith<CarRentData> get copyWith => _$CarRentDataCopyWithImpl<CarRentData>(this as CarRentData, _$identity);

  /// Serializes this CarRentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarRentData&&(identical(other.id, id) || other.id == id)&&(identical(other.autoName, autoName) || other.autoName == autoName)&&(identical(other.autoMark, autoMark) || other.autoMark == autoMark)&&(identical(other.carCardModel, carCardModel) || other.carCardModel == carCardModel)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.startRentDate, startRentDate) || other.startRentDate == startRentDate)&&(identical(other.endRentDate, endRentDate) || other.endRentDate == endRentDate)&&(identical(other.adress, adress) || other.adress == adress)&&(identical(other.priceOfInsurance, priceOfInsurance) || other.priceOfInsurance == priceOfInsurance)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.priceOfDeposit, priceOfDeposit) || other.priceOfDeposit == priceOfDeposit)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverLicenseNumber, driverLicenseNumber) || other.driverLicenseNumber == driverLicenseNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,autoName,autoMark,carCardModel,pricePerDay,startRentDate,endRentDate,adress,priceOfInsurance,totalPrice,priceOfDeposit,driverName,driverLicenseNumber,status);

@override
String toString() {
  return 'CarRentData(id: $id, autoName: $autoName, autoMark: $autoMark, carCardModel: $carCardModel, pricePerDay: $pricePerDay, startRentDate: $startRentDate, endRentDate: $endRentDate, adress: $adress, priceOfInsurance: $priceOfInsurance, totalPrice: $totalPrice, priceOfDeposit: $priceOfDeposit, driverName: $driverName, driverLicenseNumber: $driverLicenseNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class $CarRentDataCopyWith<$Res>  {
  factory $CarRentDataCopyWith(CarRentData value, $Res Function(CarRentData) _then) = _$CarRentDataCopyWithImpl;
@useResult
$Res call({
 String id, String autoName, String autoMark, CarCardModel carCardModel, String pricePerDay, String? startRentDate, String? endRentDate, String adress, String priceOfInsurance, String totalPrice, String priceOfDeposit, String? driverName, String? driverLicenseNumber, String status
});


$CarCardModelCopyWith<$Res> get carCardModel;

}
/// @nodoc
class _$CarRentDataCopyWithImpl<$Res>
    implements $CarRentDataCopyWith<$Res> {
  _$CarRentDataCopyWithImpl(this._self, this._then);

  final CarRentData _self;
  final $Res Function(CarRentData) _then;

/// Create a copy of CarRentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? autoName = null,Object? autoMark = null,Object? carCardModel = null,Object? pricePerDay = null,Object? startRentDate = freezed,Object? endRentDate = freezed,Object? adress = null,Object? priceOfInsurance = null,Object? totalPrice = null,Object? priceOfDeposit = null,Object? driverName = freezed,Object? driverLicenseNumber = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,autoName: null == autoName ? _self.autoName : autoName // ignore: cast_nullable_to_non_nullable
as String,autoMark: null == autoMark ? _self.autoMark : autoMark // ignore: cast_nullable_to_non_nullable
as String,carCardModel: null == carCardModel ? _self.carCardModel : carCardModel // ignore: cast_nullable_to_non_nullable
as CarCardModel,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as String,startRentDate: freezed == startRentDate ? _self.startRentDate : startRentDate // ignore: cast_nullable_to_non_nullable
as String?,endRentDate: freezed == endRentDate ? _self.endRentDate : endRentDate // ignore: cast_nullable_to_non_nullable
as String?,adress: null == adress ? _self.adress : adress // ignore: cast_nullable_to_non_nullable
as String,priceOfInsurance: null == priceOfInsurance ? _self.priceOfInsurance : priceOfInsurance // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,priceOfDeposit: null == priceOfDeposit ? _self.priceOfDeposit : priceOfDeposit // ignore: cast_nullable_to_non_nullable
as String,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverLicenseNumber: freezed == driverLicenseNumber ? _self.driverLicenseNumber : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CarRentData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCardModelCopyWith<$Res> get carCardModel {
  
  return $CarCardModelCopyWith<$Res>(_self.carCardModel, (value) {
    return _then(_self.copyWith(carCardModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [CarRentData].
extension CarRentDataPatterns on CarRentData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarRentData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarRentData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarRentData value)  $default,){
final _that = this;
switch (_that) {
case _CarRentData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarRentData value)?  $default,){
final _that = this;
switch (_that) {
case _CarRentData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String autoName,  String autoMark,  CarCardModel carCardModel,  String pricePerDay,  String? startRentDate,  String? endRentDate,  String adress,  String priceOfInsurance,  String totalPrice,  String priceOfDeposit,  String? driverName,  String? driverLicenseNumber,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarRentData() when $default != null:
return $default(_that.id,_that.autoName,_that.autoMark,_that.carCardModel,_that.pricePerDay,_that.startRentDate,_that.endRentDate,_that.adress,_that.priceOfInsurance,_that.totalPrice,_that.priceOfDeposit,_that.driverName,_that.driverLicenseNumber,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String autoName,  String autoMark,  CarCardModel carCardModel,  String pricePerDay,  String? startRentDate,  String? endRentDate,  String adress,  String priceOfInsurance,  String totalPrice,  String priceOfDeposit,  String? driverName,  String? driverLicenseNumber,  String status)  $default,) {final _that = this;
switch (_that) {
case _CarRentData():
return $default(_that.id,_that.autoName,_that.autoMark,_that.carCardModel,_that.pricePerDay,_that.startRentDate,_that.endRentDate,_that.adress,_that.priceOfInsurance,_that.totalPrice,_that.priceOfDeposit,_that.driverName,_that.driverLicenseNumber,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String autoName,  String autoMark,  CarCardModel carCardModel,  String pricePerDay,  String? startRentDate,  String? endRentDate,  String adress,  String priceOfInsurance,  String totalPrice,  String priceOfDeposit,  String? driverName,  String? driverLicenseNumber,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CarRentData() when $default != null:
return $default(_that.id,_that.autoName,_that.autoMark,_that.carCardModel,_that.pricePerDay,_that.startRentDate,_that.endRentDate,_that.adress,_that.priceOfInsurance,_that.totalPrice,_that.priceOfDeposit,_that.driverName,_that.driverLicenseNumber,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarRentData extends CarRentData {
  const _CarRentData({required this.id, required this.autoName, required this.autoMark, required this.carCardModel, required this.pricePerDay, required this.startRentDate, required this.endRentDate, required this.adress, required this.priceOfInsurance, required this.totalPrice, required this.priceOfDeposit, this.driverName, this.driverLicenseNumber, required this.status}): super._();
  factory _CarRentData.fromJson(Map<String, dynamic> json) => _$CarRentDataFromJson(json);

@override final  String id;
@override final  String autoName;
@override final  String autoMark;
@override final  CarCardModel carCardModel;
@override final  String pricePerDay;
@override final  String? startRentDate;
@override final  String? endRentDate;
@override final  String adress;
@override final  String priceOfInsurance;
@override final  String totalPrice;
@override final  String priceOfDeposit;
@override final  String? driverName;
@override final  String? driverLicenseNumber;
@override final  String status;

/// Create a copy of CarRentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarRentDataCopyWith<_CarRentData> get copyWith => __$CarRentDataCopyWithImpl<_CarRentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarRentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarRentData&&(identical(other.id, id) || other.id == id)&&(identical(other.autoName, autoName) || other.autoName == autoName)&&(identical(other.autoMark, autoMark) || other.autoMark == autoMark)&&(identical(other.carCardModel, carCardModel) || other.carCardModel == carCardModel)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.startRentDate, startRentDate) || other.startRentDate == startRentDate)&&(identical(other.endRentDate, endRentDate) || other.endRentDate == endRentDate)&&(identical(other.adress, adress) || other.adress == adress)&&(identical(other.priceOfInsurance, priceOfInsurance) || other.priceOfInsurance == priceOfInsurance)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.priceOfDeposit, priceOfDeposit) || other.priceOfDeposit == priceOfDeposit)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverLicenseNumber, driverLicenseNumber) || other.driverLicenseNumber == driverLicenseNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,autoName,autoMark,carCardModel,pricePerDay,startRentDate,endRentDate,adress,priceOfInsurance,totalPrice,priceOfDeposit,driverName,driverLicenseNumber,status);

@override
String toString() {
  return 'CarRentData(id: $id, autoName: $autoName, autoMark: $autoMark, carCardModel: $carCardModel, pricePerDay: $pricePerDay, startRentDate: $startRentDate, endRentDate: $endRentDate, adress: $adress, priceOfInsurance: $priceOfInsurance, totalPrice: $totalPrice, priceOfDeposit: $priceOfDeposit, driverName: $driverName, driverLicenseNumber: $driverLicenseNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CarRentDataCopyWith<$Res> implements $CarRentDataCopyWith<$Res> {
  factory _$CarRentDataCopyWith(_CarRentData value, $Res Function(_CarRentData) _then) = __$CarRentDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String autoName, String autoMark, CarCardModel carCardModel, String pricePerDay, String? startRentDate, String? endRentDate, String adress, String priceOfInsurance, String totalPrice, String priceOfDeposit, String? driverName, String? driverLicenseNumber, String status
});


@override $CarCardModelCopyWith<$Res> get carCardModel;

}
/// @nodoc
class __$CarRentDataCopyWithImpl<$Res>
    implements _$CarRentDataCopyWith<$Res> {
  __$CarRentDataCopyWithImpl(this._self, this._then);

  final _CarRentData _self;
  final $Res Function(_CarRentData) _then;

/// Create a copy of CarRentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? autoName = null,Object? autoMark = null,Object? carCardModel = null,Object? pricePerDay = null,Object? startRentDate = freezed,Object? endRentDate = freezed,Object? adress = null,Object? priceOfInsurance = null,Object? totalPrice = null,Object? priceOfDeposit = null,Object? driverName = freezed,Object? driverLicenseNumber = freezed,Object? status = null,}) {
  return _then(_CarRentData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,autoName: null == autoName ? _self.autoName : autoName // ignore: cast_nullable_to_non_nullable
as String,autoMark: null == autoMark ? _self.autoMark : autoMark // ignore: cast_nullable_to_non_nullable
as String,carCardModel: null == carCardModel ? _self.carCardModel : carCardModel // ignore: cast_nullable_to_non_nullable
as CarCardModel,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as String,startRentDate: freezed == startRentDate ? _self.startRentDate : startRentDate // ignore: cast_nullable_to_non_nullable
as String?,endRentDate: freezed == endRentDate ? _self.endRentDate : endRentDate // ignore: cast_nullable_to_non_nullable
as String?,adress: null == adress ? _self.adress : adress // ignore: cast_nullable_to_non_nullable
as String,priceOfInsurance: null == priceOfInsurance ? _self.priceOfInsurance : priceOfInsurance // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,priceOfDeposit: null == priceOfDeposit ? _self.priceOfDeposit : priceOfDeposit // ignore: cast_nullable_to_non_nullable
as String,driverName: freezed == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String?,driverLicenseNumber: freezed == driverLicenseNumber ? _self.driverLicenseNumber : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CarRentData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCardModelCopyWith<$Res> get carCardModel {
  
  return $CarCardModelCopyWith<$Res>(_self.carCardModel, (value) {
    return _then(_self.copyWith(carCardModel: value));
  });
}
}

// dart format on
