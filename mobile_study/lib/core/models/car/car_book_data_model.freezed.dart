// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_book_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarBookDataModel {

 String get id;@JsonKey(name: "car") CarCardModel get carCardModel;@JsonKey(name: "start_rent_date") String get startRentDate;@JsonKey(name: "end_rent_date") String get endRentDate;@JsonKey(name: "location") String get adress;@JsonKey(name: "price_of_insurance") String get priceOfInsurance;@JsonKey(name: "total_price") String get totalPrice;@JsonKey(name: "driver_name") String get driverName;@JsonKey(name: "driver_license_number") String get driverLicenseNumber;@JsonEnum() RentStatus get status;
/// Create a copy of CarBookDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarBookDataModelCopyWith<CarBookDataModel> get copyWith => _$CarBookDataModelCopyWithImpl<CarBookDataModel>(this as CarBookDataModel, _$identity);

  /// Serializes this CarBookDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarBookDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.carCardModel, carCardModel) || other.carCardModel == carCardModel)&&(identical(other.startRentDate, startRentDate) || other.startRentDate == startRentDate)&&(identical(other.endRentDate, endRentDate) || other.endRentDate == endRentDate)&&(identical(other.adress, adress) || other.adress == adress)&&(identical(other.priceOfInsurance, priceOfInsurance) || other.priceOfInsurance == priceOfInsurance)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverLicenseNumber, driverLicenseNumber) || other.driverLicenseNumber == driverLicenseNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,carCardModel,startRentDate,endRentDate,adress,priceOfInsurance,totalPrice,driverName,driverLicenseNumber,status);

@override
String toString() {
  return 'CarBookDataModel(id: $id, carCardModel: $carCardModel, startRentDate: $startRentDate, endRentDate: $endRentDate, adress: $adress, priceOfInsurance: $priceOfInsurance, totalPrice: $totalPrice, driverName: $driverName, driverLicenseNumber: $driverLicenseNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class $CarBookDataModelCopyWith<$Res>  {
  factory $CarBookDataModelCopyWith(CarBookDataModel value, $Res Function(CarBookDataModel) _then) = _$CarBookDataModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "car") CarCardModel carCardModel,@JsonKey(name: "start_rent_date") String startRentDate,@JsonKey(name: "end_rent_date") String endRentDate,@JsonKey(name: "location") String adress,@JsonKey(name: "price_of_insurance") String priceOfInsurance,@JsonKey(name: "total_price") String totalPrice,@JsonKey(name: "driver_name") String driverName,@JsonKey(name: "driver_license_number") String driverLicenseNumber,@JsonEnum() RentStatus status
});


$CarCardModelCopyWith<$Res> get carCardModel;

}
/// @nodoc
class _$CarBookDataModelCopyWithImpl<$Res>
    implements $CarBookDataModelCopyWith<$Res> {
  _$CarBookDataModelCopyWithImpl(this._self, this._then);

  final CarBookDataModel _self;
  final $Res Function(CarBookDataModel) _then;

/// Create a copy of CarBookDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? carCardModel = null,Object? startRentDate = null,Object? endRentDate = null,Object? adress = null,Object? priceOfInsurance = null,Object? totalPrice = null,Object? driverName = null,Object? driverLicenseNumber = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,carCardModel: null == carCardModel ? _self.carCardModel : carCardModel // ignore: cast_nullable_to_non_nullable
as CarCardModel,startRentDate: null == startRentDate ? _self.startRentDate : startRentDate // ignore: cast_nullable_to_non_nullable
as String,endRentDate: null == endRentDate ? _self.endRentDate : endRentDate // ignore: cast_nullable_to_non_nullable
as String,adress: null == adress ? _self.adress : adress // ignore: cast_nullable_to_non_nullable
as String,priceOfInsurance: null == priceOfInsurance ? _self.priceOfInsurance : priceOfInsurance // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,driverName: null == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String,driverLicenseNumber: null == driverLicenseNumber ? _self.driverLicenseNumber : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RentStatus,
  ));
}
/// Create a copy of CarBookDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarCardModelCopyWith<$Res> get carCardModel {
  
  return $CarCardModelCopyWith<$Res>(_self.carCardModel, (value) {
    return _then(_self.copyWith(carCardModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [CarBookDataModel].
extension CarBookDataModelPatterns on CarBookDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarBookDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarBookDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarBookDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CarBookDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarBookDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CarBookDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "car")  CarCardModel carCardModel, @JsonKey(name: "start_rent_date")  String startRentDate, @JsonKey(name: "end_rent_date")  String endRentDate, @JsonKey(name: "location")  String adress, @JsonKey(name: "price_of_insurance")  String priceOfInsurance, @JsonKey(name: "total_price")  String totalPrice, @JsonKey(name: "driver_name")  String driverName, @JsonKey(name: "driver_license_number")  String driverLicenseNumber, @JsonEnum()  RentStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarBookDataModel() when $default != null:
return $default(_that.id,_that.carCardModel,_that.startRentDate,_that.endRentDate,_that.adress,_that.priceOfInsurance,_that.totalPrice,_that.driverName,_that.driverLicenseNumber,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: "car")  CarCardModel carCardModel, @JsonKey(name: "start_rent_date")  String startRentDate, @JsonKey(name: "end_rent_date")  String endRentDate, @JsonKey(name: "location")  String adress, @JsonKey(name: "price_of_insurance")  String priceOfInsurance, @JsonKey(name: "total_price")  String totalPrice, @JsonKey(name: "driver_name")  String driverName, @JsonKey(name: "driver_license_number")  String driverLicenseNumber, @JsonEnum()  RentStatus status)  $default,) {final _that = this;
switch (_that) {
case _CarBookDataModel():
return $default(_that.id,_that.carCardModel,_that.startRentDate,_that.endRentDate,_that.adress,_that.priceOfInsurance,_that.totalPrice,_that.driverName,_that.driverLicenseNumber,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: "car")  CarCardModel carCardModel, @JsonKey(name: "start_rent_date")  String startRentDate, @JsonKey(name: "end_rent_date")  String endRentDate, @JsonKey(name: "location")  String adress, @JsonKey(name: "price_of_insurance")  String priceOfInsurance, @JsonKey(name: "total_price")  String totalPrice, @JsonKey(name: "driver_name")  String driverName, @JsonKey(name: "driver_license_number")  String driverLicenseNumber, @JsonEnum()  RentStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CarBookDataModel() when $default != null:
return $default(_that.id,_that.carCardModel,_that.startRentDate,_that.endRentDate,_that.adress,_that.priceOfInsurance,_that.totalPrice,_that.driverName,_that.driverLicenseNumber,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarBookDataModel extends CarBookDataModel {
  const _CarBookDataModel({required this.id, @JsonKey(name: "car") required this.carCardModel, @JsonKey(name: "start_rent_date") required this.startRentDate, @JsonKey(name: "end_rent_date") required this.endRentDate, @JsonKey(name: "location") required this.adress, @JsonKey(name: "price_of_insurance") required this.priceOfInsurance, @JsonKey(name: "total_price") required this.totalPrice, @JsonKey(name: "driver_name") required this.driverName, @JsonKey(name: "driver_license_number") required this.driverLicenseNumber, @JsonEnum() required this.status}): super._();
  factory _CarBookDataModel.fromJson(Map<String, dynamic> json) => _$CarBookDataModelFromJson(json);

@override final  String id;
@override@JsonKey(name: "car") final  CarCardModel carCardModel;
@override@JsonKey(name: "start_rent_date") final  String startRentDate;
@override@JsonKey(name: "end_rent_date") final  String endRentDate;
@override@JsonKey(name: "location") final  String adress;
@override@JsonKey(name: "price_of_insurance") final  String priceOfInsurance;
@override@JsonKey(name: "total_price") final  String totalPrice;
@override@JsonKey(name: "driver_name") final  String driverName;
@override@JsonKey(name: "driver_license_number") final  String driverLicenseNumber;
@override@JsonEnum() final  RentStatus status;

/// Create a copy of CarBookDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarBookDataModelCopyWith<_CarBookDataModel> get copyWith => __$CarBookDataModelCopyWithImpl<_CarBookDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarBookDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarBookDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.carCardModel, carCardModel) || other.carCardModel == carCardModel)&&(identical(other.startRentDate, startRentDate) || other.startRentDate == startRentDate)&&(identical(other.endRentDate, endRentDate) || other.endRentDate == endRentDate)&&(identical(other.adress, adress) || other.adress == adress)&&(identical(other.priceOfInsurance, priceOfInsurance) || other.priceOfInsurance == priceOfInsurance)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverLicenseNumber, driverLicenseNumber) || other.driverLicenseNumber == driverLicenseNumber)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,carCardModel,startRentDate,endRentDate,adress,priceOfInsurance,totalPrice,driverName,driverLicenseNumber,status);

@override
String toString() {
  return 'CarBookDataModel(id: $id, carCardModel: $carCardModel, startRentDate: $startRentDate, endRentDate: $endRentDate, adress: $adress, priceOfInsurance: $priceOfInsurance, totalPrice: $totalPrice, driverName: $driverName, driverLicenseNumber: $driverLicenseNumber, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CarBookDataModelCopyWith<$Res> implements $CarBookDataModelCopyWith<$Res> {
  factory _$CarBookDataModelCopyWith(_CarBookDataModel value, $Res Function(_CarBookDataModel) _then) = __$CarBookDataModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "car") CarCardModel carCardModel,@JsonKey(name: "start_rent_date") String startRentDate,@JsonKey(name: "end_rent_date") String endRentDate,@JsonKey(name: "location") String adress,@JsonKey(name: "price_of_insurance") String priceOfInsurance,@JsonKey(name: "total_price") String totalPrice,@JsonKey(name: "driver_name") String driverName,@JsonKey(name: "driver_license_number") String driverLicenseNumber,@JsonEnum() RentStatus status
});


@override $CarCardModelCopyWith<$Res> get carCardModel;

}
/// @nodoc
class __$CarBookDataModelCopyWithImpl<$Res>
    implements _$CarBookDataModelCopyWith<$Res> {
  __$CarBookDataModelCopyWithImpl(this._self, this._then);

  final _CarBookDataModel _self;
  final $Res Function(_CarBookDataModel) _then;

/// Create a copy of CarBookDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? carCardModel = null,Object? startRentDate = null,Object? endRentDate = null,Object? adress = null,Object? priceOfInsurance = null,Object? totalPrice = null,Object? driverName = null,Object? driverLicenseNumber = null,Object? status = null,}) {
  return _then(_CarBookDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,carCardModel: null == carCardModel ? _self.carCardModel : carCardModel // ignore: cast_nullable_to_non_nullable
as CarCardModel,startRentDate: null == startRentDate ? _self.startRentDate : startRentDate // ignore: cast_nullable_to_non_nullable
as String,endRentDate: null == endRentDate ? _self.endRentDate : endRentDate // ignore: cast_nullable_to_non_nullable
as String,adress: null == adress ? _self.adress : adress // ignore: cast_nullable_to_non_nullable
as String,priceOfInsurance: null == priceOfInsurance ? _self.priceOfInsurance : priceOfInsurance // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,driverName: null == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String,driverLicenseNumber: null == driverLicenseNumber ? _self.driverLicenseNumber : driverLicenseNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RentStatus,
  ));
}

/// Create a copy of CarBookDataModel
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
