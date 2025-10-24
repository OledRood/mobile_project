// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

 String get image; String get title; String get description; int get buttonIndex; String get buttonText;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.buttonIndex, buttonIndex) || other.buttonIndex == buttonIndex)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText));
}


@override
int get hashCode => Object.hash(runtimeType,image,title,description,buttonIndex,buttonText);

@override
String toString() {
  return 'OnboardingState(image: $image, title: $title, description: $description, buttonIndex: $buttonIndex, buttonText: $buttonText)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 String image, String title, String description, int buttonIndex, String buttonText
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? title = null,Object? description = null,Object? buttonIndex = null,Object? buttonText = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,buttonIndex: null == buttonIndex ? _self.buttonIndex : buttonIndex // ignore: cast_nullable_to_non_nullable
as int,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FirstState value)?  first,TResult Function( SecondState value)?  second,TResult Function( ThirdState value)?  third,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FirstState() when first != null:
return first(_that);case SecondState() when second != null:
return second(_that);case ThirdState() when third != null:
return third(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FirstState value)  first,required TResult Function( SecondState value)  second,required TResult Function( ThirdState value)  third,}){
final _that = this;
switch (_that) {
case FirstState():
return first(_that);case SecondState():
return second(_that);case ThirdState():
return third(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FirstState value)?  first,TResult? Function( SecondState value)?  second,TResult? Function( ThirdState value)?  third,}){
final _that = this;
switch (_that) {
case FirstState() when first != null:
return first(_that);case SecondState() when second != null:
return second(_that);case ThirdState() when third != null:
return third(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)?  first,TResult Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)?  second,TResult Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)?  third,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FirstState() when first != null:
return first(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case SecondState() when second != null:
return second(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case ThirdState() when third != null:
return third(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)  first,required TResult Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)  second,required TResult Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)  third,}) {final _that = this;
switch (_that) {
case FirstState():
return first(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case SecondState():
return second(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case ThirdState():
return third(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)?  first,TResult? Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)?  second,TResult? Function( String image,  String title,  String description,  int buttonIndex,  String buttonText)?  third,}) {final _that = this;
switch (_that) {
case FirstState() when first != null:
return first(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case SecondState() when second != null:
return second(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case ThirdState() when third != null:
return third(_that.image,_that.title,_that.description,_that.buttonIndex,_that.buttonText);case _:
  return null;

}
}

}

/// @nodoc


class FirstState implements OnboardingState {
  const FirstState({this.image = AppImages.onboarding1, this.title = "Аренда автомобилей", this.description = "Открой для себя удобный и доступный способ передвижения", this.buttonIndex = 0, this.buttonText = "Далее"});
  

@override@JsonKey() final  String image;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  int buttonIndex;
@override@JsonKey() final  String buttonText;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirstStateCopyWith<FirstState> get copyWith => _$FirstStateCopyWithImpl<FirstState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirstState&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.buttonIndex, buttonIndex) || other.buttonIndex == buttonIndex)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText));
}


@override
int get hashCode => Object.hash(runtimeType,image,title,description,buttonIndex,buttonText);

@override
String toString() {
  return 'OnboardingState.first(image: $image, title: $title, description: $description, buttonIndex: $buttonIndex, buttonText: $buttonText)';
}


}

/// @nodoc
abstract mixin class $FirstStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory $FirstStateCopyWith(FirstState value, $Res Function(FirstState) _then) = _$FirstStateCopyWithImpl;
@override @useResult
$Res call({
 String image, String title, String description, int buttonIndex, String buttonText
});




}
/// @nodoc
class _$FirstStateCopyWithImpl<$Res>
    implements $FirstStateCopyWith<$Res> {
  _$FirstStateCopyWithImpl(this._self, this._then);

  final FirstState _self;
  final $Res Function(FirstState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? title = null,Object? description = null,Object? buttonIndex = null,Object? buttonText = null,}) {
  return _then(FirstState(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,buttonIndex: null == buttonIndex ? _self.buttonIndex : buttonIndex // ignore: cast_nullable_to_non_nullable
as int,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SecondState implements OnboardingState {
  const SecondState({this.image = AppImages.onboarding2, this.title = 'Безопасно и удобно', this.description = "Арендуй автомобиль и наслаждайся его удобством", this.buttonIndex = 1, this.buttonText = "Далее"});
  

@override@JsonKey() final  String image;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  int buttonIndex;
@override@JsonKey() final  String buttonText;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondStateCopyWith<SecondState> get copyWith => _$SecondStateCopyWithImpl<SecondState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondState&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.buttonIndex, buttonIndex) || other.buttonIndex == buttonIndex)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText));
}


@override
int get hashCode => Object.hash(runtimeType,image,title,description,buttonIndex,buttonText);

@override
String toString() {
  return 'OnboardingState.second(image: $image, title: $title, description: $description, buttonIndex: $buttonIndex, buttonText: $buttonText)';
}


}

/// @nodoc
abstract mixin class $SecondStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory $SecondStateCopyWith(SecondState value, $Res Function(SecondState) _then) = _$SecondStateCopyWithImpl;
@override @useResult
$Res call({
 String image, String title, String description, int buttonIndex, String buttonText
});




}
/// @nodoc
class _$SecondStateCopyWithImpl<$Res>
    implements $SecondStateCopyWith<$Res> {
  _$SecondStateCopyWithImpl(this._self, this._then);

  final SecondState _self;
  final $Res Function(SecondState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? title = null,Object? description = null,Object? buttonIndex = null,Object? buttonText = null,}) {
  return _then(SecondState(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,buttonIndex: null == buttonIndex ? _self.buttonIndex : buttonIndex // ignore: cast_nullable_to_non_nullable
as int,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ThirdState implements OnboardingState {
  const ThirdState({this.image = AppImages.onboarding3, this.title = 'Лучшие предложения', this.description = "Выбирай понравившееся среди сотен доступных автомобилей", this.buttonIndex = 2, this.buttonText = "Поехали"});
  

@override@JsonKey() final  String image;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  int buttonIndex;
@override@JsonKey() final  String buttonText;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThirdStateCopyWith<ThirdState> get copyWith => _$ThirdStateCopyWithImpl<ThirdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThirdState&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.buttonIndex, buttonIndex) || other.buttonIndex == buttonIndex)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText));
}


@override
int get hashCode => Object.hash(runtimeType,image,title,description,buttonIndex,buttonText);

@override
String toString() {
  return 'OnboardingState.third(image: $image, title: $title, description: $description, buttonIndex: $buttonIndex, buttonText: $buttonText)';
}


}

/// @nodoc
abstract mixin class $ThirdStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory $ThirdStateCopyWith(ThirdState value, $Res Function(ThirdState) _then) = _$ThirdStateCopyWithImpl;
@override @useResult
$Res call({
 String image, String title, String description, int buttonIndex, String buttonText
});




}
/// @nodoc
class _$ThirdStateCopyWithImpl<$Res>
    implements $ThirdStateCopyWith<$Res> {
  _$ThirdStateCopyWithImpl(this._self, this._then);

  final ThirdState _self;
  final $Res Function(ThirdState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? title = null,Object? description = null,Object? buttonIndex = null,Object? buttonText = null,}) {
  return _then(ThirdState(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,buttonIndex: null == buttonIndex ? _self.buttonIndex : buttonIndex // ignore: cast_nullable_to_non_nullable
as int,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
