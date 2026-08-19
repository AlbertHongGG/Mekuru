// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicDetail {

@JsonKey(name: 'id') String get comicId;@JsonKey(name: 'provider_id') String get providerId; String get title;@JsonKey(name: 'cover_url') String get coverUrl; String? get author; String get description; List<String> get tags;@JsonKey(name: 'update_status') String get status;
/// Create a copy of ComicDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicDetailCopyWith<ComicDetail> get copyWith => _$ComicDetailCopyWithImpl<ComicDetail>(this as ComicDetail, _$identity);

  /// Serializes this ComicDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicDetail&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,author,description,const DeepCollectionEquality().hash(tags),status);

@override
String toString() {
  return 'ComicDetail(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, author: $author, description: $description, tags: $tags, status: $status)';
}


}

/// @nodoc
abstract mixin class $ComicDetailCopyWith<$Res>  {
  factory $ComicDetailCopyWith(ComicDetail value, $Res Function(ComicDetail) _then) = _$ComicDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String comicId,@JsonKey(name: 'provider_id') String providerId, String title,@JsonKey(name: 'cover_url') String coverUrl, String? author, String description, List<String> tags,@JsonKey(name: 'update_status') String status
});




}
/// @nodoc
class _$ComicDetailCopyWithImpl<$Res>
    implements $ComicDetailCopyWith<$Res> {
  _$ComicDetailCopyWithImpl(this._self, this._then);

  final ComicDetail _self;
  final $Res Function(ComicDetail) _then;

/// Create a copy of ComicDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = null,Object? providerId = null,Object? title = null,Object? coverUrl = null,Object? author = freezed,Object? description = null,Object? tags = null,Object? status = null,}) {
  return _then(ComicDetail(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicDetail].
extension ComicDetailPatterns on ComicDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicDetail value)  $default,){
final _that = this;
switch (_that) {
case _ComicDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ComicDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String title, @JsonKey(name: 'cover_url')  String coverUrl,  String? author,  String description,  List<String> tags, @JsonKey(name: 'update_status')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicDetail() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.author,_that.description,_that.tags,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String title, @JsonKey(name: 'cover_url')  String coverUrl,  String? author,  String description,  List<String> tags, @JsonKey(name: 'update_status')  String status)  $default,) {final _that = this;
switch (_that) {
case _ComicDetail():
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.author,_that.description,_that.tags,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String title, @JsonKey(name: 'cover_url')  String coverUrl,  String? author,  String description,  List<String> tags, @JsonKey(name: 'update_status')  String status)?  $default,) {final _that = this;
switch (_that) {
case _ComicDetail() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.author,_that.description,_that.tags,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicDetail implements ComicDetail {
  const _ComicDetail({@JsonKey(name: 'id') required this.comicId, @JsonKey(name: 'provider_id') required this.providerId, required this.title, @JsonKey(name: 'cover_url') required this.coverUrl, this.author, required this.description,  List<String> tags = const [], @JsonKey(name: 'update_status') this.status = ''}): _tags = tags;
  factory _ComicDetail.fromJson(Map<String, dynamic> json) => _$ComicDetailFromJson(json);

@override@JsonKey(name: 'id') final  String comicId;
@override@JsonKey(name: 'provider_id') final  String providerId;
@override final  String title;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override final  String? author;
@override final  String description;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'update_status') final  String status;

/// Create a copy of ComicDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicDetailCopyWith<_ComicDetail> get copyWith => __$ComicDetailCopyWithImpl<_ComicDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicDetail&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,author,description,const DeepCollectionEquality().hash(_tags),status);

@override
String toString() {
  return 'ComicDetail(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, author: $author, description: $description, tags: $tags, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ComicDetailCopyWith<$Res> implements $ComicDetailCopyWith<$Res> {
  factory _$ComicDetailCopyWith(_ComicDetail value, $Res Function(_ComicDetail) _then) = __$ComicDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String comicId,@JsonKey(name: 'provider_id') String providerId, String title,@JsonKey(name: 'cover_url') String coverUrl, String? author, String description, List<String> tags,@JsonKey(name: 'update_status') String status
});




}
/// @nodoc
class __$ComicDetailCopyWithImpl<$Res>
    implements _$ComicDetailCopyWith<$Res> {
  __$ComicDetailCopyWithImpl(this._self, this._then);

  final _ComicDetail _self;
  final $Res Function(_ComicDetail) _then;

/// Create a copy of ComicDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = null,Object? providerId = null,Object? title = null,Object? coverUrl = null,Object? author = freezed,Object? description = null,Object? tags = null,Object? status = null,}) {
  return _then(_ComicDetail(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ComicExploreResult {

@JsonKey(name: 'id') String get comicId;@JsonKey(name: 'provider_id') String get providerId; String get title;@JsonKey(name: 'cover_url') String get coverUrl; List<String> get tags;
/// Create a copy of ComicExploreResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicExploreResultCopyWith<ComicExploreResult> get copyWith => _$ComicExploreResultCopyWithImpl<ComicExploreResult>(this as ComicExploreResult, _$identity);

  /// Serializes this ComicExploreResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicExploreResult&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ComicExploreResult(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ComicExploreResultCopyWith<$Res>  {
  factory $ComicExploreResultCopyWith(ComicExploreResult value, $Res Function(ComicExploreResult) _then) = _$ComicExploreResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String comicId,@JsonKey(name: 'provider_id') String providerId, String title,@JsonKey(name: 'cover_url') String coverUrl, List<String> tags
});




}
/// @nodoc
class _$ComicExploreResultCopyWithImpl<$Res>
    implements $ComicExploreResultCopyWith<$Res> {
  _$ComicExploreResultCopyWithImpl(this._self, this._then);

  final ComicExploreResult _self;
  final $Res Function(ComicExploreResult) _then;

/// Create a copy of ComicExploreResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = null,Object? providerId = null,Object? title = null,Object? coverUrl = null,Object? tags = null,}) {
  return _then(ComicExploreResult(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicExploreResult].
extension ComicExploreResultPatterns on ComicExploreResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicExploreResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicExploreResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicExploreResult value)  $default,){
final _that = this;
switch (_that) {
case _ComicExploreResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicExploreResult value)?  $default,){
final _that = this;
switch (_that) {
case _ComicExploreResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String title, @JsonKey(name: 'cover_url')  String coverUrl,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicExploreResult() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String title, @JsonKey(name: 'cover_url')  String coverUrl,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _ComicExploreResult():
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String title, @JsonKey(name: 'cover_url')  String coverUrl,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _ComicExploreResult() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicExploreResult implements ComicExploreResult {
  const _ComicExploreResult({@JsonKey(name: 'id') required this.comicId, @JsonKey(name: 'provider_id') required this.providerId, required this.title, @JsonKey(name: 'cover_url') required this.coverUrl,  List<String> tags = const []}): _tags = tags;
  factory _ComicExploreResult.fromJson(Map<String, dynamic> json) => _$ComicExploreResultFromJson(json);

@override@JsonKey(name: 'id') final  String comicId;
@override@JsonKey(name: 'provider_id') final  String providerId;
@override final  String title;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ComicExploreResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicExploreResultCopyWith<_ComicExploreResult> get copyWith => __$ComicExploreResultCopyWithImpl<_ComicExploreResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicExploreResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicExploreResult&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ComicExploreResult(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ComicExploreResultCopyWith<$Res> implements $ComicExploreResultCopyWith<$Res> {
  factory _$ComicExploreResultCopyWith(_ComicExploreResult value, $Res Function(_ComicExploreResult) _then) = __$ComicExploreResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String comicId,@JsonKey(name: 'provider_id') String providerId, String title,@JsonKey(name: 'cover_url') String coverUrl, List<String> tags
});




}
/// @nodoc
class __$ComicExploreResultCopyWithImpl<$Res>
    implements _$ComicExploreResultCopyWith<$Res> {
  __$ComicExploreResultCopyWithImpl(this._self, this._then);

  final _ComicExploreResult _self;
  final $Res Function(_ComicExploreResult) _then;

/// Create a copy of ComicExploreResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = null,Object? providerId = null,Object? title = null,Object? coverUrl = null,Object? tags = null,}) {
  return _then(_ComicExploreResult(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ComicSearchResult {

@JsonKey(name: 'id') String get comicId;@JsonKey(name: 'provider_id') String get providerId; String? get title;@JsonKey(name: 'cover_url') String? get coverUrl; List<String> get tags;
/// Create a copy of ComicSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicSearchResultCopyWith<ComicSearchResult> get copyWith => _$ComicSearchResultCopyWithImpl<ComicSearchResult>(this as ComicSearchResult, _$identity);

  /// Serializes this ComicSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicSearchResult&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ComicSearchResult(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ComicSearchResultCopyWith<$Res>  {
  factory $ComicSearchResultCopyWith(ComicSearchResult value, $Res Function(ComicSearchResult) _then) = _$ComicSearchResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String comicId,@JsonKey(name: 'provider_id') String providerId, String? title,@JsonKey(name: 'cover_url') String? coverUrl, List<String> tags
});




}
/// @nodoc
class _$ComicSearchResultCopyWithImpl<$Res>
    implements $ComicSearchResultCopyWith<$Res> {
  _$ComicSearchResultCopyWithImpl(this._self, this._then);

  final ComicSearchResult _self;
  final $Res Function(ComicSearchResult) _then;

/// Create a copy of ComicSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = null,Object? providerId = null,Object? title = freezed,Object? coverUrl = freezed,Object? tags = null,}) {
  return _then(ComicSearchResult(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicSearchResult].
extension ComicSearchResultPatterns on ComicSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _ComicSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _ComicSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String? title, @JsonKey(name: 'cover_url')  String? coverUrl,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicSearchResult() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String? title, @JsonKey(name: 'cover_url')  String? coverUrl,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _ComicSearchResult():
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String comicId, @JsonKey(name: 'provider_id')  String providerId,  String? title, @JsonKey(name: 'cover_url')  String? coverUrl,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _ComicSearchResult() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicSearchResult implements ComicSearchResult {
  const _ComicSearchResult({@JsonKey(name: 'id') required this.comicId, @JsonKey(name: 'provider_id') required this.providerId, this.title, @JsonKey(name: 'cover_url') this.coverUrl,  List<String> tags = const []}): _tags = tags;
  factory _ComicSearchResult.fromJson(Map<String, dynamic> json) => _$ComicSearchResultFromJson(json);

@override@JsonKey(name: 'id') final  String comicId;
@override@JsonKey(name: 'provider_id') final  String providerId;
@override final  String? title;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ComicSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicSearchResultCopyWith<_ComicSearchResult> get copyWith => __$ComicSearchResultCopyWithImpl<_ComicSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicSearchResult&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ComicSearchResult(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ComicSearchResultCopyWith<$Res> implements $ComicSearchResultCopyWith<$Res> {
  factory _$ComicSearchResultCopyWith(_ComicSearchResult value, $Res Function(_ComicSearchResult) _then) = __$ComicSearchResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String comicId,@JsonKey(name: 'provider_id') String providerId, String? title,@JsonKey(name: 'cover_url') String? coverUrl, List<String> tags
});




}
/// @nodoc
class __$ComicSearchResultCopyWithImpl<$Res>
    implements _$ComicSearchResultCopyWith<$Res> {
  __$ComicSearchResultCopyWithImpl(this._self, this._then);

  final _ComicSearchResult _self;
  final $Res Function(_ComicSearchResult) _then;

/// Create a copy of ComicSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = null,Object? providerId = null,Object? title = freezed,Object? coverUrl = freezed,Object? tags = null,}) {
  return _then(_ComicSearchResult(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
