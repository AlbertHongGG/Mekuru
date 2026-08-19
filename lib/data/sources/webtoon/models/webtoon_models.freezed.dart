// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webtoon_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WtAuthor {

 String get authorName;
/// Create a copy of WtAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtAuthorCopyWith<WtAuthor> get copyWith => _$WtAuthorCopyWithImpl<WtAuthor>(this as WtAuthor, _$identity);

  /// Serializes this WtAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtAuthor&&(identical(other.authorName, authorName) || other.authorName == authorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorName);

@override
String toString() {
  return 'WtAuthor(authorName: $authorName)';
}


}

/// @nodoc
abstract mixin class $WtAuthorCopyWith<$Res>  {
  factory $WtAuthorCopyWith(WtAuthor value, $Res Function(WtAuthor) _then) = _$WtAuthorCopyWithImpl;
@useResult
$Res call({
 String authorName
});




}
/// @nodoc
class _$WtAuthorCopyWithImpl<$Res>
    implements $WtAuthorCopyWith<$Res> {
  _$WtAuthorCopyWithImpl(this._self, this._then);

  final WtAuthor _self;
  final $Res Function(WtAuthor) _then;

/// Create a copy of WtAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authorName = null,}) {
  return _then(WtAuthor(
authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WtAuthor].
extension WtAuthorPatterns on WtAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtAuthor value)  $default,){
final _that = this;
switch (_that) {
case _WtAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _WtAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtAuthor() when $default != null:
return $default(_that.authorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authorName)  $default,) {final _that = this;
switch (_that) {
case _WtAuthor():
return $default(_that.authorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authorName)?  $default,) {final _that = this;
switch (_that) {
case _WtAuthor() when $default != null:
return $default(_that.authorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtAuthor implements WtAuthor {
  const _WtAuthor({required this.authorName});
  factory _WtAuthor.fromJson(Map<String, dynamic> json) => _$WtAuthorFromJson(json);

@override final  String authorName;

/// Create a copy of WtAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtAuthorCopyWith<_WtAuthor> get copyWith => __$WtAuthorCopyWithImpl<_WtAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtAuthor&&(identical(other.authorName, authorName) || other.authorName == authorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorName);

@override
String toString() {
  return 'WtAuthor(authorName: $authorName)';
}


}

/// @nodoc
abstract mixin class _$WtAuthorCopyWith<$Res> implements $WtAuthorCopyWith<$Res> {
  factory _$WtAuthorCopyWith(_WtAuthor value, $Res Function(_WtAuthor) _then) = __$WtAuthorCopyWithImpl;
@override @useResult
$Res call({
 String authorName
});




}
/// @nodoc
class __$WtAuthorCopyWithImpl<$Res>
    implements _$WtAuthorCopyWith<$Res> {
  __$WtAuthorCopyWithImpl(this._self, this._then);

  final _WtAuthor _self;
  final $Res Function(_WtAuthor) _then;

/// Create a copy of WtAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authorName = null,}) {
  return _then(_WtAuthor(
authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WtTitle {

 int get titleNo; String get thumbnailUrl;
/// Create a copy of WtTitle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtTitleCopyWith<WtTitle> get copyWith => _$WtTitleCopyWithImpl<WtTitle>(this as WtTitle, _$identity);

  /// Serializes this WtTitle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtTitle&&(identical(other.titleNo, titleNo) || other.titleNo == titleNo)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleNo,thumbnailUrl);

@override
String toString() {
  return 'WtTitle(titleNo: $titleNo, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $WtTitleCopyWith<$Res>  {
  factory $WtTitleCopyWith(WtTitle value, $Res Function(WtTitle) _then) = _$WtTitleCopyWithImpl;
@useResult
$Res call({
 int titleNo, String thumbnailUrl
});




}
/// @nodoc
class _$WtTitleCopyWithImpl<$Res>
    implements $WtTitleCopyWith<$Res> {
  _$WtTitleCopyWithImpl(this._self, this._then);

  final WtTitle _self;
  final $Res Function(WtTitle) _then;

/// Create a copy of WtTitle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titleNo = null,Object? thumbnailUrl = null,}) {
  return _then(WtTitle(
titleNo: null == titleNo ? _self.titleNo : titleNo // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WtTitle].
extension WtTitlePatterns on WtTitle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtTitle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtTitle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtTitle value)  $default,){
final _that = this;
switch (_that) {
case _WtTitle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtTitle value)?  $default,){
final _that = this;
switch (_that) {
case _WtTitle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int titleNo,  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtTitle() when $default != null:
return $default(_that.titleNo,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int titleNo,  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _WtTitle():
return $default(_that.titleNo,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int titleNo,  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _WtTitle() when $default != null:
return $default(_that.titleNo,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtTitle implements WtTitle {
  const _WtTitle({required this.titleNo, required this.thumbnailUrl});
  factory _WtTitle.fromJson(Map<String, dynamic> json) => _$WtTitleFromJson(json);

@override final  int titleNo;
@override final  String thumbnailUrl;

/// Create a copy of WtTitle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtTitleCopyWith<_WtTitle> get copyWith => __$WtTitleCopyWithImpl<_WtTitle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtTitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtTitle&&(identical(other.titleNo, titleNo) || other.titleNo == titleNo)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleNo,thumbnailUrl);

@override
String toString() {
  return 'WtTitle(titleNo: $titleNo, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$WtTitleCopyWith<$Res> implements $WtTitleCopyWith<$Res> {
  factory _$WtTitleCopyWith(_WtTitle value, $Res Function(_WtTitle) _then) = __$WtTitleCopyWithImpl;
@override @useResult
$Res call({
 int titleNo, String thumbnailUrl
});




}
/// @nodoc
class __$WtTitleCopyWithImpl<$Res>
    implements _$WtTitleCopyWith<$Res> {
  __$WtTitleCopyWithImpl(this._self, this._then);

  final _WtTitle _self;
  final $Res Function(_WtTitle) _then;

/// Create a copy of WtTitle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titleNo = null,Object? thumbnailUrl = null,}) {
  return _then(_WtTitle(
titleNo: null == titleNo ? _self.titleNo : titleNo // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WtSearchSection {

 List<WtTitle> get titleList; bool get hasMore;
/// Create a copy of WtSearchSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtSearchSectionCopyWith<WtSearchSection> get copyWith => _$WtSearchSectionCopyWithImpl<WtSearchSection>(this as WtSearchSection, _$identity);

  /// Serializes this WtSearchSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtSearchSection&&const DeepCollectionEquality().equals(other.titleList, titleList)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(titleList),hasMore);

@override
String toString() {
  return 'WtSearchSection(titleList: $titleList, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $WtSearchSectionCopyWith<$Res>  {
  factory $WtSearchSectionCopyWith(WtSearchSection value, $Res Function(WtSearchSection) _then) = _$WtSearchSectionCopyWithImpl;
@useResult
$Res call({
 List<WtTitle> titleList, bool hasMore
});




}
/// @nodoc
class _$WtSearchSectionCopyWithImpl<$Res>
    implements $WtSearchSectionCopyWith<$Res> {
  _$WtSearchSectionCopyWithImpl(this._self, this._then);

  final WtSearchSection _self;
  final $Res Function(WtSearchSection) _then;

/// Create a copy of WtSearchSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titleList = null,Object? hasMore = null,}) {
  return _then(WtSearchSection(
titleList: null == titleList ? _self.titleList : titleList // ignore: cast_nullable_to_non_nullable
as List<WtTitle>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WtSearchSection].
extension WtSearchSectionPatterns on WtSearchSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtSearchSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtSearchSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtSearchSection value)  $default,){
final _that = this;
switch (_that) {
case _WtSearchSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtSearchSection value)?  $default,){
final _that = this;
switch (_that) {
case _WtSearchSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WtTitle> titleList,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtSearchSection() when $default != null:
return $default(_that.titleList,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WtTitle> titleList,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _WtSearchSection():
return $default(_that.titleList,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WtTitle> titleList,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _WtSearchSection() when $default != null:
return $default(_that.titleList,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtSearchSection implements WtSearchSection {
  const _WtSearchSection({ List<WtTitle> titleList = const [], this.hasMore = false}): _titleList = titleList;
  factory _WtSearchSection.fromJson(Map<String, dynamic> json) => _$WtSearchSectionFromJson(json);

 final  List<WtTitle> _titleList;
@override@JsonKey() List<WtTitle> get titleList {
  if (_titleList is EqualUnmodifiableListView) return _titleList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_titleList);
}

@override@JsonKey() final  bool hasMore;

/// Create a copy of WtSearchSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtSearchSectionCopyWith<_WtSearchSection> get copyWith => __$WtSearchSectionCopyWithImpl<_WtSearchSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtSearchSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtSearchSection&&const DeepCollectionEquality().equals(other._titleList, _titleList)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_titleList),hasMore);

@override
String toString() {
  return 'WtSearchSection(titleList: $titleList, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$WtSearchSectionCopyWith<$Res> implements $WtSearchSectionCopyWith<$Res> {
  factory _$WtSearchSectionCopyWith(_WtSearchSection value, $Res Function(_WtSearchSection) _then) = __$WtSearchSectionCopyWithImpl;
@override @useResult
$Res call({
 List<WtTitle> titleList, bool hasMore
});




}
/// @nodoc
class __$WtSearchSectionCopyWithImpl<$Res>
    implements _$WtSearchSectionCopyWith<$Res> {
  __$WtSearchSectionCopyWithImpl(this._self, this._then);

  final _WtSearchSection _self;
  final $Res Function(_WtSearchSection) _then;

/// Create a copy of WtSearchSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titleList = null,Object? hasMore = null,}) {
  return _then(_WtSearchSection(
titleList: null == titleList ? _self._titleList : titleList // ignore: cast_nullable_to_non_nullable
as List<WtTitle>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$WtSearchResult {

 WtSearchSection get webtoonSearch;
/// Create a copy of WtSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtSearchResultCopyWith<WtSearchResult> get copyWith => _$WtSearchResultCopyWithImpl<WtSearchResult>(this as WtSearchResult, _$identity);

  /// Serializes this WtSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtSearchResult&&(identical(other.webtoonSearch, webtoonSearch) || other.webtoonSearch == webtoonSearch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,webtoonSearch);

@override
String toString() {
  return 'WtSearchResult(webtoonSearch: $webtoonSearch)';
}


}

/// @nodoc
abstract mixin class $WtSearchResultCopyWith<$Res>  {
  factory $WtSearchResultCopyWith(WtSearchResult value, $Res Function(WtSearchResult) _then) = _$WtSearchResultCopyWithImpl;
@useResult
$Res call({
 WtSearchSection webtoonSearch
});


$WtSearchSectionCopyWith<$Res> get webtoonSearch;

}
/// @nodoc
class _$WtSearchResultCopyWithImpl<$Res>
    implements $WtSearchResultCopyWith<$Res> {
  _$WtSearchResultCopyWithImpl(this._self, this._then);

  final WtSearchResult _self;
  final $Res Function(WtSearchResult) _then;

/// Create a copy of WtSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? webtoonSearch = null,}) {
  return _then(WtSearchResult(
webtoonSearch: null == webtoonSearch ? _self.webtoonSearch : webtoonSearch // ignore: cast_nullable_to_non_nullable
as WtSearchSection,
  ));
}
/// Create a copy of WtSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtSearchSectionCopyWith<$Res> get webtoonSearch {
  
  return $WtSearchSectionCopyWith<$Res>(_self.webtoonSearch, (value) {
    return _then(_self.copyWith(webtoonSearch: value));
  });
}
}


/// Adds pattern-matching-related methods to [WtSearchResult].
extension WtSearchResultPatterns on WtSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _WtSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _WtSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WtSearchSection webtoonSearch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtSearchResult() when $default != null:
return $default(_that.webtoonSearch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WtSearchSection webtoonSearch)  $default,) {final _that = this;
switch (_that) {
case _WtSearchResult():
return $default(_that.webtoonSearch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WtSearchSection webtoonSearch)?  $default,) {final _that = this;
switch (_that) {
case _WtSearchResult() when $default != null:
return $default(_that.webtoonSearch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtSearchResult implements WtSearchResult {
  const _WtSearchResult({required this.webtoonSearch});
  factory _WtSearchResult.fromJson(Map<String, dynamic> json) => _$WtSearchResultFromJson(json);

@override final  WtSearchSection webtoonSearch;

/// Create a copy of WtSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtSearchResultCopyWith<_WtSearchResult> get copyWith => __$WtSearchResultCopyWithImpl<_WtSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtSearchResult&&(identical(other.webtoonSearch, webtoonSearch) || other.webtoonSearch == webtoonSearch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,webtoonSearch);

@override
String toString() {
  return 'WtSearchResult(webtoonSearch: $webtoonSearch)';
}


}

/// @nodoc
abstract mixin class _$WtSearchResultCopyWith<$Res> implements $WtSearchResultCopyWith<$Res> {
  factory _$WtSearchResultCopyWith(_WtSearchResult value, $Res Function(_WtSearchResult) _then) = __$WtSearchResultCopyWithImpl;
@override @useResult
$Res call({
 WtSearchSection webtoonSearch
});


@override $WtSearchSectionCopyWith<$Res> get webtoonSearch;

}
/// @nodoc
class __$WtSearchResultCopyWithImpl<$Res>
    implements _$WtSearchResultCopyWith<$Res> {
  __$WtSearchResultCopyWithImpl(this._self, this._then);

  final _WtSearchResult _self;
  final $Res Function(_WtSearchResult) _then;

/// Create a copy of WtSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? webtoonSearch = null,}) {
  return _then(_WtSearchResult(
webtoonSearch: null == webtoonSearch ? _self.webtoonSearch : webtoonSearch // ignore: cast_nullable_to_non_nullable
as WtSearchSection,
  ));
}

/// Create a copy of WtSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtSearchSectionCopyWith<$Res> get webtoonSearch {
  
  return $WtSearchSectionCopyWith<$Res>(_self.webtoonSearch, (value) {
    return _then(_self.copyWith(webtoonSearch: value));
  });
}
}


/// @nodoc
mixin _$WtGenre {

 String get displayName;
/// Create a copy of WtGenre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtGenreCopyWith<WtGenre> get copyWith => _$WtGenreCopyWithImpl<WtGenre>(this as WtGenre, _$identity);

  /// Serializes this WtGenre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtGenre&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName);

@override
String toString() {
  return 'WtGenre(displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $WtGenreCopyWith<$Res>  {
  factory $WtGenreCopyWith(WtGenre value, $Res Function(WtGenre) _then) = _$WtGenreCopyWithImpl;
@useResult
$Res call({
 String displayName
});




}
/// @nodoc
class _$WtGenreCopyWithImpl<$Res>
    implements $WtGenreCopyWith<$Res> {
  _$WtGenreCopyWithImpl(this._self, this._then);

  final WtGenre _self;
  final $Res Function(WtGenre) _then;

/// Create a copy of WtGenre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,}) {
  return _then(WtGenre(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WtGenre].
extension WtGenrePatterns on WtGenre {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtGenre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtGenre() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtGenre value)  $default,){
final _that = this;
switch (_that) {
case _WtGenre():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtGenre value)?  $default,){
final _that = this;
switch (_that) {
case _WtGenre() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtGenre() when $default != null:
return $default(_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName)  $default,) {final _that = this;
switch (_that) {
case _WtGenre():
return $default(_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName)?  $default,) {final _that = this;
switch (_that) {
case _WtGenre() when $default != null:
return $default(_that.displayName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtGenre implements WtGenre {
  const _WtGenre({required this.displayName});
  factory _WtGenre.fromJson(Map<String, dynamic> json) => _$WtGenreFromJson(json);

@override final  String displayName;

/// Create a copy of WtGenre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtGenreCopyWith<_WtGenre> get copyWith => __$WtGenreCopyWithImpl<_WtGenre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtGenreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtGenre&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName);

@override
String toString() {
  return 'WtGenre(displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$WtGenreCopyWith<$Res> implements $WtGenreCopyWith<$Res> {
  factory _$WtGenreCopyWith(_WtGenre value, $Res Function(_WtGenre) _then) = __$WtGenreCopyWithImpl;
@override @useResult
$Res call({
 String displayName
});




}
/// @nodoc
class __$WtGenreCopyWithImpl<$Res>
    implements _$WtGenreCopyWith<$Res> {
  __$WtGenreCopyWithImpl(this._self, this._then);

  final _WtGenre _self;
  final $Res Function(_WtGenre) _then;

/// Create a copy of WtGenre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,}) {
  return _then(_WtGenre(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WtChallengeTitleItem {

 int get titleNo; String get readingTitle; String get thumbnailImageUrl; WtGenre? get representGenre;
/// Create a copy of WtChallengeTitleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtChallengeTitleItemCopyWith<WtChallengeTitleItem> get copyWith => _$WtChallengeTitleItemCopyWithImpl<WtChallengeTitleItem>(this as WtChallengeTitleItem, _$identity);

  /// Serializes this WtChallengeTitleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtChallengeTitleItem&&(identical(other.titleNo, titleNo) || other.titleNo == titleNo)&&(identical(other.readingTitle, readingTitle) || other.readingTitle == readingTitle)&&(identical(other.thumbnailImageUrl, thumbnailImageUrl) || other.thumbnailImageUrl == thumbnailImageUrl)&&(identical(other.representGenre, representGenre) || other.representGenre == representGenre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleNo,readingTitle,thumbnailImageUrl,representGenre);

@override
String toString() {
  return 'WtChallengeTitleItem(titleNo: $titleNo, readingTitle: $readingTitle, thumbnailImageUrl: $thumbnailImageUrl, representGenre: $representGenre)';
}


}

/// @nodoc
abstract mixin class $WtChallengeTitleItemCopyWith<$Res>  {
  factory $WtChallengeTitleItemCopyWith(WtChallengeTitleItem value, $Res Function(WtChallengeTitleItem) _then) = _$WtChallengeTitleItemCopyWithImpl;
@useResult
$Res call({
 int titleNo, String readingTitle, String thumbnailImageUrl, WtGenre? representGenre
});


$WtGenreCopyWith<$Res>? get representGenre;

}
/// @nodoc
class _$WtChallengeTitleItemCopyWithImpl<$Res>
    implements $WtChallengeTitleItemCopyWith<$Res> {
  _$WtChallengeTitleItemCopyWithImpl(this._self, this._then);

  final WtChallengeTitleItem _self;
  final $Res Function(WtChallengeTitleItem) _then;

/// Create a copy of WtChallengeTitleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titleNo = null,Object? readingTitle = null,Object? thumbnailImageUrl = null,Object? representGenre = freezed,}) {
  return _then(WtChallengeTitleItem(
titleNo: null == titleNo ? _self.titleNo : titleNo // ignore: cast_nullable_to_non_nullable
as int,readingTitle: null == readingTitle ? _self.readingTitle : readingTitle // ignore: cast_nullable_to_non_nullable
as String,thumbnailImageUrl: null == thumbnailImageUrl ? _self.thumbnailImageUrl : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
as String,representGenre: freezed == representGenre ? _self.representGenre : representGenre // ignore: cast_nullable_to_non_nullable
as WtGenre?,
  ));
}
/// Create a copy of WtChallengeTitleItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtGenreCopyWith<$Res>? get representGenre {
    if (_self.representGenre == null) {
    return null;
  }

  return $WtGenreCopyWith<$Res>(_self.representGenre!, (value) {
    return _then(_self.copyWith(representGenre: value));
  });
}
}


/// Adds pattern-matching-related methods to [WtChallengeTitleItem].
extension WtChallengeTitleItemPatterns on WtChallengeTitleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtChallengeTitleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtChallengeTitleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtChallengeTitleItem value)  $default,){
final _that = this;
switch (_that) {
case _WtChallengeTitleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtChallengeTitleItem value)?  $default,){
final _that = this;
switch (_that) {
case _WtChallengeTitleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int titleNo,  String readingTitle,  String thumbnailImageUrl,  WtGenre? representGenre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtChallengeTitleItem() when $default != null:
return $default(_that.titleNo,_that.readingTitle,_that.thumbnailImageUrl,_that.representGenre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int titleNo,  String readingTitle,  String thumbnailImageUrl,  WtGenre? representGenre)  $default,) {final _that = this;
switch (_that) {
case _WtChallengeTitleItem():
return $default(_that.titleNo,_that.readingTitle,_that.thumbnailImageUrl,_that.representGenre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int titleNo,  String readingTitle,  String thumbnailImageUrl,  WtGenre? representGenre)?  $default,) {final _that = this;
switch (_that) {
case _WtChallengeTitleItem() when $default != null:
return $default(_that.titleNo,_that.readingTitle,_that.thumbnailImageUrl,_that.representGenre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtChallengeTitleItem implements WtChallengeTitleItem {
  const _WtChallengeTitleItem({required this.titleNo, required this.readingTitle, required this.thumbnailImageUrl, this.representGenre});
  factory _WtChallengeTitleItem.fromJson(Map<String, dynamic> json) => _$WtChallengeTitleItemFromJson(json);

@override final  int titleNo;
@override final  String readingTitle;
@override final  String thumbnailImageUrl;
@override final  WtGenre? representGenre;

/// Create a copy of WtChallengeTitleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtChallengeTitleItemCopyWith<_WtChallengeTitleItem> get copyWith => __$WtChallengeTitleItemCopyWithImpl<_WtChallengeTitleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtChallengeTitleItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtChallengeTitleItem&&(identical(other.titleNo, titleNo) || other.titleNo == titleNo)&&(identical(other.readingTitle, readingTitle) || other.readingTitle == readingTitle)&&(identical(other.thumbnailImageUrl, thumbnailImageUrl) || other.thumbnailImageUrl == thumbnailImageUrl)&&(identical(other.representGenre, representGenre) || other.representGenre == representGenre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleNo,readingTitle,thumbnailImageUrl,representGenre);

@override
String toString() {
  return 'WtChallengeTitleItem(titleNo: $titleNo, readingTitle: $readingTitle, thumbnailImageUrl: $thumbnailImageUrl, representGenre: $representGenre)';
}


}

/// @nodoc
abstract mixin class _$WtChallengeTitleItemCopyWith<$Res> implements $WtChallengeTitleItemCopyWith<$Res> {
  factory _$WtChallengeTitleItemCopyWith(_WtChallengeTitleItem value, $Res Function(_WtChallengeTitleItem) _then) = __$WtChallengeTitleItemCopyWithImpl;
@override @useResult
$Res call({
 int titleNo, String readingTitle, String thumbnailImageUrl, WtGenre? representGenre
});


@override $WtGenreCopyWith<$Res>? get representGenre;

}
/// @nodoc
class __$WtChallengeTitleItemCopyWithImpl<$Res>
    implements _$WtChallengeTitleItemCopyWith<$Res> {
  __$WtChallengeTitleItemCopyWithImpl(this._self, this._then);

  final _WtChallengeTitleItem _self;
  final $Res Function(_WtChallengeTitleItem) _then;

/// Create a copy of WtChallengeTitleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titleNo = null,Object? readingTitle = null,Object? thumbnailImageUrl = null,Object? representGenre = freezed,}) {
  return _then(_WtChallengeTitleItem(
titleNo: null == titleNo ? _self.titleNo : titleNo // ignore: cast_nullable_to_non_nullable
as int,readingTitle: null == readingTitle ? _self.readingTitle : readingTitle // ignore: cast_nullable_to_non_nullable
as String,thumbnailImageUrl: null == thumbnailImageUrl ? _self.thumbnailImageUrl : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
as String,representGenre: freezed == representGenre ? _self.representGenre : representGenre // ignore: cast_nullable_to_non_nullable
as WtGenre?,
  ));
}

/// Create a copy of WtChallengeTitleItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtGenreCopyWith<$Res>? get representGenre {
    if (_self.representGenre == null) {
    return null;
  }

  return $WtGenreCopyWith<$Res>(_self.representGenre!, (value) {
    return _then(_self.copyWith(representGenre: value));
  });
}
}


/// @nodoc
mixin _$WtChallengeGenreTitleListResult {

 List<WtChallengeTitleItem> get challengeTitleList;
/// Create a copy of WtChallengeGenreTitleListResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtChallengeGenreTitleListResultCopyWith<WtChallengeGenreTitleListResult> get copyWith => _$WtChallengeGenreTitleListResultCopyWithImpl<WtChallengeGenreTitleListResult>(this as WtChallengeGenreTitleListResult, _$identity);

  /// Serializes this WtChallengeGenreTitleListResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtChallengeGenreTitleListResult&&const DeepCollectionEquality().equals(other.challengeTitleList, challengeTitleList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(challengeTitleList));

@override
String toString() {
  return 'WtChallengeGenreTitleListResult(challengeTitleList: $challengeTitleList)';
}


}

/// @nodoc
abstract mixin class $WtChallengeGenreTitleListResultCopyWith<$Res>  {
  factory $WtChallengeGenreTitleListResultCopyWith(WtChallengeGenreTitleListResult value, $Res Function(WtChallengeGenreTitleListResult) _then) = _$WtChallengeGenreTitleListResultCopyWithImpl;
@useResult
$Res call({
 List<WtChallengeTitleItem> challengeTitleList
});




}
/// @nodoc
class _$WtChallengeGenreTitleListResultCopyWithImpl<$Res>
    implements $WtChallengeGenreTitleListResultCopyWith<$Res> {
  _$WtChallengeGenreTitleListResultCopyWithImpl(this._self, this._then);

  final WtChallengeGenreTitleListResult _self;
  final $Res Function(WtChallengeGenreTitleListResult) _then;

/// Create a copy of WtChallengeGenreTitleListResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challengeTitleList = null,}) {
  return _then(WtChallengeGenreTitleListResult(
challengeTitleList: null == challengeTitleList ? _self.challengeTitleList : challengeTitleList // ignore: cast_nullable_to_non_nullable
as List<WtChallengeTitleItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WtChallengeGenreTitleListResult].
extension WtChallengeGenreTitleListResultPatterns on WtChallengeGenreTitleListResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtChallengeGenreTitleListResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtChallengeGenreTitleListResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtChallengeGenreTitleListResult value)  $default,){
final _that = this;
switch (_that) {
case _WtChallengeGenreTitleListResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtChallengeGenreTitleListResult value)?  $default,){
final _that = this;
switch (_that) {
case _WtChallengeGenreTitleListResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WtChallengeTitleItem> challengeTitleList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtChallengeGenreTitleListResult() when $default != null:
return $default(_that.challengeTitleList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WtChallengeTitleItem> challengeTitleList)  $default,) {final _that = this;
switch (_that) {
case _WtChallengeGenreTitleListResult():
return $default(_that.challengeTitleList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WtChallengeTitleItem> challengeTitleList)?  $default,) {final _that = this;
switch (_that) {
case _WtChallengeGenreTitleListResult() when $default != null:
return $default(_that.challengeTitleList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtChallengeGenreTitleListResult implements WtChallengeGenreTitleListResult {
  const _WtChallengeGenreTitleListResult({ List<WtChallengeTitleItem> challengeTitleList = const []}): _challengeTitleList = challengeTitleList;
  factory _WtChallengeGenreTitleListResult.fromJson(Map<String, dynamic> json) => _$WtChallengeGenreTitleListResultFromJson(json);

 final  List<WtChallengeTitleItem> _challengeTitleList;
@override@JsonKey() List<WtChallengeTitleItem> get challengeTitleList {
  if (_challengeTitleList is EqualUnmodifiableListView) return _challengeTitleList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challengeTitleList);
}


/// Create a copy of WtChallengeGenreTitleListResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtChallengeGenreTitleListResultCopyWith<_WtChallengeGenreTitleListResult> get copyWith => __$WtChallengeGenreTitleListResultCopyWithImpl<_WtChallengeGenreTitleListResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtChallengeGenreTitleListResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtChallengeGenreTitleListResult&&const DeepCollectionEquality().equals(other._challengeTitleList, _challengeTitleList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_challengeTitleList));

@override
String toString() {
  return 'WtChallengeGenreTitleListResult(challengeTitleList: $challengeTitleList)';
}


}

/// @nodoc
abstract mixin class _$WtChallengeGenreTitleListResultCopyWith<$Res> implements $WtChallengeGenreTitleListResultCopyWith<$Res> {
  factory _$WtChallengeGenreTitleListResultCopyWith(_WtChallengeGenreTitleListResult value, $Res Function(_WtChallengeGenreTitleListResult) _then) = __$WtChallengeGenreTitleListResultCopyWithImpl;
@override @useResult
$Res call({
 List<WtChallengeTitleItem> challengeTitleList
});




}
/// @nodoc
class __$WtChallengeGenreTitleListResultCopyWithImpl<$Res>
    implements _$WtChallengeGenreTitleListResultCopyWith<$Res> {
  __$WtChallengeGenreTitleListResultCopyWithImpl(this._self, this._then);

  final _WtChallengeGenreTitleListResult _self;
  final $Res Function(_WtChallengeGenreTitleListResult) _then;

/// Create a copy of WtChallengeGenreTitleListResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challengeTitleList = null,}) {
  return _then(_WtChallengeGenreTitleListResult(
challengeTitleList: null == challengeTitleList ? _self._challengeTitleList : challengeTitleList // ignore: cast_nullable_to_non_nullable
as List<WtChallengeTitleItem>,
  ));
}


}


/// @nodoc
mixin _$WtTitleDetail {

 int get titleNo; String get title; String get synopsis; String get posterThumbnailUrl; List<WtAuthor> get authorList;
/// Create a copy of WtTitleDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtTitleDetailCopyWith<WtTitleDetail> get copyWith => _$WtTitleDetailCopyWithImpl<WtTitleDetail>(this as WtTitleDetail, _$identity);

  /// Serializes this WtTitleDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtTitleDetail&&(identical(other.titleNo, titleNo) || other.titleNo == titleNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.posterThumbnailUrl, posterThumbnailUrl) || other.posterThumbnailUrl == posterThumbnailUrl)&&const DeepCollectionEquality().equals(other.authorList, authorList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleNo,title,synopsis,posterThumbnailUrl,const DeepCollectionEquality().hash(authorList));

@override
String toString() {
  return 'WtTitleDetail(titleNo: $titleNo, title: $title, synopsis: $synopsis, posterThumbnailUrl: $posterThumbnailUrl, authorList: $authorList)';
}


}

/// @nodoc
abstract mixin class $WtTitleDetailCopyWith<$Res>  {
  factory $WtTitleDetailCopyWith(WtTitleDetail value, $Res Function(WtTitleDetail) _then) = _$WtTitleDetailCopyWithImpl;
@useResult
$Res call({
 int titleNo, String title, String synopsis, String posterThumbnailUrl, List<WtAuthor> authorList
});




}
/// @nodoc
class _$WtTitleDetailCopyWithImpl<$Res>
    implements $WtTitleDetailCopyWith<$Res> {
  _$WtTitleDetailCopyWithImpl(this._self, this._then);

  final WtTitleDetail _self;
  final $Res Function(WtTitleDetail) _then;

/// Create a copy of WtTitleDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titleNo = null,Object? title = null,Object? synopsis = null,Object? posterThumbnailUrl = null,Object? authorList = null,}) {
  return _then(WtTitleDetail(
titleNo: null == titleNo ? _self.titleNo : titleNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,synopsis: null == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String,posterThumbnailUrl: null == posterThumbnailUrl ? _self.posterThumbnailUrl : posterThumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,authorList: null == authorList ? _self.authorList : authorList // ignore: cast_nullable_to_non_nullable
as List<WtAuthor>,
  ));
}

}


/// Adds pattern-matching-related methods to [WtTitleDetail].
extension WtTitleDetailPatterns on WtTitleDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtTitleDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtTitleDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtTitleDetail value)  $default,){
final _that = this;
switch (_that) {
case _WtTitleDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtTitleDetail value)?  $default,){
final _that = this;
switch (_that) {
case _WtTitleDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int titleNo,  String title,  String synopsis,  String posterThumbnailUrl,  List<WtAuthor> authorList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtTitleDetail() when $default != null:
return $default(_that.titleNo,_that.title,_that.synopsis,_that.posterThumbnailUrl,_that.authorList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int titleNo,  String title,  String synopsis,  String posterThumbnailUrl,  List<WtAuthor> authorList)  $default,) {final _that = this;
switch (_that) {
case _WtTitleDetail():
return $default(_that.titleNo,_that.title,_that.synopsis,_that.posterThumbnailUrl,_that.authorList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int titleNo,  String title,  String synopsis,  String posterThumbnailUrl,  List<WtAuthor> authorList)?  $default,) {final _that = this;
switch (_that) {
case _WtTitleDetail() when $default != null:
return $default(_that.titleNo,_that.title,_that.synopsis,_that.posterThumbnailUrl,_that.authorList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtTitleDetail implements WtTitleDetail {
  const _WtTitleDetail({required this.titleNo, required this.title, required this.synopsis, required this.posterThumbnailUrl,  List<WtAuthor> authorList = const []}): _authorList = authorList;
  factory _WtTitleDetail.fromJson(Map<String, dynamic> json) => _$WtTitleDetailFromJson(json);

@override final  int titleNo;
@override final  String title;
@override final  String synopsis;
@override final  String posterThumbnailUrl;
 final  List<WtAuthor> _authorList;
@override@JsonKey() List<WtAuthor> get authorList {
  if (_authorList is EqualUnmodifiableListView) return _authorList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authorList);
}


/// Create a copy of WtTitleDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtTitleDetailCopyWith<_WtTitleDetail> get copyWith => __$WtTitleDetailCopyWithImpl<_WtTitleDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtTitleDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtTitleDetail&&(identical(other.titleNo, titleNo) || other.titleNo == titleNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.posterThumbnailUrl, posterThumbnailUrl) || other.posterThumbnailUrl == posterThumbnailUrl)&&const DeepCollectionEquality().equals(other._authorList, _authorList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,titleNo,title,synopsis,posterThumbnailUrl,const DeepCollectionEquality().hash(_authorList));

@override
String toString() {
  return 'WtTitleDetail(titleNo: $titleNo, title: $title, synopsis: $synopsis, posterThumbnailUrl: $posterThumbnailUrl, authorList: $authorList)';
}


}

/// @nodoc
abstract mixin class _$WtTitleDetailCopyWith<$Res> implements $WtTitleDetailCopyWith<$Res> {
  factory _$WtTitleDetailCopyWith(_WtTitleDetail value, $Res Function(_WtTitleDetail) _then) = __$WtTitleDetailCopyWithImpl;
@override @useResult
$Res call({
 int titleNo, String title, String synopsis, String posterThumbnailUrl, List<WtAuthor> authorList
});




}
/// @nodoc
class __$WtTitleDetailCopyWithImpl<$Res>
    implements _$WtTitleDetailCopyWith<$Res> {
  __$WtTitleDetailCopyWithImpl(this._self, this._then);

  final _WtTitleDetail _self;
  final $Res Function(_WtTitleDetail) _then;

/// Create a copy of WtTitleDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titleNo = null,Object? title = null,Object? synopsis = null,Object? posterThumbnailUrl = null,Object? authorList = null,}) {
  return _then(_WtTitleDetail(
titleNo: null == titleNo ? _self.titleNo : titleNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,synopsis: null == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String,posterThumbnailUrl: null == posterThumbnailUrl ? _self.posterThumbnailUrl : posterThumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,authorList: null == authorList ? _self._authorList : authorList // ignore: cast_nullable_to_non_nullable
as List<WtAuthor>,
  ));
}


}


/// @nodoc
mixin _$WtEpisodeMeta {

 int get totalEpisodeCount;
/// Create a copy of WtEpisodeMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtEpisodeMetaCopyWith<WtEpisodeMeta> get copyWith => _$WtEpisodeMetaCopyWithImpl<WtEpisodeMeta>(this as WtEpisodeMeta, _$identity);

  /// Serializes this WtEpisodeMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtEpisodeMeta&&(identical(other.totalEpisodeCount, totalEpisodeCount) || other.totalEpisodeCount == totalEpisodeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalEpisodeCount);

@override
String toString() {
  return 'WtEpisodeMeta(totalEpisodeCount: $totalEpisodeCount)';
}


}

/// @nodoc
abstract mixin class $WtEpisodeMetaCopyWith<$Res>  {
  factory $WtEpisodeMetaCopyWith(WtEpisodeMeta value, $Res Function(WtEpisodeMeta) _then) = _$WtEpisodeMetaCopyWithImpl;
@useResult
$Res call({
 int totalEpisodeCount
});




}
/// @nodoc
class _$WtEpisodeMetaCopyWithImpl<$Res>
    implements $WtEpisodeMetaCopyWith<$Res> {
  _$WtEpisodeMetaCopyWithImpl(this._self, this._then);

  final WtEpisodeMeta _self;
  final $Res Function(WtEpisodeMeta) _then;

/// Create a copy of WtEpisodeMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalEpisodeCount = null,}) {
  return _then(WtEpisodeMeta(
totalEpisodeCount: null == totalEpisodeCount ? _self.totalEpisodeCount : totalEpisodeCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WtEpisodeMeta].
extension WtEpisodeMetaPatterns on WtEpisodeMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtEpisodeMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtEpisodeMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtEpisodeMeta value)  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtEpisodeMeta value)?  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalEpisodeCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtEpisodeMeta() when $default != null:
return $default(_that.totalEpisodeCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalEpisodeCount)  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeMeta():
return $default(_that.totalEpisodeCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalEpisodeCount)?  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeMeta() when $default != null:
return $default(_that.totalEpisodeCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtEpisodeMeta implements WtEpisodeMeta {
  const _WtEpisodeMeta({required this.totalEpisodeCount});
  factory _WtEpisodeMeta.fromJson(Map<String, dynamic> json) => _$WtEpisodeMetaFromJson(json);

@override final  int totalEpisodeCount;

/// Create a copy of WtEpisodeMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtEpisodeMetaCopyWith<_WtEpisodeMeta> get copyWith => __$WtEpisodeMetaCopyWithImpl<_WtEpisodeMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtEpisodeMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtEpisodeMeta&&(identical(other.totalEpisodeCount, totalEpisodeCount) || other.totalEpisodeCount == totalEpisodeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalEpisodeCount);

@override
String toString() {
  return 'WtEpisodeMeta(totalEpisodeCount: $totalEpisodeCount)';
}


}

/// @nodoc
abstract mixin class _$WtEpisodeMetaCopyWith<$Res> implements $WtEpisodeMetaCopyWith<$Res> {
  factory _$WtEpisodeMetaCopyWith(_WtEpisodeMeta value, $Res Function(_WtEpisodeMeta) _then) = __$WtEpisodeMetaCopyWithImpl;
@override @useResult
$Res call({
 int totalEpisodeCount
});




}
/// @nodoc
class __$WtEpisodeMetaCopyWithImpl<$Res>
    implements _$WtEpisodeMetaCopyWith<$Res> {
  __$WtEpisodeMetaCopyWithImpl(this._self, this._then);

  final _WtEpisodeMeta _self;
  final $Res Function(_WtEpisodeMeta) _then;

/// Create a copy of WtEpisodeMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalEpisodeCount = null,}) {
  return _then(_WtEpisodeMeta(
totalEpisodeCount: null == totalEpisodeCount ? _self.totalEpisodeCount : totalEpisodeCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WtTagItem {

 String get text; String get type;
/// Create a copy of WtTagItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtTagItemCopyWith<WtTagItem> get copyWith => _$WtTagItemCopyWithImpl<WtTagItem>(this as WtTagItem, _$identity);

  /// Serializes this WtTagItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtTagItem&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type);

@override
String toString() {
  return 'WtTagItem(text: $text, type: $type)';
}


}

/// @nodoc
abstract mixin class $WtTagItemCopyWith<$Res>  {
  factory $WtTagItemCopyWith(WtTagItem value, $Res Function(WtTagItem) _then) = _$WtTagItemCopyWithImpl;
@useResult
$Res call({
 String text, String type
});




}
/// @nodoc
class _$WtTagItemCopyWithImpl<$Res>
    implements $WtTagItemCopyWith<$Res> {
  _$WtTagItemCopyWithImpl(this._self, this._then);

  final WtTagItem _self;
  final $Res Function(WtTagItem) _then;

/// Create a copy of WtTagItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? type = null,}) {
  return _then(WtTagItem(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WtTagItem].
extension WtTagItemPatterns on WtTagItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtTagItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtTagItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtTagItem value)  $default,){
final _that = this;
switch (_that) {
case _WtTagItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtTagItem value)?  $default,){
final _that = this;
switch (_that) {
case _WtTagItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtTagItem() when $default != null:
return $default(_that.text,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String type)  $default,) {final _that = this;
switch (_that) {
case _WtTagItem():
return $default(_that.text,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String type)?  $default,) {final _that = this;
switch (_that) {
case _WtTagItem() when $default != null:
return $default(_that.text,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtTagItem implements WtTagItem {
  const _WtTagItem({required this.text, required this.type});
  factory _WtTagItem.fromJson(Map<String, dynamic> json) => _$WtTagItemFromJson(json);

@override final  String text;
@override final  String type;

/// Create a copy of WtTagItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtTagItemCopyWith<_WtTagItem> get copyWith => __$WtTagItemCopyWithImpl<_WtTagItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtTagItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtTagItem&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,type);

@override
String toString() {
  return 'WtTagItem(text: $text, type: $type)';
}


}

/// @nodoc
abstract mixin class _$WtTagItemCopyWith<$Res> implements $WtTagItemCopyWith<$Res> {
  factory _$WtTagItemCopyWith(_WtTagItem value, $Res Function(_WtTagItem) _then) = __$WtTagItemCopyWithImpl;
@override @useResult
$Res call({
 String text, String type
});




}
/// @nodoc
class __$WtTagItemCopyWithImpl<$Res>
    implements _$WtTagItemCopyWith<$Res> {
  __$WtTagItemCopyWithImpl(this._self, this._then);

  final _WtTagItem _self;
  final $Res Function(_WtTagItem) _then;

/// Create a copy of WtTagItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? type = null,}) {
  return _then(_WtTagItem(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WtTagInfo {

 List<WtTagItem> get tagList;
/// Create a copy of WtTagInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtTagInfoCopyWith<WtTagInfo> get copyWith => _$WtTagInfoCopyWithImpl<WtTagInfo>(this as WtTagInfo, _$identity);

  /// Serializes this WtTagInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtTagInfo&&const DeepCollectionEquality().equals(other.tagList, tagList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tagList));

@override
String toString() {
  return 'WtTagInfo(tagList: $tagList)';
}


}

/// @nodoc
abstract mixin class $WtTagInfoCopyWith<$Res>  {
  factory $WtTagInfoCopyWith(WtTagInfo value, $Res Function(WtTagInfo) _then) = _$WtTagInfoCopyWithImpl;
@useResult
$Res call({
 List<WtTagItem> tagList
});




}
/// @nodoc
class _$WtTagInfoCopyWithImpl<$Res>
    implements $WtTagInfoCopyWith<$Res> {
  _$WtTagInfoCopyWithImpl(this._self, this._then);

  final WtTagInfo _self;
  final $Res Function(WtTagInfo) _then;

/// Create a copy of WtTagInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagList = null,}) {
  return _then(WtTagInfo(
tagList: null == tagList ? _self.tagList : tagList // ignore: cast_nullable_to_non_nullable
as List<WtTagItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WtTagInfo].
extension WtTagInfoPatterns on WtTagInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtTagInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtTagInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtTagInfo value)  $default,){
final _that = this;
switch (_that) {
case _WtTagInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtTagInfo value)?  $default,){
final _that = this;
switch (_that) {
case _WtTagInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WtTagItem> tagList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtTagInfo() when $default != null:
return $default(_that.tagList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WtTagItem> tagList)  $default,) {final _that = this;
switch (_that) {
case _WtTagInfo():
return $default(_that.tagList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WtTagItem> tagList)?  $default,) {final _that = this;
switch (_that) {
case _WtTagInfo() when $default != null:
return $default(_that.tagList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtTagInfo implements WtTagInfo {
  const _WtTagInfo({ List<WtTagItem> tagList = const []}): _tagList = tagList;
  factory _WtTagInfo.fromJson(Map<String, dynamic> json) => _$WtTagInfoFromJson(json);

 final  List<WtTagItem> _tagList;
@override@JsonKey() List<WtTagItem> get tagList {
  if (_tagList is EqualUnmodifiableListView) return _tagList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagList);
}


/// Create a copy of WtTagInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtTagInfoCopyWith<_WtTagInfo> get copyWith => __$WtTagInfoCopyWithImpl<_WtTagInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtTagInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtTagInfo&&const DeepCollectionEquality().equals(other._tagList, _tagList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tagList));

@override
String toString() {
  return 'WtTagInfo(tagList: $tagList)';
}


}

/// @nodoc
abstract mixin class _$WtTagInfoCopyWith<$Res> implements $WtTagInfoCopyWith<$Res> {
  factory _$WtTagInfoCopyWith(_WtTagInfo value, $Res Function(_WtTagInfo) _then) = __$WtTagInfoCopyWithImpl;
@override @useResult
$Res call({
 List<WtTagItem> tagList
});




}
/// @nodoc
class __$WtTagInfoCopyWithImpl<$Res>
    implements _$WtTagInfoCopyWith<$Res> {
  __$WtTagInfoCopyWithImpl(this._self, this._then);

  final _WtTagInfo _self;
  final $Res Function(_WtTagInfo) _then;

/// Create a copy of WtTagInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagList = null,}) {
  return _then(_WtTagInfo(
tagList: null == tagList ? _self._tagList : tagList // ignore: cast_nullable_to_non_nullable
as List<WtTagItem>,
  ));
}


}


/// @nodoc
mixin _$WtTitleHomeResult {

 WtTitleDetail get title; WtTagInfo? get tag; WtEpisodeMeta get episodeMeta;
/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtTitleHomeResultCopyWith<WtTitleHomeResult> get copyWith => _$WtTitleHomeResultCopyWithImpl<WtTitleHomeResult>(this as WtTitleHomeResult, _$identity);

  /// Serializes this WtTitleHomeResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtTitleHomeResult&&(identical(other.title, title) || other.title == title)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.episodeMeta, episodeMeta) || other.episodeMeta == episodeMeta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tag,episodeMeta);

@override
String toString() {
  return 'WtTitleHomeResult(title: $title, tag: $tag, episodeMeta: $episodeMeta)';
}


}

/// @nodoc
abstract mixin class $WtTitleHomeResultCopyWith<$Res>  {
  factory $WtTitleHomeResultCopyWith(WtTitleHomeResult value, $Res Function(WtTitleHomeResult) _then) = _$WtTitleHomeResultCopyWithImpl;
@useResult
$Res call({
 WtTitleDetail title, WtTagInfo? tag, WtEpisodeMeta episodeMeta
});


$WtTitleDetailCopyWith<$Res> get title;$WtTagInfoCopyWith<$Res>? get tag;$WtEpisodeMetaCopyWith<$Res> get episodeMeta;

}
/// @nodoc
class _$WtTitleHomeResultCopyWithImpl<$Res>
    implements $WtTitleHomeResultCopyWith<$Res> {
  _$WtTitleHomeResultCopyWithImpl(this._self, this._then);

  final WtTitleHomeResult _self;
  final $Res Function(WtTitleHomeResult) _then;

/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? tag = freezed,Object? episodeMeta = null,}) {
  return _then(WtTitleHomeResult(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as WtTitleDetail,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as WtTagInfo?,episodeMeta: null == episodeMeta ? _self.episodeMeta : episodeMeta // ignore: cast_nullable_to_non_nullable
as WtEpisodeMeta,
  ));
}
/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtTitleDetailCopyWith<$Res> get title {
  
  return $WtTitleDetailCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtTagInfoCopyWith<$Res>? get tag {
    if (_self.tag == null) {
    return null;
  }

  return $WtTagInfoCopyWith<$Res>(_self.tag!, (value) {
    return _then(_self.copyWith(tag: value));
  });
}/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtEpisodeMetaCopyWith<$Res> get episodeMeta {
  
  return $WtEpisodeMetaCopyWith<$Res>(_self.episodeMeta, (value) {
    return _then(_self.copyWith(episodeMeta: value));
  });
}
}


/// Adds pattern-matching-related methods to [WtTitleHomeResult].
extension WtTitleHomeResultPatterns on WtTitleHomeResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtTitleHomeResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtTitleHomeResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtTitleHomeResult value)  $default,){
final _that = this;
switch (_that) {
case _WtTitleHomeResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtTitleHomeResult value)?  $default,){
final _that = this;
switch (_that) {
case _WtTitleHomeResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WtTitleDetail title,  WtTagInfo? tag,  WtEpisodeMeta episodeMeta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtTitleHomeResult() when $default != null:
return $default(_that.title,_that.tag,_that.episodeMeta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WtTitleDetail title,  WtTagInfo? tag,  WtEpisodeMeta episodeMeta)  $default,) {final _that = this;
switch (_that) {
case _WtTitleHomeResult():
return $default(_that.title,_that.tag,_that.episodeMeta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WtTitleDetail title,  WtTagInfo? tag,  WtEpisodeMeta episodeMeta)?  $default,) {final _that = this;
switch (_that) {
case _WtTitleHomeResult() when $default != null:
return $default(_that.title,_that.tag,_that.episodeMeta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtTitleHomeResult implements WtTitleHomeResult {
  const _WtTitleHomeResult({required this.title, this.tag, required this.episodeMeta});
  factory _WtTitleHomeResult.fromJson(Map<String, dynamic> json) => _$WtTitleHomeResultFromJson(json);

@override final  WtTitleDetail title;
@override final  WtTagInfo? tag;
@override final  WtEpisodeMeta episodeMeta;

/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtTitleHomeResultCopyWith<_WtTitleHomeResult> get copyWith => __$WtTitleHomeResultCopyWithImpl<_WtTitleHomeResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtTitleHomeResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtTitleHomeResult&&(identical(other.title, title) || other.title == title)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.episodeMeta, episodeMeta) || other.episodeMeta == episodeMeta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tag,episodeMeta);

@override
String toString() {
  return 'WtTitleHomeResult(title: $title, tag: $tag, episodeMeta: $episodeMeta)';
}


}

/// @nodoc
abstract mixin class _$WtTitleHomeResultCopyWith<$Res> implements $WtTitleHomeResultCopyWith<$Res> {
  factory _$WtTitleHomeResultCopyWith(_WtTitleHomeResult value, $Res Function(_WtTitleHomeResult) _then) = __$WtTitleHomeResultCopyWithImpl;
@override @useResult
$Res call({
 WtTitleDetail title, WtTagInfo? tag, WtEpisodeMeta episodeMeta
});


@override $WtTitleDetailCopyWith<$Res> get title;@override $WtTagInfoCopyWith<$Res>? get tag;@override $WtEpisodeMetaCopyWith<$Res> get episodeMeta;

}
/// @nodoc
class __$WtTitleHomeResultCopyWithImpl<$Res>
    implements _$WtTitleHomeResultCopyWith<$Res> {
  __$WtTitleHomeResultCopyWithImpl(this._self, this._then);

  final _WtTitleHomeResult _self;
  final $Res Function(_WtTitleHomeResult) _then;

/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? tag = freezed,Object? episodeMeta = null,}) {
  return _then(_WtTitleHomeResult(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as WtTitleDetail,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as WtTagInfo?,episodeMeta: null == episodeMeta ? _self.episodeMeta : episodeMeta // ignore: cast_nullable_to_non_nullable
as WtEpisodeMeta,
  ));
}

/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtTitleDetailCopyWith<$Res> get title {
  
  return $WtTitleDetailCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtTagInfoCopyWith<$Res>? get tag {
    if (_self.tag == null) {
    return null;
  }

  return $WtTagInfoCopyWith<$Res>(_self.tag!, (value) {
    return _then(_self.copyWith(tag: value));
  });
}/// Create a copy of WtTitleHomeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtEpisodeMetaCopyWith<$Res> get episodeMeta {
  
  return $WtEpisodeMetaCopyWith<$Res>(_self.episodeMeta, (value) {
    return _then(_self.copyWith(episodeMeta: value));
  });
}
}


/// @nodoc
mixin _$WtEpisodeItem {

 int get episodeNo; String get episodeTitle; String? get thumbnailUrl; int? get exposureYmdt;
/// Create a copy of WtEpisodeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtEpisodeItemCopyWith<WtEpisodeItem> get copyWith => _$WtEpisodeItemCopyWithImpl<WtEpisodeItem>(this as WtEpisodeItem, _$identity);

  /// Serializes this WtEpisodeItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtEpisodeItem&&(identical(other.episodeNo, episodeNo) || other.episodeNo == episodeNo)&&(identical(other.episodeTitle, episodeTitle) || other.episodeTitle == episodeTitle)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.exposureYmdt, exposureYmdt) || other.exposureYmdt == exposureYmdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeNo,episodeTitle,thumbnailUrl,exposureYmdt);

@override
String toString() {
  return 'WtEpisodeItem(episodeNo: $episodeNo, episodeTitle: $episodeTitle, thumbnailUrl: $thumbnailUrl, exposureYmdt: $exposureYmdt)';
}


}

/// @nodoc
abstract mixin class $WtEpisodeItemCopyWith<$Res>  {
  factory $WtEpisodeItemCopyWith(WtEpisodeItem value, $Res Function(WtEpisodeItem) _then) = _$WtEpisodeItemCopyWithImpl;
@useResult
$Res call({
 int episodeNo, String episodeTitle, String? thumbnailUrl, int? exposureYmdt
});




}
/// @nodoc
class _$WtEpisodeItemCopyWithImpl<$Res>
    implements $WtEpisodeItemCopyWith<$Res> {
  _$WtEpisodeItemCopyWithImpl(this._self, this._then);

  final WtEpisodeItem _self;
  final $Res Function(WtEpisodeItem) _then;

/// Create a copy of WtEpisodeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episodeNo = null,Object? episodeTitle = null,Object? thumbnailUrl = freezed,Object? exposureYmdt = freezed,}) {
  return _then(WtEpisodeItem(
episodeNo: null == episodeNo ? _self.episodeNo : episodeNo // ignore: cast_nullable_to_non_nullable
as int,episodeTitle: null == episodeTitle ? _self.episodeTitle : episodeTitle // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,exposureYmdt: freezed == exposureYmdt ? _self.exposureYmdt : exposureYmdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WtEpisodeItem].
extension WtEpisodeItemPatterns on WtEpisodeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtEpisodeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtEpisodeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtEpisodeItem value)  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtEpisodeItem value)?  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int episodeNo,  String episodeTitle,  String? thumbnailUrl,  int? exposureYmdt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtEpisodeItem() when $default != null:
return $default(_that.episodeNo,_that.episodeTitle,_that.thumbnailUrl,_that.exposureYmdt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int episodeNo,  String episodeTitle,  String? thumbnailUrl,  int? exposureYmdt)  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeItem():
return $default(_that.episodeNo,_that.episodeTitle,_that.thumbnailUrl,_that.exposureYmdt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int episodeNo,  String episodeTitle,  String? thumbnailUrl,  int? exposureYmdt)?  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeItem() when $default != null:
return $default(_that.episodeNo,_that.episodeTitle,_that.thumbnailUrl,_that.exposureYmdt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtEpisodeItem implements WtEpisodeItem {
  const _WtEpisodeItem({required this.episodeNo, required this.episodeTitle, this.thumbnailUrl, this.exposureYmdt});
  factory _WtEpisodeItem.fromJson(Map<String, dynamic> json) => _$WtEpisodeItemFromJson(json);

@override final  int episodeNo;
@override final  String episodeTitle;
@override final  String? thumbnailUrl;
@override final  int? exposureYmdt;

/// Create a copy of WtEpisodeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtEpisodeItemCopyWith<_WtEpisodeItem> get copyWith => __$WtEpisodeItemCopyWithImpl<_WtEpisodeItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtEpisodeItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtEpisodeItem&&(identical(other.episodeNo, episodeNo) || other.episodeNo == episodeNo)&&(identical(other.episodeTitle, episodeTitle) || other.episodeTitle == episodeTitle)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.exposureYmdt, exposureYmdt) || other.exposureYmdt == exposureYmdt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeNo,episodeTitle,thumbnailUrl,exposureYmdt);

@override
String toString() {
  return 'WtEpisodeItem(episodeNo: $episodeNo, episodeTitle: $episodeTitle, thumbnailUrl: $thumbnailUrl, exposureYmdt: $exposureYmdt)';
}


}

/// @nodoc
abstract mixin class _$WtEpisodeItemCopyWith<$Res> implements $WtEpisodeItemCopyWith<$Res> {
  factory _$WtEpisodeItemCopyWith(_WtEpisodeItem value, $Res Function(_WtEpisodeItem) _then) = __$WtEpisodeItemCopyWithImpl;
@override @useResult
$Res call({
 int episodeNo, String episodeTitle, String? thumbnailUrl, int? exposureYmdt
});




}
/// @nodoc
class __$WtEpisodeItemCopyWithImpl<$Res>
    implements _$WtEpisodeItemCopyWith<$Res> {
  __$WtEpisodeItemCopyWithImpl(this._self, this._then);

  final _WtEpisodeItem _self;
  final $Res Function(_WtEpisodeItem) _then;

/// Create a copy of WtEpisodeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episodeNo = null,Object? episodeTitle = null,Object? thumbnailUrl = freezed,Object? exposureYmdt = freezed,}) {
  return _then(_WtEpisodeItem(
episodeNo: null == episodeNo ? _self.episodeNo : episodeNo // ignore: cast_nullable_to_non_nullable
as int,episodeTitle: null == episodeTitle ? _self.episodeTitle : episodeTitle // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,exposureYmdt: freezed == exposureYmdt ? _self.exposureYmdt : exposureYmdt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$WtEpisodeListResult {

 List<WtEpisodeItem> get episodeList; bool get hasMore;
/// Create a copy of WtEpisodeListResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtEpisodeListResultCopyWith<WtEpisodeListResult> get copyWith => _$WtEpisodeListResultCopyWithImpl<WtEpisodeListResult>(this as WtEpisodeListResult, _$identity);

  /// Serializes this WtEpisodeListResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtEpisodeListResult&&const DeepCollectionEquality().equals(other.episodeList, episodeList)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(episodeList),hasMore);

@override
String toString() {
  return 'WtEpisodeListResult(episodeList: $episodeList, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $WtEpisodeListResultCopyWith<$Res>  {
  factory $WtEpisodeListResultCopyWith(WtEpisodeListResult value, $Res Function(WtEpisodeListResult) _then) = _$WtEpisodeListResultCopyWithImpl;
@useResult
$Res call({
 List<WtEpisodeItem> episodeList, bool hasMore
});




}
/// @nodoc
class _$WtEpisodeListResultCopyWithImpl<$Res>
    implements $WtEpisodeListResultCopyWith<$Res> {
  _$WtEpisodeListResultCopyWithImpl(this._self, this._then);

  final WtEpisodeListResult _self;
  final $Res Function(WtEpisodeListResult) _then;

/// Create a copy of WtEpisodeListResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episodeList = null,Object? hasMore = null,}) {
  return _then(WtEpisodeListResult(
episodeList: null == episodeList ? _self.episodeList : episodeList // ignore: cast_nullable_to_non_nullable
as List<WtEpisodeItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WtEpisodeListResult].
extension WtEpisodeListResultPatterns on WtEpisodeListResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtEpisodeListResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtEpisodeListResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtEpisodeListResult value)  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeListResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtEpisodeListResult value)?  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeListResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WtEpisodeItem> episodeList,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtEpisodeListResult() when $default != null:
return $default(_that.episodeList,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WtEpisodeItem> episodeList,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeListResult():
return $default(_that.episodeList,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WtEpisodeItem> episodeList,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeListResult() when $default != null:
return $default(_that.episodeList,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtEpisodeListResult implements WtEpisodeListResult {
  const _WtEpisodeListResult({ List<WtEpisodeItem> episodeList = const [], this.hasMore = false}): _episodeList = episodeList;
  factory _WtEpisodeListResult.fromJson(Map<String, dynamic> json) => _$WtEpisodeListResultFromJson(json);

 final  List<WtEpisodeItem> _episodeList;
@override@JsonKey() List<WtEpisodeItem> get episodeList {
  if (_episodeList is EqualUnmodifiableListView) return _episodeList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodeList);
}

@override@JsonKey() final  bool hasMore;

/// Create a copy of WtEpisodeListResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtEpisodeListResultCopyWith<_WtEpisodeListResult> get copyWith => __$WtEpisodeListResultCopyWithImpl<_WtEpisodeListResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtEpisodeListResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtEpisodeListResult&&const DeepCollectionEquality().equals(other._episodeList, _episodeList)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_episodeList),hasMore);

@override
String toString() {
  return 'WtEpisodeListResult(episodeList: $episodeList, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$WtEpisodeListResultCopyWith<$Res> implements $WtEpisodeListResultCopyWith<$Res> {
  factory _$WtEpisodeListResultCopyWith(_WtEpisodeListResult value, $Res Function(_WtEpisodeListResult) _then) = __$WtEpisodeListResultCopyWithImpl;
@override @useResult
$Res call({
 List<WtEpisodeItem> episodeList, bool hasMore
});




}
/// @nodoc
class __$WtEpisodeListResultCopyWithImpl<$Res>
    implements _$WtEpisodeListResultCopyWith<$Res> {
  __$WtEpisodeListResultCopyWithImpl(this._self, this._then);

  final _WtEpisodeListResult _self;
  final $Res Function(_WtEpisodeListResult) _then;

/// Create a copy of WtEpisodeListResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episodeList = null,Object? hasMore = null,}) {
  return _then(_WtEpisodeListResult(
episodeList: null == episodeList ? _self._episodeList : episodeList // ignore: cast_nullable_to_non_nullable
as List<WtEpisodeItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$WtImageInfo {

 String get url;
/// Create a copy of WtImageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtImageInfoCopyWith<WtImageInfo> get copyWith => _$WtImageInfoCopyWithImpl<WtImageInfo>(this as WtImageInfo, _$identity);

  /// Serializes this WtImageInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtImageInfo&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'WtImageInfo(url: $url)';
}


}

/// @nodoc
abstract mixin class $WtImageInfoCopyWith<$Res>  {
  factory $WtImageInfoCopyWith(WtImageInfo value, $Res Function(WtImageInfo) _then) = _$WtImageInfoCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$WtImageInfoCopyWithImpl<$Res>
    implements $WtImageInfoCopyWith<$Res> {
  _$WtImageInfoCopyWithImpl(this._self, this._then);

  final WtImageInfo _self;
  final $Res Function(WtImageInfo) _then;

/// Create a copy of WtImageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(WtImageInfo(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WtImageInfo].
extension WtImageInfoPatterns on WtImageInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtImageInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtImageInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtImageInfo value)  $default,){
final _that = this;
switch (_that) {
case _WtImageInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtImageInfo value)?  $default,){
final _that = this;
switch (_that) {
case _WtImageInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtImageInfo() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _WtImageInfo():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _WtImageInfo() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtImageInfo implements WtImageInfo {
  const _WtImageInfo({required this.url});
  factory _WtImageInfo.fromJson(Map<String, dynamic> json) => _$WtImageInfoFromJson(json);

@override final  String url;

/// Create a copy of WtImageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtImageInfoCopyWith<_WtImageInfo> get copyWith => __$WtImageInfoCopyWithImpl<_WtImageInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtImageInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtImageInfo&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'WtImageInfo(url: $url)';
}


}

/// @nodoc
abstract mixin class _$WtImageInfoCopyWith<$Res> implements $WtImageInfoCopyWith<$Res> {
  factory _$WtImageInfoCopyWith(_WtImageInfo value, $Res Function(_WtImageInfo) _then) = __$WtImageInfoCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$WtImageInfoCopyWithImpl<$Res>
    implements _$WtImageInfoCopyWith<$Res> {
  __$WtImageInfoCopyWithImpl(this._self, this._then);

  final _WtImageInfo _self;
  final $Res Function(_WtImageInfo) _then;

/// Create a copy of WtImageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_WtImageInfo(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WtEpisodeInfo {

 List<WtImageInfo> get imageInfo;
/// Create a copy of WtEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtEpisodeInfoCopyWith<WtEpisodeInfo> get copyWith => _$WtEpisodeInfoCopyWithImpl<WtEpisodeInfo>(this as WtEpisodeInfo, _$identity);

  /// Serializes this WtEpisodeInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtEpisodeInfo&&const DeepCollectionEquality().equals(other.imageInfo, imageInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageInfo));

@override
String toString() {
  return 'WtEpisodeInfo(imageInfo: $imageInfo)';
}


}

/// @nodoc
abstract mixin class $WtEpisodeInfoCopyWith<$Res>  {
  factory $WtEpisodeInfoCopyWith(WtEpisodeInfo value, $Res Function(WtEpisodeInfo) _then) = _$WtEpisodeInfoCopyWithImpl;
@useResult
$Res call({
 List<WtImageInfo> imageInfo
});




}
/// @nodoc
class _$WtEpisodeInfoCopyWithImpl<$Res>
    implements $WtEpisodeInfoCopyWith<$Res> {
  _$WtEpisodeInfoCopyWithImpl(this._self, this._then);

  final WtEpisodeInfo _self;
  final $Res Function(WtEpisodeInfo) _then;

/// Create a copy of WtEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageInfo = null,}) {
  return _then(WtEpisodeInfo(
imageInfo: null == imageInfo ? _self.imageInfo : imageInfo // ignore: cast_nullable_to_non_nullable
as List<WtImageInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [WtEpisodeInfo].
extension WtEpisodeInfoPatterns on WtEpisodeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtEpisodeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtEpisodeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtEpisodeInfo value)  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtEpisodeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WtImageInfo> imageInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtEpisodeInfo() when $default != null:
return $default(_that.imageInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WtImageInfo> imageInfo)  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeInfo():
return $default(_that.imageInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WtImageInfo> imageInfo)?  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeInfo() when $default != null:
return $default(_that.imageInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtEpisodeInfo implements WtEpisodeInfo {
  const _WtEpisodeInfo({ List<WtImageInfo> imageInfo = const []}): _imageInfo = imageInfo;
  factory _WtEpisodeInfo.fromJson(Map<String, dynamic> json) => _$WtEpisodeInfoFromJson(json);

 final  List<WtImageInfo> _imageInfo;
@override@JsonKey() List<WtImageInfo> get imageInfo {
  if (_imageInfo is EqualUnmodifiableListView) return _imageInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageInfo);
}


/// Create a copy of WtEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtEpisodeInfoCopyWith<_WtEpisodeInfo> get copyWith => __$WtEpisodeInfoCopyWithImpl<_WtEpisodeInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtEpisodeInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtEpisodeInfo&&const DeepCollectionEquality().equals(other._imageInfo, _imageInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_imageInfo));

@override
String toString() {
  return 'WtEpisodeInfo(imageInfo: $imageInfo)';
}


}

/// @nodoc
abstract mixin class _$WtEpisodeInfoCopyWith<$Res> implements $WtEpisodeInfoCopyWith<$Res> {
  factory _$WtEpisodeInfoCopyWith(_WtEpisodeInfo value, $Res Function(_WtEpisodeInfo) _then) = __$WtEpisodeInfoCopyWithImpl;
@override @useResult
$Res call({
 List<WtImageInfo> imageInfo
});




}
/// @nodoc
class __$WtEpisodeInfoCopyWithImpl<$Res>
    implements _$WtEpisodeInfoCopyWith<$Res> {
  __$WtEpisodeInfoCopyWithImpl(this._self, this._then);

  final _WtEpisodeInfo _self;
  final $Res Function(_WtEpisodeInfo) _then;

/// Create a copy of WtEpisodeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageInfo = null,}) {
  return _then(_WtEpisodeInfo(
imageInfo: null == imageInfo ? _self._imageInfo : imageInfo // ignore: cast_nullable_to_non_nullable
as List<WtImageInfo>,
  ));
}


}


/// @nodoc
mixin _$WtEpisodeInfoResult {

 WtEpisodeInfo get episodeInfo;
/// Create a copy of WtEpisodeInfoResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WtEpisodeInfoResultCopyWith<WtEpisodeInfoResult> get copyWith => _$WtEpisodeInfoResultCopyWithImpl<WtEpisodeInfoResult>(this as WtEpisodeInfoResult, _$identity);

  /// Serializes this WtEpisodeInfoResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WtEpisodeInfoResult&&(identical(other.episodeInfo, episodeInfo) || other.episodeInfo == episodeInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeInfo);

@override
String toString() {
  return 'WtEpisodeInfoResult(episodeInfo: $episodeInfo)';
}


}

/// @nodoc
abstract mixin class $WtEpisodeInfoResultCopyWith<$Res>  {
  factory $WtEpisodeInfoResultCopyWith(WtEpisodeInfoResult value, $Res Function(WtEpisodeInfoResult) _then) = _$WtEpisodeInfoResultCopyWithImpl;
@useResult
$Res call({
 WtEpisodeInfo episodeInfo
});


$WtEpisodeInfoCopyWith<$Res> get episodeInfo;

}
/// @nodoc
class _$WtEpisodeInfoResultCopyWithImpl<$Res>
    implements $WtEpisodeInfoResultCopyWith<$Res> {
  _$WtEpisodeInfoResultCopyWithImpl(this._self, this._then);

  final WtEpisodeInfoResult _self;
  final $Res Function(WtEpisodeInfoResult) _then;

/// Create a copy of WtEpisodeInfoResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episodeInfo = null,}) {
  return _then(WtEpisodeInfoResult(
episodeInfo: null == episodeInfo ? _self.episodeInfo : episodeInfo // ignore: cast_nullable_to_non_nullable
as WtEpisodeInfo,
  ));
}
/// Create a copy of WtEpisodeInfoResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtEpisodeInfoCopyWith<$Res> get episodeInfo {
  
  return $WtEpisodeInfoCopyWith<$Res>(_self.episodeInfo, (value) {
    return _then(_self.copyWith(episodeInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [WtEpisodeInfoResult].
extension WtEpisodeInfoResultPatterns on WtEpisodeInfoResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WtEpisodeInfoResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WtEpisodeInfoResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WtEpisodeInfoResult value)  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeInfoResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WtEpisodeInfoResult value)?  $default,){
final _that = this;
switch (_that) {
case _WtEpisodeInfoResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WtEpisodeInfo episodeInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WtEpisodeInfoResult() when $default != null:
return $default(_that.episodeInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WtEpisodeInfo episodeInfo)  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeInfoResult():
return $default(_that.episodeInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WtEpisodeInfo episodeInfo)?  $default,) {final _that = this;
switch (_that) {
case _WtEpisodeInfoResult() when $default != null:
return $default(_that.episodeInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WtEpisodeInfoResult implements WtEpisodeInfoResult {
  const _WtEpisodeInfoResult({required this.episodeInfo});
  factory _WtEpisodeInfoResult.fromJson(Map<String, dynamic> json) => _$WtEpisodeInfoResultFromJson(json);

@override final  WtEpisodeInfo episodeInfo;

/// Create a copy of WtEpisodeInfoResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WtEpisodeInfoResultCopyWith<_WtEpisodeInfoResult> get copyWith => __$WtEpisodeInfoResultCopyWithImpl<_WtEpisodeInfoResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WtEpisodeInfoResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WtEpisodeInfoResult&&(identical(other.episodeInfo, episodeInfo) || other.episodeInfo == episodeInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeInfo);

@override
String toString() {
  return 'WtEpisodeInfoResult(episodeInfo: $episodeInfo)';
}


}

/// @nodoc
abstract mixin class _$WtEpisodeInfoResultCopyWith<$Res> implements $WtEpisodeInfoResultCopyWith<$Res> {
  factory _$WtEpisodeInfoResultCopyWith(_WtEpisodeInfoResult value, $Res Function(_WtEpisodeInfoResult) _then) = __$WtEpisodeInfoResultCopyWithImpl;
@override @useResult
$Res call({
 WtEpisodeInfo episodeInfo
});


@override $WtEpisodeInfoCopyWith<$Res> get episodeInfo;

}
/// @nodoc
class __$WtEpisodeInfoResultCopyWithImpl<$Res>
    implements _$WtEpisodeInfoResultCopyWith<$Res> {
  __$WtEpisodeInfoResultCopyWithImpl(this._self, this._then);

  final _WtEpisodeInfoResult _self;
  final $Res Function(_WtEpisodeInfoResult) _then;

/// Create a copy of WtEpisodeInfoResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episodeInfo = null,}) {
  return _then(_WtEpisodeInfoResult(
episodeInfo: null == episodeInfo ? _self.episodeInfo : episodeInfo // ignore: cast_nullable_to_non_nullable
as WtEpisodeInfo,
  ));
}

/// Create a copy of WtEpisodeInfoResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WtEpisodeInfoCopyWith<$Res> get episodeInfo {
  
  return $WtEpisodeInfoCopyWith<$Res>(_self.episodeInfo, (value) {
    return _then(_self.copyWith(episodeInfo: value));
  });
}
}

// dart format on
