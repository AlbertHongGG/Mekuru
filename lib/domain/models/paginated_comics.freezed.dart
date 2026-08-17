// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_comics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedComics {

 List<Comic> get comics; int get page; bool get hasNext;
/// Create a copy of PaginatedComics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedComicsCopyWith<PaginatedComics> get copyWith => _$PaginatedComicsCopyWithImpl<PaginatedComics>(this as PaginatedComics, _$identity);

  /// Serializes this PaginatedComics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedComics&&const DeepCollectionEquality().equals(other.comics, comics)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comics),page,hasNext);

@override
String toString() {
  return 'PaginatedComics(comics: $comics, page: $page, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $PaginatedComicsCopyWith<$Res>  {
  factory $PaginatedComicsCopyWith(PaginatedComics value, $Res Function(PaginatedComics) _then) = _$PaginatedComicsCopyWithImpl;
@useResult
$Res call({
 List<Comic> comics, int page, bool hasNext
});




}
/// @nodoc
class _$PaginatedComicsCopyWithImpl<$Res>
    implements $PaginatedComicsCopyWith<$Res> {
  _$PaginatedComicsCopyWithImpl(this._self, this._then);

  final PaginatedComics _self;
  final $Res Function(PaginatedComics) _then;

/// Create a copy of PaginatedComics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comics = null,Object? page = null,Object? hasNext = null,}) {
  return _then(PaginatedComics(
comics: null == comics ? _self.comics : comics // ignore: cast_nullable_to_non_nullable
as List<Comic>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedComics].
extension PaginatedComicsPatterns on PaginatedComics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedComics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedComics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedComics value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedComics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedComics value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedComics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Comic> comics,  int page,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedComics() when $default != null:
return $default(_that.comics,_that.page,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Comic> comics,  int page,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _PaginatedComics():
return $default(_that.comics,_that.page,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Comic> comics,  int page,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedComics() when $default != null:
return $default(_that.comics,_that.page,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedComics implements PaginatedComics {
  const _PaginatedComics({ List<Comic> comics = const [], this.page = 1, this.hasNext = false}): _comics = comics;
  factory _PaginatedComics.fromJson(Map<String, dynamic> json) => _$PaginatedComicsFromJson(json);

 final  List<Comic> _comics;
@override@JsonKey() List<Comic> get comics {
  if (_comics is EqualUnmodifiableListView) return _comics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comics);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasNext;

/// Create a copy of PaginatedComics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedComicsCopyWith<_PaginatedComics> get copyWith => __$PaginatedComicsCopyWithImpl<_PaginatedComics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedComicsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedComics&&const DeepCollectionEquality().equals(other._comics, _comics)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comics),page,hasNext);

@override
String toString() {
  return 'PaginatedComics(comics: $comics, page: $page, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$PaginatedComicsCopyWith<$Res> implements $PaginatedComicsCopyWith<$Res> {
  factory _$PaginatedComicsCopyWith(_PaginatedComics value, $Res Function(_PaginatedComics) _then) = __$PaginatedComicsCopyWithImpl;
@override @useResult
$Res call({
 List<Comic> comics, int page, bool hasNext
});




}
/// @nodoc
class __$PaginatedComicsCopyWithImpl<$Res>
    implements _$PaginatedComicsCopyWith<$Res> {
  __$PaginatedComicsCopyWithImpl(this._self, this._then);

  final _PaginatedComics _self;
  final $Res Function(_PaginatedComics) _then;

/// Create a copy of PaginatedComics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comics = null,Object? page = null,Object? hasNext = null,}) {
  return _then(_PaginatedComics(
comics: null == comics ? _self._comics : comics // ignore: cast_nullable_to_non_nullable
as List<Comic>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
