// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_metadata_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicMetadataEntity {

 String get id; String get providerId; String get comicId; String get title; String get coverUrl; DateTime get updatedAt; DateTime? get sourceUpdatedAt; int? get totalChapters; String? get latestChapterTitle;
/// Create a copy of ComicMetadataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicMetadataEntityCopyWith<ComicMetadataEntity> get copyWith => _$ComicMetadataEntityCopyWithImpl<ComicMetadataEntity>(this as ComicMetadataEntity, _$identity);

  /// Serializes this ComicMetadataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicMetadataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sourceUpdatedAt, sourceUpdatedAt) || other.sourceUpdatedAt == sourceUpdatedAt)&&(identical(other.totalChapters, totalChapters) || other.totalChapters == totalChapters)&&(identical(other.latestChapterTitle, latestChapterTitle) || other.latestChapterTitle == latestChapterTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,comicId,title,coverUrl,updatedAt,sourceUpdatedAt,totalChapters,latestChapterTitle);

@override
String toString() {
  return 'ComicMetadataEntity(id: $id, providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, updatedAt: $updatedAt, sourceUpdatedAt: $sourceUpdatedAt, totalChapters: $totalChapters, latestChapterTitle: $latestChapterTitle)';
}


}

/// @nodoc
abstract mixin class $ComicMetadataEntityCopyWith<$Res>  {
  factory $ComicMetadataEntityCopyWith(ComicMetadataEntity value, $Res Function(ComicMetadataEntity) _then) = _$ComicMetadataEntityCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String comicId, String title, String coverUrl, DateTime updatedAt, DateTime? sourceUpdatedAt, int? totalChapters, String? latestChapterTitle
});




}
/// @nodoc
class _$ComicMetadataEntityCopyWithImpl<$Res>
    implements $ComicMetadataEntityCopyWith<$Res> {
  _$ComicMetadataEntityCopyWithImpl(this._self, this._then);

  final ComicMetadataEntity _self;
  final $Res Function(ComicMetadataEntity) _then;

/// Create a copy of ComicMetadataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? updatedAt = null,Object? sourceUpdatedAt = freezed,Object? totalChapters = freezed,Object? latestChapterTitle = freezed,}) {
  return _then(ComicMetadataEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sourceUpdatedAt: freezed == sourceUpdatedAt ? _self.sourceUpdatedAt : sourceUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalChapters: freezed == totalChapters ? _self.totalChapters : totalChapters // ignore: cast_nullable_to_non_nullable
as int?,latestChapterTitle: freezed == latestChapterTitle ? _self.latestChapterTitle : latestChapterTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicMetadataEntity].
extension ComicMetadataEntityPatterns on ComicMetadataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicMetadataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicMetadataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicMetadataEntity value)  $default,){
final _that = this;
switch (_that) {
case _ComicMetadataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicMetadataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ComicMetadataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String comicId,  String title,  String coverUrl,  DateTime updatedAt,  DateTime? sourceUpdatedAt,  int? totalChapters,  String? latestChapterTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicMetadataEntity() when $default != null:
return $default(_that.id,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.updatedAt,_that.sourceUpdatedAt,_that.totalChapters,_that.latestChapterTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String comicId,  String title,  String coverUrl,  DateTime updatedAt,  DateTime? sourceUpdatedAt,  int? totalChapters,  String? latestChapterTitle)  $default,) {final _that = this;
switch (_that) {
case _ComicMetadataEntity():
return $default(_that.id,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.updatedAt,_that.sourceUpdatedAt,_that.totalChapters,_that.latestChapterTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String comicId,  String title,  String coverUrl,  DateTime updatedAt,  DateTime? sourceUpdatedAt,  int? totalChapters,  String? latestChapterTitle)?  $default,) {final _that = this;
switch (_that) {
case _ComicMetadataEntity() when $default != null:
return $default(_that.id,_that.providerId,_that.comicId,_that.title,_that.coverUrl,_that.updatedAt,_that.sourceUpdatedAt,_that.totalChapters,_that.latestChapterTitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicMetadataEntity implements ComicMetadataEntity {
  const _ComicMetadataEntity({required this.id, required this.providerId, required this.comicId, required this.title, required this.coverUrl, required this.updatedAt, this.sourceUpdatedAt, this.totalChapters, this.latestChapterTitle});
  factory _ComicMetadataEntity.fromJson(Map<String, dynamic> json) => _$ComicMetadataEntityFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String comicId;
@override final  String title;
@override final  String coverUrl;
@override final  DateTime updatedAt;
@override final  DateTime? sourceUpdatedAt;
@override final  int? totalChapters;
@override final  String? latestChapterTitle;

/// Create a copy of ComicMetadataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicMetadataEntityCopyWith<_ComicMetadataEntity> get copyWith => __$ComicMetadataEntityCopyWithImpl<_ComicMetadataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicMetadataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicMetadataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sourceUpdatedAt, sourceUpdatedAt) || other.sourceUpdatedAt == sourceUpdatedAt)&&(identical(other.totalChapters, totalChapters) || other.totalChapters == totalChapters)&&(identical(other.latestChapterTitle, latestChapterTitle) || other.latestChapterTitle == latestChapterTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,comicId,title,coverUrl,updatedAt,sourceUpdatedAt,totalChapters,latestChapterTitle);

@override
String toString() {
  return 'ComicMetadataEntity(id: $id, providerId: $providerId, comicId: $comicId, title: $title, coverUrl: $coverUrl, updatedAt: $updatedAt, sourceUpdatedAt: $sourceUpdatedAt, totalChapters: $totalChapters, latestChapterTitle: $latestChapterTitle)';
}


}

/// @nodoc
abstract mixin class _$ComicMetadataEntityCopyWith<$Res> implements $ComicMetadataEntityCopyWith<$Res> {
  factory _$ComicMetadataEntityCopyWith(_ComicMetadataEntity value, $Res Function(_ComicMetadataEntity) _then) = __$ComicMetadataEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String comicId, String title, String coverUrl, DateTime updatedAt, DateTime? sourceUpdatedAt, int? totalChapters, String? latestChapterTitle
});




}
/// @nodoc
class __$ComicMetadataEntityCopyWithImpl<$Res>
    implements _$ComicMetadataEntityCopyWith<$Res> {
  __$ComicMetadataEntityCopyWithImpl(this._self, this._then);

  final _ComicMetadataEntity _self;
  final $Res Function(_ComicMetadataEntity) _then;

/// Create a copy of ComicMetadataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? comicId = null,Object? title = null,Object? coverUrl = null,Object? updatedAt = null,Object? sourceUpdatedAt = freezed,Object? totalChapters = freezed,Object? latestChapterTitle = freezed,}) {
  return _then(_ComicMetadataEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sourceUpdatedAt: freezed == sourceUpdatedAt ? _self.sourceUpdatedAt : sourceUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalChapters: freezed == totalChapters ? _self.totalChapters : totalChapters // ignore: cast_nullable_to_non_nullable
as int?,latestChapterTitle: freezed == latestChapterTitle ? _self.latestChapterTitle : latestChapterTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
