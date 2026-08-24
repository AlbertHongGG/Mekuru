// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComicRecord {

 String get id; DataSourceMode get dataSourceMode; String get providerId; String get comicId; String get title; String get coverUrl; bool get isFavorite; String? get lastReadChapterId; String? get lastReadChapterTitle; int? get lastReadPageIndex; DateTime get updatedAt; DateTime? get favoriteAt; DateTime? get readAt;
/// Create a copy of ComicRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicRecordCopyWith<ComicRecord> get copyWith => _$ComicRecordCopyWithImpl<ComicRecord>(this as ComicRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.dataSourceMode, dataSourceMode) || other.dataSourceMode == dataSourceMode)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.lastReadChapterId, lastReadChapterId) || other.lastReadChapterId == lastReadChapterId)&&(identical(other.lastReadChapterTitle, lastReadChapterTitle) || other.lastReadChapterTitle == lastReadChapterTitle)&&(identical(other.lastReadPageIndex, lastReadPageIndex) || other.lastReadPageIndex == lastReadPageIndex)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.favoriteAt, favoriteAt) || other.favoriteAt == favoriteAt)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,dataSourceMode,providerId,comicId,title,coverUrl,isFavorite,lastReadChapterId,lastReadChapterTitle,lastReadPageIndex,updatedAt,favoriteAt,readAt);

@override
String toString() {
  return 'ComicRecord(id: $id, dataSourceMode: $dataSourceMode, providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, isFavorite: $isFavorite, lastReadChapterId: $lastReadChapterId, lastReadChapterTitle: $lastReadChapterTitle, lastReadPageIndex: $lastReadPageIndex, updatedAt: $updatedAt, favoriteAt: $favoriteAt, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $ComicRecordCopyWith<$Res>  {
  factory $ComicRecordCopyWith(ComicRecord value, $Res Function(ComicRecord) _then) = _$ComicRecordCopyWithImpl;
@useResult
$Res call({
 String id, DataSourceMode dataSourceMode, String providerId, String comicId, String title, String coverUrl, bool isFavorite, String? lastReadChapterId, String? lastReadChapterTitle, int? lastReadPageIndex, DateTime updatedAt, DateTime? favoriteAt, DateTime? readAt
});




}
/// @nodoc
class _$ComicRecordCopyWithImpl<$Res>
    implements $ComicRecordCopyWith<$Res> {
  _$ComicRecordCopyWithImpl(this._self, this._then);

  final ComicRecord _self;
  final $Res Function(ComicRecord) _then;

/// Create a copy of ComicRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dataSourceMode = null,Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? isFavorite = null,Object? lastReadChapterId = freezed,Object? lastReadChapterTitle = freezed,Object? lastReadPageIndex = freezed,Object? updatedAt = null,Object? favoriteAt = freezed,Object? readAt = freezed,}) {
  return _then(ComicRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dataSourceMode: null == dataSourceMode ? _self.dataSourceMode : dataSourceMode // ignore: cast_nullable_to_non_nullable
as DataSourceMode,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,lastReadChapterId: freezed == lastReadChapterId ? _self.lastReadChapterId : lastReadChapterId // ignore: cast_nullable_to_non_nullable
as String?,lastReadChapterTitle: freezed == lastReadChapterTitle ? _self.lastReadChapterTitle : lastReadChapterTitle // ignore: cast_nullable_to_non_nullable
as String?,lastReadPageIndex: freezed == lastReadPageIndex ? _self.lastReadPageIndex : lastReadPageIndex // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,favoriteAt: freezed == favoriteAt ? _self.favoriteAt : favoriteAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicRecord].
extension ComicRecordPatterns on ComicRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicRecord value)  $default,){
final _that = this;
switch (_that) {
case _ComicRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ComicRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DataSourceMode dataSourceMode,  String providerId,  String comicId,  String title,  String coverUrl,  bool isFavorite,  String? lastReadChapterId,  String? lastReadChapterTitle,  int? lastReadPageIndex,  DateTime updatedAt,  DateTime? favoriteAt,  DateTime? readAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicRecord() when $default != null:
return $default(_that.id,_that.dataSourceMode,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.isFavorite,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.favoriteAt,_that.readAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DataSourceMode dataSourceMode,  String providerId,  String comicId,  String title,  String coverUrl,  bool isFavorite,  String? lastReadChapterId,  String? lastReadChapterTitle,  int? lastReadPageIndex,  DateTime updatedAt,  DateTime? favoriteAt,  DateTime? readAt)  $default,) {final _that = this;
switch (_that) {
case _ComicRecord():
return $default(_that.id,_that.dataSourceMode,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.isFavorite,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.favoriteAt,_that.readAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DataSourceMode dataSourceMode,  String providerId,  String comicId,  String title,  String coverUrl,  bool isFavorite,  String? lastReadChapterId,  String? lastReadChapterTitle,  int? lastReadPageIndex,  DateTime updatedAt,  DateTime? favoriteAt,  DateTime? readAt)?  $default,) {final _that = this;
switch (_that) {
case _ComicRecord() when $default != null:
return $default(_that.id,_that.dataSourceMode,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.isFavorite,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.favoriteAt,_that.readAt);case _:
  return null;

}
}

}

/// @nodoc


class _ComicRecord extends ComicRecord {
  const _ComicRecord({required this.id, required this.dataSourceMode, required this.providerId, required this.comicId, required this.title, required this.coverUrl, this.isFavorite = false, this.lastReadChapterId, this.lastReadChapterTitle, this.lastReadPageIndex, required this.updatedAt, this.favoriteAt, this.readAt}): super._();
  

@override final  String id;
@override final  DataSourceMode dataSourceMode;
@override final  String providerId;
@override final  String comicId;
@override final  String title;
@override final  String coverUrl;
@override@JsonKey() final  bool isFavorite;
@override final  String? lastReadChapterId;
@override final  String? lastReadChapterTitle;
@override final  int? lastReadPageIndex;
@override final  DateTime updatedAt;
@override final  DateTime? favoriteAt;
@override final  DateTime? readAt;

/// Create a copy of ComicRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicRecordCopyWith<_ComicRecord> get copyWith => __$ComicRecordCopyWithImpl<_ComicRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.dataSourceMode, dataSourceMode) || other.dataSourceMode == dataSourceMode)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.lastReadChapterId, lastReadChapterId) || other.lastReadChapterId == lastReadChapterId)&&(identical(other.lastReadChapterTitle, lastReadChapterTitle) || other.lastReadChapterTitle == lastReadChapterTitle)&&(identical(other.lastReadPageIndex, lastReadPageIndex) || other.lastReadPageIndex == lastReadPageIndex)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.favoriteAt, favoriteAt) || other.favoriteAt == favoriteAt)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,dataSourceMode,providerId,comicId,title,coverUrl,isFavorite,lastReadChapterId,lastReadChapterTitle,lastReadPageIndex,updatedAt,favoriteAt,readAt);

@override
String toString() {
  return 'ComicRecord(id: $id, dataSourceMode: $dataSourceMode, providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, isFavorite: $isFavorite, lastReadChapterId: $lastReadChapterId, lastReadChapterTitle: $lastReadChapterTitle, lastReadPageIndex: $lastReadPageIndex, updatedAt: $updatedAt, favoriteAt: $favoriteAt, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$ComicRecordCopyWith<$Res> implements $ComicRecordCopyWith<$Res> {
  factory _$ComicRecordCopyWith(_ComicRecord value, $Res Function(_ComicRecord) _then) = __$ComicRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, DataSourceMode dataSourceMode, String providerId, String comicId, String title, String coverUrl, bool isFavorite, String? lastReadChapterId, String? lastReadChapterTitle, int? lastReadPageIndex, DateTime updatedAt, DateTime? favoriteAt, DateTime? readAt
});




}
/// @nodoc
class __$ComicRecordCopyWithImpl<$Res>
    implements _$ComicRecordCopyWith<$Res> {
  __$ComicRecordCopyWithImpl(this._self, this._then);

  final _ComicRecord _self;
  final $Res Function(_ComicRecord) _then;

/// Create a copy of ComicRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dataSourceMode = null,Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? isFavorite = null,Object? lastReadChapterId = freezed,Object? lastReadChapterTitle = freezed,Object? lastReadPageIndex = freezed,Object? updatedAt = null,Object? favoriteAt = freezed,Object? readAt = freezed,}) {
  return _then(_ComicRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dataSourceMode: null == dataSourceMode ? _self.dataSourceMode : dataSourceMode // ignore: cast_nullable_to_non_nullable
as DataSourceMode,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,lastReadChapterId: freezed == lastReadChapterId ? _self.lastReadChapterId : lastReadChapterId // ignore: cast_nullable_to_non_nullable
as String?,lastReadChapterTitle: freezed == lastReadChapterTitle ? _self.lastReadChapterTitle : lastReadChapterTitle // ignore: cast_nullable_to_non_nullable
as String?,lastReadPageIndex: freezed == lastReadPageIndex ? _self.lastReadPageIndex : lastReadPageIndex // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,favoriteAt: freezed == favoriteAt ? _self.favoriteAt : favoriteAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
