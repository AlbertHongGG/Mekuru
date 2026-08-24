// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comicwf_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CwComicDetail {

 String get id; String? get name; String? get cover; List<String>? get tags; String? get desc; String? get trace;
/// Create a copy of CwComicDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwComicDetailCopyWith<CwComicDetail> get copyWith => _$CwComicDetailCopyWithImpl<CwComicDetail>(this as CwComicDetail, _$identity);

  /// Serializes this CwComicDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwComicDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.trace, trace) || other.trace == trace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cover,const DeepCollectionEquality().hash(tags),desc,trace);

@override
String toString() {
  return 'CwComicDetail(id: $id, name: $name, cover: $cover, tags: $tags, desc: $desc, trace: $trace)';
}


}

/// @nodoc
abstract mixin class $CwComicDetailCopyWith<$Res>  {
  factory $CwComicDetailCopyWith(CwComicDetail value, $Res Function(CwComicDetail) _then) = _$CwComicDetailCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? cover, List<String>? tags, String? desc, String? trace
});




}
/// @nodoc
class _$CwComicDetailCopyWithImpl<$Res>
    implements $CwComicDetailCopyWith<$Res> {
  _$CwComicDetailCopyWithImpl(this._self, this._then);

  final CwComicDetail _self;
  final $Res Function(CwComicDetail) _then;

/// Create a copy of CwComicDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? cover = freezed,Object? tags = freezed,Object? desc = freezed,Object? trace = freezed,}) {
  return _then(CwComicDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,trace: freezed == trace ? _self.trace : trace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CwComicDetail].
extension CwComicDetailPatterns on CwComicDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwComicDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwComicDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwComicDetail value)  $default,){
final _that = this;
switch (_that) {
case _CwComicDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwComicDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CwComicDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? cover,  List<String>? tags,  String? desc,  String? trace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwComicDetail() when $default != null:
return $default(_that.id,_that.name,_that.cover,_that.tags,_that.desc,_that.trace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? cover,  List<String>? tags,  String? desc,  String? trace)  $default,) {final _that = this;
switch (_that) {
case _CwComicDetail():
return $default(_that.id,_that.name,_that.cover,_that.tags,_that.desc,_that.trace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? cover,  List<String>? tags,  String? desc,  String? trace)?  $default,) {final _that = this;
switch (_that) {
case _CwComicDetail() when $default != null:
return $default(_that.id,_that.name,_that.cover,_that.tags,_that.desc,_that.trace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwComicDetail implements CwComicDetail {
  const _CwComicDetail({required this.id, this.name, this.cover,  List<String>? tags, this.desc, this.trace}): _tags = tags;
  factory _CwComicDetail.fromJson(Map<String, dynamic> json) => _$CwComicDetailFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? cover;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? desc;
@override final  String? trace;

/// Create a copy of CwComicDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwComicDetailCopyWith<_CwComicDetail> get copyWith => __$CwComicDetailCopyWithImpl<_CwComicDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwComicDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwComicDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.trace, trace) || other.trace == trace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cover,const DeepCollectionEquality().hash(_tags),desc,trace);

@override
String toString() {
  return 'CwComicDetail(id: $id, name: $name, cover: $cover, tags: $tags, desc: $desc, trace: $trace)';
}


}

/// @nodoc
abstract mixin class _$CwComicDetailCopyWith<$Res> implements $CwComicDetailCopyWith<$Res> {
  factory _$CwComicDetailCopyWith(_CwComicDetail value, $Res Function(_CwComicDetail) _then) = __$CwComicDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? cover, List<String>? tags, String? desc, String? trace
});




}
/// @nodoc
class __$CwComicDetailCopyWithImpl<$Res>
    implements _$CwComicDetailCopyWith<$Res> {
  __$CwComicDetailCopyWithImpl(this._self, this._then);

  final _CwComicDetail _self;
  final $Res Function(_CwComicDetail) _then;

/// Create a copy of CwComicDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? cover = freezed,Object? tags = freezed,Object? desc = freezed,Object? trace = freezed,}) {
  return _then(_CwComicDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,trace: freezed == trace ? _self.trace : trace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CwChapterInfo {

@JsonKey(name: 'chapter_id') dynamic get chapterId;@JsonKey(name: 'chapter_name') String? get chapterName;@JsonKey(name: 'chapter_cover') String? get chapterCover;@JsonKey(name: 'create_time') String? get createTime;
/// Create a copy of CwChapterInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwChapterInfoCopyWith<CwChapterInfo> get copyWith => _$CwChapterInfoCopyWithImpl<CwChapterInfo>(this as CwChapterInfo, _$identity);

  /// Serializes this CwChapterInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwChapterInfo&&const DeepCollectionEquality().equals(other.chapterId, chapterId)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.chapterCover, chapterCover) || other.chapterCover == chapterCover)&&(identical(other.createTime, createTime) || other.createTime == createTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chapterId),chapterName,chapterCover,createTime);

@override
String toString() {
  return 'CwChapterInfo(chapterId: $chapterId, chapterName: $chapterName, chapterCover: $chapterCover, createTime: $createTime)';
}


}

/// @nodoc
abstract mixin class $CwChapterInfoCopyWith<$Res>  {
  factory $CwChapterInfoCopyWith(CwChapterInfo value, $Res Function(CwChapterInfo) _then) = _$CwChapterInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'chapter_id') dynamic chapterId,@JsonKey(name: 'chapter_name') String? chapterName,@JsonKey(name: 'chapter_cover') String? chapterCover,@JsonKey(name: 'create_time') String? createTime
});




}
/// @nodoc
class _$CwChapterInfoCopyWithImpl<$Res>
    implements $CwChapterInfoCopyWith<$Res> {
  _$CwChapterInfoCopyWithImpl(this._self, this._then);

  final CwChapterInfo _self;
  final $Res Function(CwChapterInfo) _then;

/// Create a copy of CwChapterInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapterId = freezed,Object? chapterName = freezed,Object? chapterCover = freezed,Object? createTime = freezed,}) {
  return _then(CwChapterInfo(
chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as dynamic,chapterName: freezed == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String?,chapterCover: freezed == chapterCover ? _self.chapterCover : chapterCover // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CwChapterInfo].
extension CwChapterInfoPatterns on CwChapterInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwChapterInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwChapterInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwChapterInfo value)  $default,){
final _that = this;
switch (_that) {
case _CwChapterInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwChapterInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CwChapterInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'chapter_id')  dynamic chapterId, @JsonKey(name: 'chapter_name')  String? chapterName, @JsonKey(name: 'chapter_cover')  String? chapterCover, @JsonKey(name: 'create_time')  String? createTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwChapterInfo() when $default != null:
return $default(_that.chapterId,_that.chapterName,_that.chapterCover,_that.createTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'chapter_id')  dynamic chapterId, @JsonKey(name: 'chapter_name')  String? chapterName, @JsonKey(name: 'chapter_cover')  String? chapterCover, @JsonKey(name: 'create_time')  String? createTime)  $default,) {final _that = this;
switch (_that) {
case _CwChapterInfo():
return $default(_that.chapterId,_that.chapterName,_that.chapterCover,_that.createTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'chapter_id')  dynamic chapterId, @JsonKey(name: 'chapter_name')  String? chapterName, @JsonKey(name: 'chapter_cover')  String? chapterCover, @JsonKey(name: 'create_time')  String? createTime)?  $default,) {final _that = this;
switch (_that) {
case _CwChapterInfo() when $default != null:
return $default(_that.chapterId,_that.chapterName,_that.chapterCover,_that.createTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwChapterInfo implements CwChapterInfo {
  const _CwChapterInfo({@JsonKey(name: 'chapter_id') required this.chapterId, @JsonKey(name: 'chapter_name') this.chapterName, @JsonKey(name: 'chapter_cover') this.chapterCover, @JsonKey(name: 'create_time') this.createTime});
  factory _CwChapterInfo.fromJson(Map<String, dynamic> json) => _$CwChapterInfoFromJson(json);

@override@JsonKey(name: 'chapter_id') final  dynamic chapterId;
@override@JsonKey(name: 'chapter_name') final  String? chapterName;
@override@JsonKey(name: 'chapter_cover') final  String? chapterCover;
@override@JsonKey(name: 'create_time') final  String? createTime;

/// Create a copy of CwChapterInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwChapterInfoCopyWith<_CwChapterInfo> get copyWith => __$CwChapterInfoCopyWithImpl<_CwChapterInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwChapterInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwChapterInfo&&const DeepCollectionEquality().equals(other.chapterId, chapterId)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.chapterCover, chapterCover) || other.chapterCover == chapterCover)&&(identical(other.createTime, createTime) || other.createTime == createTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chapterId),chapterName,chapterCover,createTime);

@override
String toString() {
  return 'CwChapterInfo(chapterId: $chapterId, chapterName: $chapterName, chapterCover: $chapterCover, createTime: $createTime)';
}


}

/// @nodoc
abstract mixin class _$CwChapterInfoCopyWith<$Res> implements $CwChapterInfoCopyWith<$Res> {
  factory _$CwChapterInfoCopyWith(_CwChapterInfo value, $Res Function(_CwChapterInfo) _then) = __$CwChapterInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'chapter_id') dynamic chapterId,@JsonKey(name: 'chapter_name') String? chapterName,@JsonKey(name: 'chapter_cover') String? chapterCover,@JsonKey(name: 'create_time') String? createTime
});




}
/// @nodoc
class __$CwChapterInfoCopyWithImpl<$Res>
    implements _$CwChapterInfoCopyWith<$Res> {
  __$CwChapterInfoCopyWithImpl(this._self, this._then);

  final _CwChapterInfo _self;
  final $Res Function(_CwChapterInfo) _then;

/// Create a copy of CwChapterInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapterId = freezed,Object? chapterName = freezed,Object? chapterCover = freezed,Object? createTime = freezed,}) {
  return _then(_CwChapterInfo(
chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as dynamic,chapterName: freezed == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String?,chapterCover: freezed == chapterCover ? _self.chapterCover : chapterCover // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CwChapterList {

 List<CwChapterInfo> get chapters;
/// Create a copy of CwChapterList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwChapterListCopyWith<CwChapterList> get copyWith => _$CwChapterListCopyWithImpl<CwChapterList>(this as CwChapterList, _$identity);

  /// Serializes this CwChapterList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwChapterList&&const DeepCollectionEquality().equals(other.chapters, chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chapters));

@override
String toString() {
  return 'CwChapterList(chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $CwChapterListCopyWith<$Res>  {
  factory $CwChapterListCopyWith(CwChapterList value, $Res Function(CwChapterList) _then) = _$CwChapterListCopyWithImpl;
@useResult
$Res call({
 List<CwChapterInfo> chapters
});




}
/// @nodoc
class _$CwChapterListCopyWithImpl<$Res>
    implements $CwChapterListCopyWith<$Res> {
  _$CwChapterListCopyWithImpl(this._self, this._then);

  final CwChapterList _self;
  final $Res Function(CwChapterList) _then;

/// Create a copy of CwChapterList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapters = null,}) {
  return _then(CwChapterList(
chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<CwChapterInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [CwChapterList].
extension CwChapterListPatterns on CwChapterList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwChapterList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwChapterList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwChapterList value)  $default,){
final _that = this;
switch (_that) {
case _CwChapterList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwChapterList value)?  $default,){
final _that = this;
switch (_that) {
case _CwChapterList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CwChapterInfo> chapters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwChapterList() when $default != null:
return $default(_that.chapters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CwChapterInfo> chapters)  $default,) {final _that = this;
switch (_that) {
case _CwChapterList():
return $default(_that.chapters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CwChapterInfo> chapters)?  $default,) {final _that = this;
switch (_that) {
case _CwChapterList() when $default != null:
return $default(_that.chapters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwChapterList implements CwChapterList {
  const _CwChapterList({ List<CwChapterInfo> chapters = const []}): _chapters = chapters;
  factory _CwChapterList.fromJson(Map<String, dynamic> json) => _$CwChapterListFromJson(json);

 final  List<CwChapterInfo> _chapters;
@override@JsonKey() List<CwChapterInfo> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}


/// Create a copy of CwChapterList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwChapterListCopyWith<_CwChapterList> get copyWith => __$CwChapterListCopyWithImpl<_CwChapterList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwChapterListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwChapterList&&const DeepCollectionEquality().equals(other._chapters, _chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chapters));

@override
String toString() {
  return 'CwChapterList(chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class _$CwChapterListCopyWith<$Res> implements $CwChapterListCopyWith<$Res> {
  factory _$CwChapterListCopyWith(_CwChapterList value, $Res Function(_CwChapterList) _then) = __$CwChapterListCopyWithImpl;
@override @useResult
$Res call({
 List<CwChapterInfo> chapters
});




}
/// @nodoc
class __$CwChapterListCopyWithImpl<$Res>
    implements _$CwChapterListCopyWith<$Res> {
  __$CwChapterListCopyWithImpl(this._self, this._then);

  final _CwChapterList _self;
  final $Res Function(_CwChapterList) _then;

/// Create a copy of CwChapterList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapters = null,}) {
  return _then(_CwChapterList(
chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<CwChapterInfo>,
  ));
}


}


/// @nodoc
mixin _$CwChapterImage {

 String get url; int get height; int get width;
/// Create a copy of CwChapterImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwChapterImageCopyWith<CwChapterImage> get copyWith => _$CwChapterImageCopyWithImpl<CwChapterImage>(this as CwChapterImage, _$identity);

  /// Serializes this CwChapterImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwChapterImage&&(identical(other.url, url) || other.url == url)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,height,width);

@override
String toString() {
  return 'CwChapterImage(url: $url, height: $height, width: $width)';
}


}

/// @nodoc
abstract mixin class $CwChapterImageCopyWith<$Res>  {
  factory $CwChapterImageCopyWith(CwChapterImage value, $Res Function(CwChapterImage) _then) = _$CwChapterImageCopyWithImpl;
@useResult
$Res call({
 String url, int height, int width
});




}
/// @nodoc
class _$CwChapterImageCopyWithImpl<$Res>
    implements $CwChapterImageCopyWith<$Res> {
  _$CwChapterImageCopyWithImpl(this._self, this._then);

  final CwChapterImage _self;
  final $Res Function(CwChapterImage) _then;

/// Create a copy of CwChapterImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? height = null,Object? width = null,}) {
  return _then(CwChapterImage(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CwChapterImage].
extension CwChapterImagePatterns on CwChapterImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwChapterImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwChapterImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwChapterImage value)  $default,){
final _that = this;
switch (_that) {
case _CwChapterImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwChapterImage value)?  $default,){
final _that = this;
switch (_that) {
case _CwChapterImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  int height,  int width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwChapterImage() when $default != null:
return $default(_that.url,_that.height,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  int height,  int width)  $default,) {final _that = this;
switch (_that) {
case _CwChapterImage():
return $default(_that.url,_that.height,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  int height,  int width)?  $default,) {final _that = this;
switch (_that) {
case _CwChapterImage() when $default != null:
return $default(_that.url,_that.height,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwChapterImage implements CwChapterImage {
  const _CwChapterImage({required this.url, this.height = 0, this.width = 0});
  factory _CwChapterImage.fromJson(Map<String, dynamic> json) => _$CwChapterImageFromJson(json);

@override final  String url;
@override@JsonKey() final  int height;
@override@JsonKey() final  int width;

/// Create a copy of CwChapterImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwChapterImageCopyWith<_CwChapterImage> get copyWith => __$CwChapterImageCopyWithImpl<_CwChapterImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwChapterImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwChapterImage&&(identical(other.url, url) || other.url == url)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,height,width);

@override
String toString() {
  return 'CwChapterImage(url: $url, height: $height, width: $width)';
}


}

/// @nodoc
abstract mixin class _$CwChapterImageCopyWith<$Res> implements $CwChapterImageCopyWith<$Res> {
  factory _$CwChapterImageCopyWith(_CwChapterImage value, $Res Function(_CwChapterImage) _then) = __$CwChapterImageCopyWithImpl;
@override @useResult
$Res call({
 String url, int height, int width
});




}
/// @nodoc
class __$CwChapterImageCopyWithImpl<$Res>
    implements _$CwChapterImageCopyWith<$Res> {
  __$CwChapterImageCopyWithImpl(this._self, this._then);

  final _CwChapterImage _self;
  final $Res Function(_CwChapterImage) _then;

/// Create a copy of CwChapterImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? height = null,Object? width = null,}) {
  return _then(_CwChapterImage(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CwChapterReadData {

 List<CwChapterImage> get imgs;
/// Create a copy of CwChapterReadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwChapterReadDataCopyWith<CwChapterReadData> get copyWith => _$CwChapterReadDataCopyWithImpl<CwChapterReadData>(this as CwChapterReadData, _$identity);

  /// Serializes this CwChapterReadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwChapterReadData&&const DeepCollectionEquality().equals(other.imgs, imgs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imgs));

@override
String toString() {
  return 'CwChapterReadData(imgs: $imgs)';
}


}

/// @nodoc
abstract mixin class $CwChapterReadDataCopyWith<$Res>  {
  factory $CwChapterReadDataCopyWith(CwChapterReadData value, $Res Function(CwChapterReadData) _then) = _$CwChapterReadDataCopyWithImpl;
@useResult
$Res call({
 List<CwChapterImage> imgs
});




}
/// @nodoc
class _$CwChapterReadDataCopyWithImpl<$Res>
    implements $CwChapterReadDataCopyWith<$Res> {
  _$CwChapterReadDataCopyWithImpl(this._self, this._then);

  final CwChapterReadData _self;
  final $Res Function(CwChapterReadData) _then;

/// Create a copy of CwChapterReadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imgs = null,}) {
  return _then(CwChapterReadData(
imgs: null == imgs ? _self.imgs : imgs // ignore: cast_nullable_to_non_nullable
as List<CwChapterImage>,
  ));
}

}


/// Adds pattern-matching-related methods to [CwChapterReadData].
extension CwChapterReadDataPatterns on CwChapterReadData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwChapterReadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwChapterReadData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwChapterReadData value)  $default,){
final _that = this;
switch (_that) {
case _CwChapterReadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwChapterReadData value)?  $default,){
final _that = this;
switch (_that) {
case _CwChapterReadData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CwChapterImage> imgs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwChapterReadData() when $default != null:
return $default(_that.imgs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CwChapterImage> imgs)  $default,) {final _that = this;
switch (_that) {
case _CwChapterReadData():
return $default(_that.imgs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CwChapterImage> imgs)?  $default,) {final _that = this;
switch (_that) {
case _CwChapterReadData() when $default != null:
return $default(_that.imgs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwChapterReadData implements CwChapterReadData {
  const _CwChapterReadData({ List<CwChapterImage> imgs = const []}): _imgs = imgs;
  factory _CwChapterReadData.fromJson(Map<String, dynamic> json) => _$CwChapterReadDataFromJson(json);

 final  List<CwChapterImage> _imgs;
@override@JsonKey() List<CwChapterImage> get imgs {
  if (_imgs is EqualUnmodifiableListView) return _imgs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imgs);
}


/// Create a copy of CwChapterReadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwChapterReadDataCopyWith<_CwChapterReadData> get copyWith => __$CwChapterReadDataCopyWithImpl<_CwChapterReadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwChapterReadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwChapterReadData&&const DeepCollectionEquality().equals(other._imgs, _imgs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_imgs));

@override
String toString() {
  return 'CwChapterReadData(imgs: $imgs)';
}


}

/// @nodoc
abstract mixin class _$CwChapterReadDataCopyWith<$Res> implements $CwChapterReadDataCopyWith<$Res> {
  factory _$CwChapterReadDataCopyWith(_CwChapterReadData value, $Res Function(_CwChapterReadData) _then) = __$CwChapterReadDataCopyWithImpl;
@override @useResult
$Res call({
 List<CwChapterImage> imgs
});




}
/// @nodoc
class __$CwChapterReadDataCopyWithImpl<$Res>
    implements _$CwChapterReadDataCopyWith<$Res> {
  __$CwChapterReadDataCopyWithImpl(this._self, this._then);

  final _CwChapterReadData _self;
  final $Res Function(_CwChapterReadData) _then;

/// Create a copy of CwChapterReadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imgs = null,}) {
  return _then(_CwChapterReadData(
imgs: null == imgs ? _self._imgs : imgs // ignore: cast_nullable_to_non_nullable
as List<CwChapterImage>,
  ));
}


}


/// @nodoc
mixin _$CwSearchModuleItem {

 String get id; String get name; String get cover; List<String> get tags; String get desc;
/// Create a copy of CwSearchModuleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwSearchModuleItemCopyWith<CwSearchModuleItem> get copyWith => _$CwSearchModuleItemCopyWithImpl<CwSearchModuleItem>(this as CwSearchModuleItem, _$identity);

  /// Serializes this CwSearchModuleItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwSearchModuleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cover,const DeepCollectionEquality().hash(tags),desc);

@override
String toString() {
  return 'CwSearchModuleItem(id: $id, name: $name, cover: $cover, tags: $tags, desc: $desc)';
}


}

/// @nodoc
abstract mixin class $CwSearchModuleItemCopyWith<$Res>  {
  factory $CwSearchModuleItemCopyWith(CwSearchModuleItem value, $Res Function(CwSearchModuleItem) _then) = _$CwSearchModuleItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, String cover, List<String> tags, String desc
});




}
/// @nodoc
class _$CwSearchModuleItemCopyWithImpl<$Res>
    implements $CwSearchModuleItemCopyWith<$Res> {
  _$CwSearchModuleItemCopyWithImpl(this._self, this._then);

  final CwSearchModuleItem _self;
  final $Res Function(CwSearchModuleItem) _then;

/// Create a copy of CwSearchModuleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cover = null,Object? tags = null,Object? desc = null,}) {
  return _then(CwSearchModuleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CwSearchModuleItem].
extension CwSearchModuleItemPatterns on CwSearchModuleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwSearchModuleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwSearchModuleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwSearchModuleItem value)  $default,){
final _that = this;
switch (_that) {
case _CwSearchModuleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwSearchModuleItem value)?  $default,){
final _that = this;
switch (_that) {
case _CwSearchModuleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String cover,  List<String> tags,  String desc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwSearchModuleItem() when $default != null:
return $default(_that.id,_that.name,_that.cover,_that.tags,_that.desc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String cover,  List<String> tags,  String desc)  $default,) {final _that = this;
switch (_that) {
case _CwSearchModuleItem():
return $default(_that.id,_that.name,_that.cover,_that.tags,_that.desc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String cover,  List<String> tags,  String desc)?  $default,) {final _that = this;
switch (_that) {
case _CwSearchModuleItem() when $default != null:
return $default(_that.id,_that.name,_that.cover,_that.tags,_that.desc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwSearchModuleItem implements CwSearchModuleItem {
  const _CwSearchModuleItem({required this.id, required this.name, required this.cover,  List<String> tags = const [], this.desc = ""}): _tags = tags;
  factory _CwSearchModuleItem.fromJson(Map<String, dynamic> json) => _$CwSearchModuleItemFromJson(json);

@override final  String id;
@override final  String name;
@override final  String cover;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String desc;

/// Create a copy of CwSearchModuleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwSearchModuleItemCopyWith<_CwSearchModuleItem> get copyWith => __$CwSearchModuleItemCopyWithImpl<_CwSearchModuleItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwSearchModuleItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwSearchModuleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cover,const DeepCollectionEquality().hash(_tags),desc);

@override
String toString() {
  return 'CwSearchModuleItem(id: $id, name: $name, cover: $cover, tags: $tags, desc: $desc)';
}


}

/// @nodoc
abstract mixin class _$CwSearchModuleItemCopyWith<$Res> implements $CwSearchModuleItemCopyWith<$Res> {
  factory _$CwSearchModuleItemCopyWith(_CwSearchModuleItem value, $Res Function(_CwSearchModuleItem) _then) = __$CwSearchModuleItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String cover, List<String> tags, String desc
});




}
/// @nodoc
class __$CwSearchModuleItemCopyWithImpl<$Res>
    implements _$CwSearchModuleItemCopyWith<$Res> {
  __$CwSearchModuleItemCopyWithImpl(this._self, this._then);

  final _CwSearchModuleItem _self;
  final $Res Function(_CwSearchModuleItem) _then;

/// Create a copy of CwSearchModuleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cover = null,Object? tags = null,Object? desc = null,}) {
  return _then(_CwSearchModuleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CwSearchResultItem {

@JsonKey(name: 'module_item') CwSearchModuleItem get moduleItem;
/// Create a copy of CwSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CwSearchResultItemCopyWith<CwSearchResultItem> get copyWith => _$CwSearchResultItemCopyWithImpl<CwSearchResultItem>(this as CwSearchResultItem, _$identity);

  /// Serializes this CwSearchResultItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CwSearchResultItem&&(identical(other.moduleItem, moduleItem) || other.moduleItem == moduleItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,moduleItem);

@override
String toString() {
  return 'CwSearchResultItem(moduleItem: $moduleItem)';
}


}

/// @nodoc
abstract mixin class $CwSearchResultItemCopyWith<$Res>  {
  factory $CwSearchResultItemCopyWith(CwSearchResultItem value, $Res Function(CwSearchResultItem) _then) = _$CwSearchResultItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'module_item') CwSearchModuleItem moduleItem
});


$CwSearchModuleItemCopyWith<$Res> get moduleItem;

}
/// @nodoc
class _$CwSearchResultItemCopyWithImpl<$Res>
    implements $CwSearchResultItemCopyWith<$Res> {
  _$CwSearchResultItemCopyWithImpl(this._self, this._then);

  final CwSearchResultItem _self;
  final $Res Function(CwSearchResultItem) _then;

/// Create a copy of CwSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? moduleItem = null,}) {
  return _then(CwSearchResultItem(
moduleItem: null == moduleItem ? _self.moduleItem : moduleItem // ignore: cast_nullable_to_non_nullable
as CwSearchModuleItem,
  ));
}
/// Create a copy of CwSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CwSearchModuleItemCopyWith<$Res> get moduleItem {
  
  return $CwSearchModuleItemCopyWith<$Res>(_self.moduleItem, (value) {
    return _then(_self.copyWith(moduleItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [CwSearchResultItem].
extension CwSearchResultItemPatterns on CwSearchResultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CwSearchResultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CwSearchResultItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CwSearchResultItem value)  $default,){
final _that = this;
switch (_that) {
case _CwSearchResultItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CwSearchResultItem value)?  $default,){
final _that = this;
switch (_that) {
case _CwSearchResultItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'module_item')  CwSearchModuleItem moduleItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CwSearchResultItem() when $default != null:
return $default(_that.moduleItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'module_item')  CwSearchModuleItem moduleItem)  $default,) {final _that = this;
switch (_that) {
case _CwSearchResultItem():
return $default(_that.moduleItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'module_item')  CwSearchModuleItem moduleItem)?  $default,) {final _that = this;
switch (_that) {
case _CwSearchResultItem() when $default != null:
return $default(_that.moduleItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CwSearchResultItem implements CwSearchResultItem {
  const _CwSearchResultItem({@JsonKey(name: 'module_item') required this.moduleItem});
  factory _CwSearchResultItem.fromJson(Map<String, dynamic> json) => _$CwSearchResultItemFromJson(json);

@override@JsonKey(name: 'module_item') final  CwSearchModuleItem moduleItem;

/// Create a copy of CwSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CwSearchResultItemCopyWith<_CwSearchResultItem> get copyWith => __$CwSearchResultItemCopyWithImpl<_CwSearchResultItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CwSearchResultItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CwSearchResultItem&&(identical(other.moduleItem, moduleItem) || other.moduleItem == moduleItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,moduleItem);

@override
String toString() {
  return 'CwSearchResultItem(moduleItem: $moduleItem)';
}


}

/// @nodoc
abstract mixin class _$CwSearchResultItemCopyWith<$Res> implements $CwSearchResultItemCopyWith<$Res> {
  factory _$CwSearchResultItemCopyWith(_CwSearchResultItem value, $Res Function(_CwSearchResultItem) _then) = __$CwSearchResultItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'module_item') CwSearchModuleItem moduleItem
});


@override $CwSearchModuleItemCopyWith<$Res> get moduleItem;

}
/// @nodoc
class __$CwSearchResultItemCopyWithImpl<$Res>
    implements _$CwSearchResultItemCopyWith<$Res> {
  __$CwSearchResultItemCopyWithImpl(this._self, this._then);

  final _CwSearchResultItem _self;
  final $Res Function(_CwSearchResultItem) _then;

/// Create a copy of CwSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? moduleItem = null,}) {
  return _then(_CwSearchResultItem(
moduleItem: null == moduleItem ? _self.moduleItem : moduleItem // ignore: cast_nullable_to_non_nullable
as CwSearchModuleItem,
  ));
}

/// Create a copy of CwSearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CwSearchModuleItemCopyWith<$Res> get moduleItem {
  
  return $CwSearchModuleItemCopyWith<$Res>(_self.moduleItem, (value) {
    return _then(_self.copyWith(moduleItem: value));
  });
}
}

// dart format on
