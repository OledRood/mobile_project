// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddCarState {

 String? get address; int? get year; String? get mark; String? get model; TransmissionType? get transmission; int? get mileage; String? get description; List<String> get photos; bool get isLoading;
/// Create a copy of AddCarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddCarStateCopyWith<AddCarState> get copyWith => _$AddCarStateCopyWithImpl<AddCarState>(this as AddCarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddCarState&&(identical(other.address, address) || other.address == address)&&(identical(other.year, year) || other.year == year)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.model, model) || other.model == model)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,address,year,mark,model,transmission,mileage,description,const DeepCollectionEquality().hash(photos),isLoading);

@override
String toString() {
  return 'AddCarState(address: $address, year: $year, mark: $mark, model: $model, transmission: $transmission, mileage: $mileage, description: $description, photos: $photos, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $AddCarStateCopyWith<$Res>  {
  factory $AddCarStateCopyWith(AddCarState value, $Res Function(AddCarState) _then) = _$AddCarStateCopyWithImpl;
@useResult
$Res call({
 String? address, int? year, String? mark, String? model, TransmissionType? transmission, int? mileage, String? description, List<String> photos, bool isLoading
});




}
/// @nodoc
class _$AddCarStateCopyWithImpl<$Res>
    implements $AddCarStateCopyWith<$Res> {
  _$AddCarStateCopyWithImpl(this._self, this._then);

  final AddCarState _self;
  final $Res Function(AddCarState) _then;

/// Create a copy of AddCarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = freezed,Object? year = freezed,Object? mark = freezed,Object? model = freezed,Object? transmission = freezed,Object? mileage = freezed,Object? description = freezed,Object? photos = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as TransmissionType?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddCarState].
extension AddCarStatePatterns on AddCarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddCarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddCarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddCarState value)  $default,){
final _that = this;
switch (_that) {
case _AddCarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddCarState value)?  $default,){
final _that = this;
switch (_that) {
case _AddCarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? address,  int? year,  String? mark,  String? model,  TransmissionType? transmission,  int? mileage,  String? description,  List<String> photos,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddCarState() when $default != null:
return $default(_that.address,_that.year,_that.mark,_that.model,_that.transmission,_that.mileage,_that.description,_that.photos,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? address,  int? year,  String? mark,  String? model,  TransmissionType? transmission,  int? mileage,  String? description,  List<String> photos,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _AddCarState():
return $default(_that.address,_that.year,_that.mark,_that.model,_that.transmission,_that.mileage,_that.description,_that.photos,_that.isLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? address,  int? year,  String? mark,  String? model,  TransmissionType? transmission,  int? mileage,  String? description,  List<String> photos,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _AddCarState() when $default != null:
return $default(_that.address,_that.year,_that.mark,_that.model,_that.transmission,_that.mileage,_that.description,_that.photos,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _AddCarState extends AddCarState {
  const _AddCarState({this.address, this.year, this.mark, this.model, this.transmission, this.mileage, this.description, final  List<String> photos = const [], this.isLoading = false}): _photos = photos,super._();
  

@override final  String? address;
@override final  int? year;
@override final  String? mark;
@override final  String? model;
@override final  TransmissionType? transmission;
@override final  int? mileage;
@override final  String? description;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of AddCarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCarStateCopyWith<_AddCarState> get copyWith => __$AddCarStateCopyWithImpl<_AddCarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCarState&&(identical(other.address, address) || other.address == address)&&(identical(other.year, year) || other.year == year)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.model, model) || other.model == model)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,address,year,mark,model,transmission,mileage,description,const DeepCollectionEquality().hash(_photos),isLoading);

@override
String toString() {
  return 'AddCarState(address: $address, year: $year, mark: $mark, model: $model, transmission: $transmission, mileage: $mileage, description: $description, photos: $photos, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$AddCarStateCopyWith<$Res> implements $AddCarStateCopyWith<$Res> {
  factory _$AddCarStateCopyWith(_AddCarState value, $Res Function(_AddCarState) _then) = __$AddCarStateCopyWithImpl;
@override @useResult
$Res call({
 String? address, int? year, String? mark, String? model, TransmissionType? transmission, int? mileage, String? description, List<String> photos, bool isLoading
});




}
/// @nodoc
class __$AddCarStateCopyWithImpl<$Res>
    implements _$AddCarStateCopyWith<$Res> {
  __$AddCarStateCopyWithImpl(this._self, this._then);

  final _AddCarState _self;
  final $Res Function(_AddCarState) _then;

/// Create a copy of AddCarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = freezed,Object? year = freezed,Object? mark = freezed,Object? model = freezed,Object? transmission = freezed,Object? mileage = freezed,Object? description = freezed,Object? photos = null,Object? isLoading = null,}) {
  return _then(_AddCarState(
address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as TransmissionType?,mileage: freezed == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
