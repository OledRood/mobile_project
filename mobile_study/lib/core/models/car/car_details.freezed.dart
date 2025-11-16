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

 String get id; String get name; String get description; bool get isFavorite; String get location; String get imageUrl; String get pricePerDay;
/// Create a copy of CarDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarDetailsCopyWith<CarDetails> get copyWith => _$CarDetailsCopyWithImpl<CarDetails>(this as CarDetails, _$identity);

  /// Serializes this CarDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isFavorite,location,imageUrl,pricePerDay);

@override
String toString() {
  return 'CarDetails(id: $id, name: $name, description: $description, isFavorite: $isFavorite, location: $location, imageUrl: $imageUrl, pricePerDay: $pricePerDay)';
}


}

/// @nodoc
abstract mixin class $CarDetailsCopyWith<$Res>  {
  factory $CarDetailsCopyWith(CarDetails value, $Res Function(CarDetails) _then) = _$CarDetailsCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, bool isFavorite, String location, String imageUrl, String pricePerDay
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? isFavorite = null,Object? location = null,Object? imageUrl = null,Object? pricePerDay = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  bool isFavorite,  String location,  String imageUrl,  String pricePerDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarDetails() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isFavorite,_that.location,_that.imageUrl,_that.pricePerDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  bool isFavorite,  String location,  String imageUrl,  String pricePerDay)  $default,) {final _that = this;
switch (_that) {
case _CarDetails():
return $default(_that.id,_that.name,_that.description,_that.isFavorite,_that.location,_that.imageUrl,_that.pricePerDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  bool isFavorite,  String location,  String imageUrl,  String pricePerDay)?  $default,) {final _that = this;
switch (_that) {
case _CarDetails() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isFavorite,_that.location,_that.imageUrl,_that.pricePerDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarDetails implements CarDetails {
  const _CarDetails({required this.id, required this.name, required this.description, required this.isFavorite, required this.location, required this.imageUrl, required this.pricePerDay});
  factory _CarDetails.fromJson(Map<String, dynamic> json) => _$CarDetailsFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  bool isFavorite;
@override final  String location;
@override final  String imageUrl;
@override final  String pricePerDay;

/// Create a copy of CarDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarDetailsCopyWith<_CarDetails> get copyWith => __$CarDetailsCopyWithImpl<_CarDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.pricePerDay, pricePerDay) || other.pricePerDay == pricePerDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isFavorite,location,imageUrl,pricePerDay);

@override
String toString() {
  return 'CarDetails(id: $id, name: $name, description: $description, isFavorite: $isFavorite, location: $location, imageUrl: $imageUrl, pricePerDay: $pricePerDay)';
}


}

/// @nodoc
abstract mixin class _$CarDetailsCopyWith<$Res> implements $CarDetailsCopyWith<$Res> {
  factory _$CarDetailsCopyWith(_CarDetails value, $Res Function(_CarDetails) _then) = __$CarDetailsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, bool isFavorite, String location, String imageUrl, String pricePerDay
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? isFavorite = null,Object? location = null,Object? imageUrl = null,Object? pricePerDay = null,}) {
  return _then(_CarDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,pricePerDay: null == pricePerDay ? _self.pricePerDay : pricePerDay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
