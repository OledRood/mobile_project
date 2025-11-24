// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarDetails {

 String get id; String get name; String get mark; String get description; bool get isFavorite; String get location; String get imageUrlDetail; String get imageUrlCard; String get pricePerDay; String get transmission; String get fuel; String get priceOfDeposit; String get priceOfInsurance; String get status;
/// Create a copy of CarDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarDetailsCopyWith<CarDetails> get copyWith => _$CarDetailsCopyWithImpl<CarDetails>(this as CarDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrlDetail, imageUrlDetail) || other.imageUrlDetail == imageUrlDetail)&&(identical(other.imageUrlCard, imageUrlCard) || other.imageUrlCard == imageUrlCard)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.fuel, fuel) || other.fuel == fuel)&&(identical(other.priceOfDeposit, priceOfDeposit) || other.priceOfDeposit == priceOfDeposit)&&(identical(other.priceOfInsurance, priceOfInsurance) || other.priceOfInsurance == priceOfInsurance)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,mark,description,isFavorite,location,imageUrlDetail,imageUrlCard,pricePerDay,transmission,fuel,priceOfDeposit,priceOfInsurance,status);

@override
String toString() {
  return 'CarDetails(id: $id, name: $name, mark: $mark, description: $description, isFavorite: $isFavorite, location: $location, imageUrlDetail: $imageUrlDetail, imageUrlCard: $imageUrlCard, pricePerDay: $pricePerDay, transmission: $transmission, fuel: $fuel, priceOfDeposit: $priceOfDeposit, priceOfInsurance: $priceOfInsurance, status: $status)';
}


}

/// @nodoc
abstract mixin class $CarDetailsCopyWith<$Res>  {
  factory $CarDetailsCopyWith(CarDetails value, $Res Function(CarDetails) _then) = _$CarDetailsCopyWithImpl;
@useResult
$Res call({
 String id, String name, String mark, String description, bool isFavorite, String location, String imageUrlDetail, String imageUrlCard, String pricePerDay, String transmission, String fuel, String priceOfDeposit, String priceOfInsurance, String status
});




}
/// @nodoc
class _$CarDetailsCopyWithImpl<$Res>
    implements $CarDetailsCopyWith<$Res> {
  _$CarDetailsCopyWithImpl(this._self, this._then);

  final CarDetails _self;
  final $Res Function(CarDetails) _then;

/// Create a copy of CarDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? mark = null,Object? description = null,Object? isFavorite = null,Object? location = null,Object? imageUrlDetail = null,Object? imageUrlCard = null,Object? pricePerDay = null,Object? transmission = null,Object? fuel = null,Object? priceOfDeposit = null,Object? priceOfInsurance = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mark: null == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrlDetail: null == imageUrlDetail ? _self.imageUrlDetail : imageUrlDetail // ignore: cast_nullable_to_non_nullable
as String,imageUrlCard: null == imageUrlCard ? _self.imageUrlCard : imageUrlCard // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,fuel: null == fuel ? _self.fuel : fuel // ignore: cast_nullable_to_non_nullable
as String,priceOfDeposit: null == priceOfDeposit ? _self.priceOfDeposit : priceOfDeposit // ignore: cast_nullable_to_non_nullable
as String,priceOfInsurance: null == priceOfInsurance ? _self.priceOfInsurance : priceOfInsurance // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CarDetails].
extension CarDetailsPatterns on CarDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarDetails value)  $default,){
final _that = this;
switch (_that) {
case _CarDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarDetails value)?  $default,){
final _that = this;
switch (_that) {
case _CarDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String mark,  String description,  bool isFavorite,  String location,  String imageUrlDetail,  String imageUrlCard,  String pricePerDay,  String transmission,  String fuel,  String priceOfDeposit,  String priceOfInsurance,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarDetails() when $default != null:
return $default(_that.id,_that.name,_that.mark,_that.description,_that.isFavorite,_that.location,_that.imageUrlDetail,_that.imageUrlCard,_that.pricePerDay,_that.transmission,_that.fuel,_that.priceOfDeposit,_that.priceOfInsurance,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String mark,  String description,  bool isFavorite,  String location,  String imageUrlDetail,  String imageUrlCard,  String pricePerDay,  String transmission,  String fuel,  String priceOfDeposit,  String priceOfInsurance,  String status)  $default,) {final _that = this;
switch (_that) {
case _CarDetails():
return $default(_that.id,_that.name,_that.mark,_that.description,_that.isFavorite,_that.location,_that.imageUrlDetail,_that.imageUrlCard,_that.pricePerDay,_that.transmission,_that.fuel,_that.priceOfDeposit,_that.priceOfInsurance,_that.status);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String mark,  String description,  bool isFavorite,  String location,  String imageUrlDetail,  String imageUrlCard,  String pricePerDay,  String transmission,  String fuel,  String priceOfDeposit,  String priceOfInsurance,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CarDetails() when $default != null:
return $default(_that.id,_that.name,_that.mark,_that.description,_that.isFavorite,_that.location,_that.imageUrlDetail,_that.imageUrlCard,_that.pricePerDay,_that.transmission,_that.fuel,_that.priceOfDeposit,_that.priceOfInsurance,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _CarDetails implements CarDetails {
  const _CarDetails({required this.id, required this.name, required this.mark, required this.description, required this.isFavorite, required this.location, required this.imageUrlDetail, required this.imageUrlCard, required this.pricePerDay, required this.transmission, required this.fuel, required this.priceOfDeposit, required this.priceOfInsurance, required this.status});
  

@override final  String id;
@override final  String name;
@override final  String mark;
@override final  String description;
@override final  bool isFavorite;
@override final  String location;
@override final  String imageUrlDetail;
@override final  String imageUrlCard;
@override final  String pricePerDay;
@override final  String transmission;
@override final  String fuel;
@override final  String priceOfDeposit;
@override final  String priceOfInsurance;
@override final  String status;

/// Create a copy of CarDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarDetailsCopyWith<_CarDetails> get copyWith => __$CarDetailsCopyWithImpl<_CarDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrlDetail, imageUrlDetail) || other.imageUrlDetail == imageUrlDetail)&&(identical(other.imageUrlCard, imageUrlCard) || other.imageUrlCard == imageUrlCard)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.fuel, fuel) || other.fuel == fuel)&&(identical(other.priceOfDeposit, priceOfDeposit) || other.priceOfDeposit == priceOfDeposit)&&(identical(other.priceOfInsurance, priceOfInsurance) || other.priceOfInsurance == priceOfInsurance)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,mark,description,isFavorite,location,imageUrlDetail,imageUrlCard,pricePerDay,transmission,fuel,priceOfDeposit,priceOfInsurance,status);

@override
String toString() {
  return 'CarDetails(id: $id, name: $name, mark: $mark, description: $description, isFavorite: $isFavorite, location: $location, imageUrlDetail: $imageUrlDetail, imageUrlCard: $imageUrlCard, pricePerDay: $pricePerDay, transmission: $transmission, fuel: $fuel, priceOfDeposit: $priceOfDeposit, priceOfInsurance: $priceOfInsurance, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CarDetailsCopyWith<$Res> implements $CarDetailsCopyWith<$Res> {
  factory _$CarDetailsCopyWith(_CarDetails value, $Res Function(_CarDetails) _then) = __$CarDetailsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String mark, String description, bool isFavorite, String location, String imageUrlDetail, String imageUrlCard, String pricePerDay, String transmission, String fuel, String priceOfDeposit, String priceOfInsurance, String status
});




}
/// @nodoc
class __$CarDetailsCopyWithImpl<$Res>
    implements _$CarDetailsCopyWith<$Res> {
  __$CarDetailsCopyWithImpl(this._self, this._then);

  final _CarDetails _self;
  final $Res Function(_CarDetails) _then;

/// Create a copy of CarDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? mark = null,Object? description = null,Object? isFavorite = null,Object? location = null,Object? imageUrlDetail = null,Object? imageUrlCard = null,Object? pricePerDay = null,Object? transmission = null,Object? fuel = null,Object? priceOfDeposit = null,Object? priceOfInsurance = null,Object? status = null,}) {
  return _then(_CarDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mark: null == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrlDetail: null == imageUrlDetail ? _self.imageUrlDetail : imageUrlDetail // ignore: cast_nullable_to_non_nullable
as String,imageUrlCard: null == imageUrlCard ? _self.imageUrlCard : imageUrlCard // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,fuel: null == fuel ? _self.fuel : fuel // ignore: cast_nullable_to_non_nullable
as String,priceOfDeposit: null == priceOfDeposit ? _self.priceOfDeposit : priceOfDeposit // ignore: cast_nullable_to_non_nullable
as String,priceOfInsurance: null == priceOfInsurance ? _self.priceOfInsurance : priceOfInsurance // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
