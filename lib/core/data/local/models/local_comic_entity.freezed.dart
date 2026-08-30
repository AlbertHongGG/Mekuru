// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_comic_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalComicEntity {

 String get providerId; String get comicId; String get title; String get coverUrl; List<String> get tags; String get author; String get description; List<String> get chapterIds; List<LocalChapterEntity> get chapters; DateTime get archivedAt;
/// Create a copy of LocalComicEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalComicEntityCopyWith<LocalComicEntity> get copyWith => _$LocalComicEntityCopyWithImpl<LocalComicEntity>(this as LocalComicEntity, _$identity);

  /// Serializes this LocalComicEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalComicEntity&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.chapterIds, chapterIds)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,comicId,title,coverUrl,const DeepCollectionEquality().hash(tags),author,description,const DeepCollectionEquality().hash(chapterIds),const DeepCollectionEquality().hash(chapters),archivedAt);

@override
String toString() {
  return 'LocalComicEntity(providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, tags: $tags, author: $author, description: $description, chapterIds: $chapterIds, chapters: $chapters, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class $LocalComicEntityCopyWith<$Res>  {
  factory $LocalComicEntityCopyWith(LocalComicEntity value, $Res Function(LocalComicEntity) _then) = _$LocalComicEntityCopyWithImpl;
@useResult
$Res call({
 String providerId, String comicId, String title, String coverUrl, List<String> tags, String author, String description, List<String> chapterIds, List<LocalChapterEntity> chapters, DateTime archivedAt
});




}
/// @nodoc
class _$LocalComicEntityCopyWithImpl<$Res>
    implements $LocalComicEntityCopyWith<$Res> {
  _$LocalComicEntityCopyWithImpl(this._self, this._then);

  final LocalComicEntity _self;
  final $Res Function(LocalComicEntity) _then;

/// Create a copy of LocalComicEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? tags = null,Object? author = null,Object? description = null,Object? chapterIds = null,Object? chapters = null,Object? archivedAt = null,}) {
  return _then(LocalComicEntity(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,chapterIds: null == chapterIds ? _self.chapterIds : chapterIds // ignore: cast_nullable_to_non_nullable
as List<String>,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<LocalChapterEntity>,archivedAt: null == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalComicEntity].
extension LocalComicEntityPatterns on LocalComicEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalComicEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalComicEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalComicEntity value)  $default,){
final _that = this;
switch (_that) {
case _LocalComicEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalComicEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LocalComicEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String providerId,  String comicId,  String title,  String coverUrl,  List<String> tags,  String author,  String description,  List<String> chapterIds,  List<LocalChapterEntity> chapters,  DateTime archivedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalComicEntity() when $default != null:
return $default(_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.tags,_that.author,_that.description,_that.chapterIds,_that.chapters,_that.archivedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String providerId,  String comicId,  String title,  String coverUrl,  List<String> tags,  String author,  String description,  List<String> chapterIds,  List<LocalChapterEntity> chapters,  DateTime archivedAt)  $default,) {final _that = this;
switch (_that) {
case _LocalComicEntity():
return $default(_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.tags,_that.author,_that.description,_that.chapterIds,_that.chapters,_that.archivedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String providerId,  String comicId,  String title,  String coverUrl,  List<String> tags,  String author,  String description,  List<String> chapterIds,  List<LocalChapterEntity> chapters,  DateTime archivedAt)?  $default,) {final _that = this;
switch (_that) {
case _LocalComicEntity() when $default != null:
return $default(_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.tags,_that.author,_that.description,_that.chapterIds,_that.chapters,_that.archivedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalComicEntity implements LocalComicEntity {
  const _LocalComicEntity({required this.providerId, required this.comicId, required this.title, required this.coverUrl,  List<String> tags = const [], this.author = '', this.description = '',  List<String> chapterIds = const [],  List<LocalChapterEntity> chapters = const [], required this.archivedAt}): _tags = tags,_chapterIds = chapterIds,_chapters = chapters;
  factory _LocalComicEntity.fromJson(Map<String, dynamic> json) => _$LocalComicEntityFromJson(json);

@override final  String providerId;
@override final  String comicId;
@override final  String title;
@override final  String coverUrl;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String author;
@override@JsonKey() final  String description;
 final  List<String> _chapterIds;
@override@JsonKey() List<String> get chapterIds {
  if (_chapterIds is EqualUnmodifiableListView) return _chapterIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapterIds);
}

 final  List<LocalChapterEntity> _chapters;
@override@JsonKey() List<LocalChapterEntity> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  DateTime archivedAt;

/// Create a copy of LocalComicEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalComicEntityCopyWith<_LocalComicEntity> get copyWith => __$LocalComicEntityCopyWithImpl<_LocalComicEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalComicEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalComicEntity&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._chapterIds, _chapterIds)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,comicId,title,coverUrl,const DeepCollectionEquality().hash(_tags),author,description,const DeepCollectionEquality().hash(_chapterIds),const DeepCollectionEquality().hash(_chapters),archivedAt);

@override
String toString() {
  return 'LocalComicEntity(providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, tags: $tags, author: $author, description: $description, chapterIds: $chapterIds, chapters: $chapters, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class _$LocalComicEntityCopyWith<$Res> implements $LocalComicEntityCopyWith<$Res> {
  factory _$LocalComicEntityCopyWith(_LocalComicEntity value, $Res Function(_LocalComicEntity) _then) = __$LocalComicEntityCopyWithImpl;
@override @useResult
$Res call({
 String providerId, String comicId, String title, String coverUrl, List<String> tags, String author, String description, List<String> chapterIds, List<LocalChapterEntity> chapters, DateTime archivedAt
});




}
/// @nodoc
class __$LocalComicEntityCopyWithImpl<$Res>
    implements _$LocalComicEntityCopyWith<$Res> {
  __$LocalComicEntityCopyWithImpl(this._self, this._then);

  final _LocalComicEntity _self;
  final $Res Function(_LocalComicEntity) _then;

/// Create a copy of LocalComicEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? tags = null,Object? author = null,Object? description = null,Object? chapterIds = null,Object? chapters = null,Object? archivedAt = null,}) {
  return _then(_LocalComicEntity(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,chapterIds: null == chapterIds ? _self._chapterIds : chapterIds // ignore: cast_nullable_to_non_nullable
as List<String>,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<LocalChapterEntity>,archivedAt: null == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
