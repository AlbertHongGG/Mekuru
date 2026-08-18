// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_comic_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalComicRecord {

 String get id; String get dataSourceMode; String get providerId; String get comicId; String get title; String get coverUrl; bool get isFavorite; String? get lastReadChapterId; String? get lastReadChapterTitle; int? get lastReadPageIndex; DateTime get updatedAt; DateTime? get favoriteAt;
/// Create a copy of LocalComicRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalComicRecordCopyWith<LocalComicRecord> get copyWith => _$LocalComicRecordCopyWithImpl<LocalComicRecord>(this as LocalComicRecord, _$identity);

  /// Serializes this LocalComicRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalComicRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.dataSourceMode, dataSourceMode) || other.dataSourceMode == dataSourceMode)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.lastReadChapterId, lastReadChapterId) || other.lastReadChapterId == lastReadChapterId)&&(identical(other.lastReadChapterTitle, lastReadChapterTitle) || other.lastReadChapterTitle == lastReadChapterTitle)&&(identical(other.lastReadPageIndex, lastReadPageIndex) || other.lastReadPageIndex == lastReadPageIndex)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.favoriteAt, favoriteAt) || other.favoriteAt == favoriteAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dataSourceMode,providerId,comicId,title,coverUrl,isFavorite,lastReadChapterId,lastReadChapterTitle,lastReadPageIndex,updatedAt,favoriteAt);

@override
String toString() {
  return 'LocalComicRecord(id: $id, dataSourceMode: $dataSourceMode, providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, isFavorite: $isFavorite, lastReadChapterId: $lastReadChapterId, lastReadChapterTitle: $lastReadChapterTitle, lastReadPageIndex: $lastReadPageIndex, updatedAt: $updatedAt, favoriteAt: $favoriteAt)';
}


}

/// @nodoc
abstract mixin class $LocalComicRecordCopyWith<$Res>  {
  factory $LocalComicRecordCopyWith(LocalComicRecord value, $Res Function(LocalComicRecord) _then) = _$LocalComicRecordCopyWithImpl;
@useResult
$Res call({
 String id, String dataSourceMode, String providerId, String comicId, String title, String coverUrl, bool isFavorite, String? lastReadChapterId, String? lastReadChapterTitle, int? lastReadPageIndex, DateTime updatedAt, DateTime? favoriteAt
});




}
/// @nodoc
class _$LocalComicRecordCopyWithImpl<$Res>
    implements $LocalComicRecordCopyWith<$Res> {
  _$LocalComicRecordCopyWithImpl(this._self, this._then);

  final LocalComicRecord _self;
  final $Res Function(LocalComicRecord) _then;

/// Create a copy of LocalComicRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dataSourceMode = null,Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? isFavorite = null,Object? lastReadChapterId = freezed,Object? lastReadChapterTitle = freezed,Object? lastReadPageIndex = freezed,Object? updatedAt = null,Object? favoriteAt = freezed,}) {
  return _then(LocalComicRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dataSourceMode: null == dataSourceMode ? _self.dataSourceMode : dataSourceMode // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,lastReadChapterId: freezed == lastReadChapterId ? _self.lastReadChapterId : lastReadChapterId // ignore: cast_nullable_to_non_nullable
as String?,lastReadChapterTitle: freezed == lastReadChapterTitle ? _self.lastReadChapterTitle : lastReadChapterTitle // ignore: cast_nullable_to_non_nullable
as String?,lastReadPageIndex: freezed == lastReadPageIndex ? _self.lastReadPageIndex : lastReadPageIndex // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,favoriteAt: freezed == favoriteAt ? _self.favoriteAt : favoriteAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalComicRecord].
extension LocalComicRecordPatterns on LocalComicRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalComicRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalComicRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalComicRecord value)  $default,){
final _that = this;
switch (_that) {
case _LocalComicRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalComicRecord value)?  $default,){
final _that = this;
switch (_that) {
case _LocalComicRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String dataSourceMode,  String providerId,  String comicId,  String title,  String coverUrl,  bool isFavorite,  String? lastReadChapterId,  String? lastReadChapterTitle,  int? lastReadPageIndex,  DateTime updatedAt,  DateTime? favoriteAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalComicRecord() when $default != null:
return $default(_that.id,_that.dataSourceMode,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.isFavorite,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.favoriteAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String dataSourceMode,  String providerId,  String comicId,  String title,  String coverUrl,  bool isFavorite,  String? lastReadChapterId,  String? lastReadChapterTitle,  int? lastReadPageIndex,  DateTime updatedAt,  DateTime? favoriteAt)  $default,) {final _that = this;
switch (_that) {
case _LocalComicRecord():
return $default(_that.id,_that.dataSourceMode,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.isFavorite,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.favoriteAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String dataSourceMode,  String providerId,  String comicId,  String title,  String coverUrl,  bool isFavorite,  String? lastReadChapterId,  String? lastReadChapterTitle,  int? lastReadPageIndex,  DateTime updatedAt,  DateTime? favoriteAt)?  $default,) {final _that = this;
switch (_that) {
case _LocalComicRecord() when $default != null:
return $default(_that.id,_that.dataSourceMode,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.isFavorite,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.favoriteAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalComicRecord implements LocalComicRecord {
  const _LocalComicRecord({required this.id, required this.dataSourceMode, required this.providerId, required this.comicId, required this.title, required this.coverUrl, this.isFavorite = false, this.lastReadChapterId, this.lastReadChapterTitle, this.lastReadPageIndex, required this.updatedAt, this.favoriteAt});
  factory _LocalComicRecord.fromJson(Map<String, dynamic> json) => _$LocalComicRecordFromJson(json);

@override final  String id;
@override final  String dataSourceMode;
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

/// Create a copy of LocalComicRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalComicRecordCopyWith<_LocalComicRecord> get copyWith => __$LocalComicRecordCopyWithImpl<_LocalComicRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalComicRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalComicRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.dataSourceMode, dataSourceMode) || other.dataSourceMode == dataSourceMode)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.lastReadChapterId, lastReadChapterId) || other.lastReadChapterId == lastReadChapterId)&&(identical(other.lastReadChapterTitle, lastReadChapterTitle) || other.lastReadChapterTitle == lastReadChapterTitle)&&(identical(other.lastReadPageIndex, lastReadPageIndex) || other.lastReadPageIndex == lastReadPageIndex)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.favoriteAt, favoriteAt) || other.favoriteAt == favoriteAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dataSourceMode,providerId,comicId,title,coverUrl,isFavorite,lastReadChapterId,lastReadChapterTitle,lastReadPageIndex,updatedAt,favoriteAt);

@override
String toString() {
  return 'LocalComicRecord(id: $id, dataSourceMode: $dataSourceMode, providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, isFavorite: $isFavorite, lastReadChapterId: $lastReadChapterId, lastReadChapterTitle: $lastReadChapterTitle, lastReadPageIndex: $lastReadPageIndex, updatedAt: $updatedAt, favoriteAt: $favoriteAt)';
}


}

/// @nodoc
abstract mixin class _$LocalComicRecordCopyWith<$Res> implements $LocalComicRecordCopyWith<$Res> {
  factory _$LocalComicRecordCopyWith(_LocalComicRecord value, $Res Function(_LocalComicRecord) _then) = __$LocalComicRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String dataSourceMode, String providerId, String comicId, String title, String coverUrl, bool isFavorite, String? lastReadChapterId, String? lastReadChapterTitle, int? lastReadPageIndex, DateTime updatedAt, DateTime? favoriteAt
});




}
/// @nodoc
class __$LocalComicRecordCopyWithImpl<$Res>
    implements _$LocalComicRecordCopyWith<$Res> {
  __$LocalComicRecordCopyWithImpl(this._self, this._then);

  final _LocalComicRecord _self;
  final $Res Function(_LocalComicRecord) _then;

/// Create a copy of LocalComicRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dataSourceMode = null,Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? isFavorite = null,Object? lastReadChapterId = freezed,Object? lastReadChapterTitle = freezed,Object? lastReadPageIndex = freezed,Object? updatedAt = null,Object? favoriteAt = freezed,}) {
  return _then(_LocalComicRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dataSourceMode: null == dataSourceMode ? _self.dataSourceMode : dataSourceMode // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,lastReadChapterId: freezed == lastReadChapterId ? _self.lastReadChapterId : lastReadChapterId // ignore: cast_nullable_to_non_nullable
as String?,lastReadChapterTitle: freezed == lastReadChapterTitle ? _self.lastReadChapterTitle : lastReadChapterTitle // ignore: cast_nullable_to_non_nullable
as String?,lastReadPageIndex: freezed == lastReadPageIndex ? _self.lastReadPageIndex : lastReadPageIndex // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,favoriteAt: freezed == favoriteAt ? _self.favoriteAt : favoriteAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
