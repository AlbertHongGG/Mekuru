// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_chapter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalChapterEntity {

 String get chapterId; String get title; DateTime? get archivedAt;
/// Create a copy of LocalChapterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalChapterEntityCopyWith<LocalChapterEntity> get copyWith => _$LocalChapterEntityCopyWithImpl<LocalChapterEntity>(this as LocalChapterEntity, _$identity);

  /// Serializes this LocalChapterEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalChapterEntity&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapterId,title,archivedAt);

@override
String toString() {
  return 'LocalChapterEntity(chapterId: $chapterId, title: $title, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class $LocalChapterEntityCopyWith<$Res>  {
  factory $LocalChapterEntityCopyWith(LocalChapterEntity value, $Res Function(LocalChapterEntity) _then) = _$LocalChapterEntityCopyWithImpl;
@useResult
$Res call({
 String chapterId, String title, DateTime? archivedAt
});




}
/// @nodoc
class _$LocalChapterEntityCopyWithImpl<$Res>
    implements $LocalChapterEntityCopyWith<$Res> {
  _$LocalChapterEntityCopyWithImpl(this._self, this._then);

  final LocalChapterEntity _self;
  final $Res Function(LocalChapterEntity) _then;

/// Create a copy of LocalChapterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapterId = null,Object? title = null,Object? archivedAt = freezed,}) {
  return _then(LocalChapterEntity(
chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalChapterEntity].
extension LocalChapterEntityPatterns on LocalChapterEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalChapterEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalChapterEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalChapterEntity value)  $default,){
final _that = this;
switch (_that) {
case _LocalChapterEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalChapterEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LocalChapterEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chapterId,  String title,  DateTime? archivedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalChapterEntity() when $default != null:
return $default(_that.chapterId,_that.title,_that.archivedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chapterId,  String title,  DateTime? archivedAt)  $default,) {final _that = this;
switch (_that) {
case _LocalChapterEntity():
return $default(_that.chapterId,_that.title,_that.archivedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chapterId,  String title,  DateTime? archivedAt)?  $default,) {final _that = this;
switch (_that) {
case _LocalChapterEntity() when $default != null:
return $default(_that.chapterId,_that.title,_that.archivedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalChapterEntity implements LocalChapterEntity {
  const _LocalChapterEntity({required this.chapterId, required this.title, this.archivedAt});
  factory _LocalChapterEntity.fromJson(Map<String, dynamic> json) => _$LocalChapterEntityFromJson(json);

@override final  String chapterId;
@override final  String title;
@override final  DateTime? archivedAt;

/// Create a copy of LocalChapterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalChapterEntityCopyWith<_LocalChapterEntity> get copyWith => __$LocalChapterEntityCopyWithImpl<_LocalChapterEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalChapterEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalChapterEntity&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapterId,title,archivedAt);

@override
String toString() {
  return 'LocalChapterEntity(chapterId: $chapterId, title: $title, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class _$LocalChapterEntityCopyWith<$Res> implements $LocalChapterEntityCopyWith<$Res> {
  factory _$LocalChapterEntityCopyWith(_LocalChapterEntity value, $Res Function(_LocalChapterEntity) _then) = __$LocalChapterEntityCopyWithImpl;
@override @useResult
$Res call({
 String chapterId, String title, DateTime? archivedAt
});




}
/// @nodoc
class __$LocalChapterEntityCopyWithImpl<$Res>
    implements _$LocalChapterEntityCopyWith<$Res> {
  __$LocalChapterEntityCopyWithImpl(this._self, this._then);

  final _LocalChapterEntity _self;
  final $Res Function(_LocalChapterEntity) _then;

/// Create a copy of LocalChapterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapterId = null,Object? title = null,Object? archivedAt = freezed,}) {
  return _then(_LocalChapterEntity(
chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
