// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicPage {

@JsonKey(name: 'order') int get index;@JsonKey(name: 'url') String get imageUrl; Map<String, String>? get headers;
/// Create a copy of ComicPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicPageCopyWith<ComicPage> get copyWith => _$ComicPageCopyWithImpl<ComicPage>(this as ComicPage, _$identity);

  /// Serializes this ComicPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicPage&&(identical(other.index, index) || other.index == index)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.headers, headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,imageUrl,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'ComicPage(index: $index, imageUrl: $imageUrl, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $ComicPageCopyWith<$Res>  {
  factory $ComicPageCopyWith(ComicPage value, $Res Function(ComicPage) _then) = _$ComicPageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order') int index,@JsonKey(name: 'url') String imageUrl, Map<String, String>? headers
});




}
/// @nodoc
class _$ComicPageCopyWithImpl<$Res>
    implements $ComicPageCopyWith<$Res> {
  _$ComicPageCopyWithImpl(this._self, this._then);

  final ComicPage _self;
  final $Res Function(ComicPage) _then;

/// Create a copy of ComicPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? imageUrl = null,Object? headers = freezed,}) {
  return _then(ComicPage(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicPage].
extension ComicPagePatterns on ComicPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicPage value)  $default,){
final _that = this;
switch (_that) {
case _ComicPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicPage value)?  $default,){
final _that = this;
switch (_that) {
case _ComicPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order')  int index, @JsonKey(name: 'url')  String imageUrl,  Map<String, String>? headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicPage() when $default != null:
return $default(_that.index,_that.imageUrl,_that.headers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order')  int index, @JsonKey(name: 'url')  String imageUrl,  Map<String, String>? headers)  $default,) {final _that = this;
switch (_that) {
case _ComicPage():
return $default(_that.index,_that.imageUrl,_that.headers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order')  int index, @JsonKey(name: 'url')  String imageUrl,  Map<String, String>? headers)?  $default,) {final _that = this;
switch (_that) {
case _ComicPage() when $default != null:
return $default(_that.index,_that.imageUrl,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicPage implements ComicPage {
  const _ComicPage({@JsonKey(name: 'order') required this.index, @JsonKey(name: 'url') required this.imageUrl,  Map<String, String>? headers}): _headers = headers;
  factory _ComicPage.fromJson(Map<String, dynamic> json) => _$ComicPageFromJson(json);

@override@JsonKey(name: 'order') final  int index;
@override@JsonKey(name: 'url') final  String imageUrl;
 final  Map<String, String>? _headers;
@override Map<String, String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ComicPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicPageCopyWith<_ComicPage> get copyWith => __$ComicPageCopyWithImpl<_ComicPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicPage&&(identical(other.index, index) || other.index == index)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._headers, _headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,imageUrl,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'ComicPage(index: $index, imageUrl: $imageUrl, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$ComicPageCopyWith<$Res> implements $ComicPageCopyWith<$Res> {
  factory _$ComicPageCopyWith(_ComicPage value, $Res Function(_ComicPage) _then) = __$ComicPageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order') int index,@JsonKey(name: 'url') String imageUrl, Map<String, String>? headers
});




}
/// @nodoc
class __$ComicPageCopyWithImpl<$Res>
    implements _$ComicPageCopyWith<$Res> {
  __$ComicPageCopyWithImpl(this._self, this._then);

  final _ComicPage _self;
  final $Res Function(_ComicPage) _then;

/// Create a copy of ComicPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? imageUrl = null,Object? headers = freezed,}) {
  return _then(_ComicPage(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
