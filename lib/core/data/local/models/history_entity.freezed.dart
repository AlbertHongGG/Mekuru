// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryEntity {

 String get comicId; String get lastReadChapterId; String get lastReadChapterTitle; int get lastReadPageIndex; DateTime get updatedAt; List<String> get readChapterIds; int? get lastReadChapterIndex;
/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEntityCopyWith<HistoryEntity> get copyWith => _$HistoryEntityCopyWithImpl<HistoryEntity>(this as HistoryEntity, _$identity);

  /// Serializes this HistoryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEntity&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.lastReadChapterId, lastReadChapterId) || other.lastReadChapterId == lastReadChapterId)&&(identical(other.lastReadChapterTitle, lastReadChapterTitle) || other.lastReadChapterTitle == lastReadChapterTitle)&&(identical(other.lastReadPageIndex, lastReadPageIndex) || other.lastReadPageIndex == lastReadPageIndex)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.readChapterIds, readChapterIds)&&(identical(other.lastReadChapterIndex, lastReadChapterIndex) || other.lastReadChapterIndex == lastReadChapterIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,lastReadChapterId,lastReadChapterTitle,lastReadPageIndex,updatedAt,const DeepCollectionEquality().hash(readChapterIds),lastReadChapterIndex);

@override
String toString() {
  return 'HistoryEntity(comicId: $comicId, lastReadChapterId: $lastReadChapterId, lastReadChapterTitle: $lastReadChapterTitle, lastReadPageIndex: $lastReadPageIndex, updatedAt: $updatedAt, readChapterIds: $readChapterIds, lastReadChapterIndex: $lastReadChapterIndex)';
}


}

/// @nodoc
abstract mixin class $HistoryEntityCopyWith<$Res>  {
  factory $HistoryEntityCopyWith(HistoryEntity value, $Res Function(HistoryEntity) _then) = _$HistoryEntityCopyWithImpl;
@useResult
$Res call({
 String comicId, String lastReadChapterId, String lastReadChapterTitle, int lastReadPageIndex, DateTime updatedAt, List<String> readChapterIds, int? lastReadChapterIndex
});




}
/// @nodoc
class _$HistoryEntityCopyWithImpl<$Res>
    implements $HistoryEntityCopyWith<$Res> {
  _$HistoryEntityCopyWithImpl(this._self, this._then);

  final HistoryEntity _self;
  final $Res Function(HistoryEntity) _then;

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = null,Object? lastReadChapterId = null,Object? lastReadChapterTitle = null,Object? lastReadPageIndex = null,Object? updatedAt = null,Object? readChapterIds = null,Object? lastReadChapterIndex = freezed,}) {
  return _then(HistoryEntity(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,lastReadChapterId: null == lastReadChapterId ? _self.lastReadChapterId : lastReadChapterId // ignore: cast_nullable_to_non_nullable
as String,lastReadChapterTitle: null == lastReadChapterTitle ? _self.lastReadChapterTitle : lastReadChapterTitle // ignore: cast_nullable_to_non_nullable
as String,lastReadPageIndex: null == lastReadPageIndex ? _self.lastReadPageIndex : lastReadPageIndex // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,readChapterIds: null == readChapterIds ? _self.readChapterIds : readChapterIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastReadChapterIndex: freezed == lastReadChapterIndex ? _self.lastReadChapterIndex : lastReadChapterIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryEntity].
extension HistoryEntityPatterns on HistoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String comicId,  String lastReadChapterId,  String lastReadChapterTitle,  int lastReadPageIndex,  DateTime updatedAt,  List<String> readChapterIds,  int? lastReadChapterIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
return $default(_that.comicId,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.readChapterIds,_that.lastReadChapterIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String comicId,  String lastReadChapterId,  String lastReadChapterTitle,  int lastReadPageIndex,  DateTime updatedAt,  List<String> readChapterIds,  int? lastReadChapterIndex)  $default,) {final _that = this;
switch (_that) {
case _HistoryEntity():
return $default(_that.comicId,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.readChapterIds,_that.lastReadChapterIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String comicId,  String lastReadChapterId,  String lastReadChapterTitle,  int lastReadPageIndex,  DateTime updatedAt,  List<String> readChapterIds,  int? lastReadChapterIndex)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
return $default(_that.comicId,_that.lastReadChapterId,_that.lastReadChapterTitle,_that.lastReadPageIndex,_that.updatedAt,_that.readChapterIds,_that.lastReadChapterIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEntity implements HistoryEntity {
  const _HistoryEntity({required this.comicId, required this.lastReadChapterId, required this.lastReadChapterTitle, required this.lastReadPageIndex, required this.updatedAt,  List<String> readChapterIds = const [], this.lastReadChapterIndex}): _readChapterIds = readChapterIds;
  factory _HistoryEntity.fromJson(Map<String, dynamic> json) => _$HistoryEntityFromJson(json);

@override final  String comicId;
@override final  String lastReadChapterId;
@override final  String lastReadChapterTitle;
@override final  int lastReadPageIndex;
@override final  DateTime updatedAt;
 final  List<String> _readChapterIds;
@override@JsonKey() List<String> get readChapterIds {
  if (_readChapterIds is EqualUnmodifiableListView) return _readChapterIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readChapterIds);
}

@override final  int? lastReadChapterIndex;

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEntityCopyWith<_HistoryEntity> get copyWith => __$HistoryEntityCopyWithImpl<_HistoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEntity&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.lastReadChapterId, lastReadChapterId) || other.lastReadChapterId == lastReadChapterId)&&(identical(other.lastReadChapterTitle, lastReadChapterTitle) || other.lastReadChapterTitle == lastReadChapterTitle)&&(identical(other.lastReadPageIndex, lastReadPageIndex) || other.lastReadPageIndex == lastReadPageIndex)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._readChapterIds, _readChapterIds)&&(identical(other.lastReadChapterIndex, lastReadChapterIndex) || other.lastReadChapterIndex == lastReadChapterIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,lastReadChapterId,lastReadChapterTitle,lastReadPageIndex,updatedAt,const DeepCollectionEquality().hash(_readChapterIds),lastReadChapterIndex);

@override
String toString() {
  return 'HistoryEntity(comicId: $comicId, lastReadChapterId: $lastReadChapterId, lastReadChapterTitle: $lastReadChapterTitle, lastReadPageIndex: $lastReadPageIndex, updatedAt: $updatedAt, readChapterIds: $readChapterIds, lastReadChapterIndex: $lastReadChapterIndex)';
}


}

/// @nodoc
abstract mixin class _$HistoryEntityCopyWith<$Res> implements $HistoryEntityCopyWith<$Res> {
  factory _$HistoryEntityCopyWith(_HistoryEntity value, $Res Function(_HistoryEntity) _then) = __$HistoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String comicId, String lastReadChapterId, String lastReadChapterTitle, int lastReadPageIndex, DateTime updatedAt, List<String> readChapterIds, int? lastReadChapterIndex
});




}
/// @nodoc
class __$HistoryEntityCopyWithImpl<$Res>
    implements _$HistoryEntityCopyWith<$Res> {
  __$HistoryEntityCopyWithImpl(this._self, this._then);

  final _HistoryEntity _self;
  final $Res Function(_HistoryEntity) _then;

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = null,Object? lastReadChapterId = null,Object? lastReadChapterTitle = null,Object? lastReadPageIndex = null,Object? updatedAt = null,Object? readChapterIds = null,Object? lastReadChapterIndex = freezed,}) {
  return _then(_HistoryEntity(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,lastReadChapterId: null == lastReadChapterId ? _self.lastReadChapterId : lastReadChapterId // ignore: cast_nullable_to_non_nullable
as String,lastReadChapterTitle: null == lastReadChapterTitle ? _self.lastReadChapterTitle : lastReadChapterTitle // ignore: cast_nullable_to_non_nullable
as String,lastReadPageIndex: null == lastReadPageIndex ? _self.lastReadPageIndex : lastReadPageIndex // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,readChapterIds: null == readChapterIds ? _self._readChapterIds : readChapterIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastReadChapterIndex: freezed == lastReadChapterIndex ? _self.lastReadChapterIndex : lastReadChapterIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
