// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manwa_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MwResponse<T> {

 int get code; T get data; String? get msg;
/// Create a copy of MwResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwResponseCopyWith<T, MwResponse<T>> get copyWith => _$MwResponseCopyWithImpl<T, MwResponse<T>>(this as MwResponse<T>, _$identity);

  /// Serializes this MwResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwResponse<T>&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.msg, msg) || other.msg == msg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(data),msg);

@override
String toString() {
  return 'MwResponse<$T>(code: $code, data: $data, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $MwResponseCopyWith<T,$Res>  {
  factory $MwResponseCopyWith(MwResponse<T> value, $Res Function(MwResponse<T>) _then) = _$MwResponseCopyWithImpl;
@useResult
$Res call({
 int code, T data, String? msg
});




}
/// @nodoc
class _$MwResponseCopyWithImpl<T,$Res>
    implements $MwResponseCopyWith<T, $Res> {
  _$MwResponseCopyWithImpl(this._self, this._then);

  final MwResponse<T> _self;
  final $Res Function(MwResponse<T>) _then;

/// Create a copy of MwResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? data = freezed,Object? msg = freezed,}) {
  return _then(MwResponse(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MwResponse].
extension MwResponsePatterns<T> on MwResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _MwResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _MwResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  T data,  String? msg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwResponse() when $default != null:
return $default(_that.code,_that.data,_that.msg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  T data,  String? msg)  $default,) {final _that = this;
switch (_that) {
case _MwResponse():
return $default(_that.code,_that.data,_that.msg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  T data,  String? msg)?  $default,) {final _that = this;
switch (_that) {
case _MwResponse() when $default != null:
return $default(_that.code,_that.data,_that.msg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _MwResponse<T> implements MwResponse<T> {
  const _MwResponse({required this.code, required this.data, this.msg});
  factory _MwResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$MwResponseFromJson(json,fromJsonT);

@override final  int code;
@override final  T data;
@override final  String? msg;

/// Create a copy of MwResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwResponseCopyWith<T, _MwResponse<T>> get copyWith => __$MwResponseCopyWithImpl<T, _MwResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$MwResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwResponse<T>&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.msg, msg) || other.msg == msg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(data),msg);

@override
String toString() {
  return 'MwResponse<$T>(code: $code, data: $data, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$MwResponseCopyWith<T,$Res> implements $MwResponseCopyWith<T, $Res> {
  factory _$MwResponseCopyWith(_MwResponse<T> value, $Res Function(_MwResponse<T>) _then) = __$MwResponseCopyWithImpl;
@override @useResult
$Res call({
 int code, T data, String? msg
});




}
/// @nodoc
class __$MwResponseCopyWithImpl<T,$Res>
    implements _$MwResponseCopyWith<T, $Res> {
  __$MwResponseCopyWithImpl(this._self, this._then);

  final _MwResponse<T> _self;
  final $Res Function(_MwResponse<T>) _then;

/// Create a copy of MwResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? data = freezed,Object? msg = freezed,}) {
  return _then(_MwResponse<T>(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MwExploreResult {

 List<MwComicItem> get list; int get nums; int get size;
/// Create a copy of MwExploreResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwExploreResultCopyWith<MwExploreResult> get copyWith => _$MwExploreResultCopyWithImpl<MwExploreResult>(this as MwExploreResult, _$identity);

  /// Serializes this MwExploreResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwExploreResult&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.nums, nums) || other.nums == nums)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),nums,size);

@override
String toString() {
  return 'MwExploreResult(list: $list, nums: $nums, size: $size)';
}


}

/// @nodoc
abstract mixin class $MwExploreResultCopyWith<$Res>  {
  factory $MwExploreResultCopyWith(MwExploreResult value, $Res Function(MwExploreResult) _then) = _$MwExploreResultCopyWithImpl;
@useResult
$Res call({
 List<MwComicItem> list, int nums, int size
});




}
/// @nodoc
class _$MwExploreResultCopyWithImpl<$Res>
    implements $MwExploreResultCopyWith<$Res> {
  _$MwExploreResultCopyWithImpl(this._self, this._then);

  final MwExploreResult _self;
  final $Res Function(MwExploreResult) _then;

/// Create a copy of MwExploreResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? nums = null,Object? size = null,}) {
  return _then(MwExploreResult(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<MwComicItem>,nums: null == nums ? _self.nums : nums // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MwExploreResult].
extension MwExploreResultPatterns on MwExploreResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwExploreResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwExploreResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwExploreResult value)  $default,){
final _that = this;
switch (_that) {
case _MwExploreResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwExploreResult value)?  $default,){
final _that = this;
switch (_that) {
case _MwExploreResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MwComicItem> list,  int nums,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwExploreResult() when $default != null:
return $default(_that.list,_that.nums,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MwComicItem> list,  int nums,  int size)  $default,) {final _that = this;
switch (_that) {
case _MwExploreResult():
return $default(_that.list,_that.nums,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MwComicItem> list,  int nums,  int size)?  $default,) {final _that = this;
switch (_that) {
case _MwExploreResult() when $default != null:
return $default(_that.list,_that.nums,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwExploreResult implements MwExploreResult {
  const _MwExploreResult({ List<MwComicItem> list = const [], this.nums = 0, this.size = 0}): _list = list;
  factory _MwExploreResult.fromJson(Map<String, dynamic> json) => _$MwExploreResultFromJson(json);

 final  List<MwComicItem> _list;
@override@JsonKey() List<MwComicItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int nums;
@override@JsonKey() final  int size;

/// Create a copy of MwExploreResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwExploreResultCopyWith<_MwExploreResult> get copyWith => __$MwExploreResultCopyWithImpl<_MwExploreResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwExploreResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwExploreResult&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.nums, nums) || other.nums == nums)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),nums,size);

@override
String toString() {
  return 'MwExploreResult(list: $list, nums: $nums, size: $size)';
}


}

/// @nodoc
abstract mixin class _$MwExploreResultCopyWith<$Res> implements $MwExploreResultCopyWith<$Res> {
  factory _$MwExploreResultCopyWith(_MwExploreResult value, $Res Function(_MwExploreResult) _then) = __$MwExploreResultCopyWithImpl;
@override @useResult
$Res call({
 List<MwComicItem> list, int nums, int size
});




}
/// @nodoc
class __$MwExploreResultCopyWithImpl<$Res>
    implements _$MwExploreResultCopyWith<$Res> {
  __$MwExploreResultCopyWithImpl(this._self, this._then);

  final _MwExploreResult _self;
  final $Res Function(_MwExploreResult) _then;

/// Create a copy of MwExploreResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? nums = null,Object? size = null,}) {
  return _then(_MwExploreResult(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<MwComicItem>,nums: null == nums ? _self.nums : nums // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MwComicItem {

 int get id; String get name;@JsonKey(name: 'picx') String? get picx;@JsonKey(name: 'pic') String? get pic; String? get text; String get serialize;
/// Create a copy of MwComicItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwComicItemCopyWith<MwComicItem> get copyWith => _$MwComicItemCopyWithImpl<MwComicItem>(this as MwComicItem, _$identity);

  /// Serializes this MwComicItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwComicItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picx, picx) || other.picx == picx)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.text, text) || other.text == text)&&(identical(other.serialize, serialize) || other.serialize == serialize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picx,pic,text,serialize);

@override
String toString() {
  return 'MwComicItem(id: $id, name: $name, picx: $picx, pic: $pic, text: $text, serialize: $serialize)';
}


}

/// @nodoc
abstract mixin class $MwComicItemCopyWith<$Res>  {
  factory $MwComicItemCopyWith(MwComicItem value, $Res Function(MwComicItem) _then) = _$MwComicItemCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'picx') String? picx,@JsonKey(name: 'pic') String? pic, String? text, String serialize
});




}
/// @nodoc
class _$MwComicItemCopyWithImpl<$Res>
    implements $MwComicItemCopyWith<$Res> {
  _$MwComicItemCopyWithImpl(this._self, this._then);

  final MwComicItem _self;
  final $Res Function(MwComicItem) _then;

/// Create a copy of MwComicItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picx = freezed,Object? pic = freezed,Object? text = freezed,Object? serialize = null,}) {
  return _then(MwComicItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picx: freezed == picx ? _self.picx : picx // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,serialize: null == serialize ? _self.serialize : serialize // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MwComicItem].
extension MwComicItemPatterns on MwComicItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwComicItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwComicItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwComicItem value)  $default,){
final _that = this;
switch (_that) {
case _MwComicItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwComicItem value)?  $default,){
final _that = this;
switch (_that) {
case _MwComicItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'picx')  String? picx, @JsonKey(name: 'pic')  String? pic,  String? text,  String serialize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwComicItem() when $default != null:
return $default(_that.id,_that.name,_that.picx,_that.pic,_that.text,_that.serialize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'picx')  String? picx, @JsonKey(name: 'pic')  String? pic,  String? text,  String serialize)  $default,) {final _that = this;
switch (_that) {
case _MwComicItem():
return $default(_that.id,_that.name,_that.picx,_that.pic,_that.text,_that.serialize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'picx')  String? picx, @JsonKey(name: 'pic')  String? pic,  String? text,  String serialize)?  $default,) {final _that = this;
switch (_that) {
case _MwComicItem() when $default != null:
return $default(_that.id,_that.name,_that.picx,_that.pic,_that.text,_that.serialize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwComicItem implements MwComicItem {
  const _MwComicItem({required this.id, required this.name, @JsonKey(name: 'picx') this.picx, @JsonKey(name: 'pic') this.pic, this.text, this.serialize = ''});
  factory _MwComicItem.fromJson(Map<String, dynamic> json) => _$MwComicItemFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'picx') final  String? picx;
@override@JsonKey(name: 'pic') final  String? pic;
@override final  String? text;
@override@JsonKey() final  String serialize;

/// Create a copy of MwComicItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwComicItemCopyWith<_MwComicItem> get copyWith => __$MwComicItemCopyWithImpl<_MwComicItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwComicItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwComicItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picx, picx) || other.picx == picx)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.text, text) || other.text == text)&&(identical(other.serialize, serialize) || other.serialize == serialize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picx,pic,text,serialize);

@override
String toString() {
  return 'MwComicItem(id: $id, name: $name, picx: $picx, pic: $pic, text: $text, serialize: $serialize)';
}


}

/// @nodoc
abstract mixin class _$MwComicItemCopyWith<$Res> implements $MwComicItemCopyWith<$Res> {
  factory _$MwComicItemCopyWith(_MwComicItem value, $Res Function(_MwComicItem) _then) = __$MwComicItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'picx') String? picx,@JsonKey(name: 'pic') String? pic, String? text, String serialize
});




}
/// @nodoc
class __$MwComicItemCopyWithImpl<$Res>
    implements _$MwComicItemCopyWith<$Res> {
  __$MwComicItemCopyWithImpl(this._self, this._then);

  final _MwComicItem _self;
  final $Res Function(_MwComicItem) _then;

/// Create a copy of MwComicItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picx = freezed,Object? pic = freezed,Object? text = freezed,Object? serialize = null,}) {
  return _then(_MwComicItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picx: freezed == picx ? _self.picx : picx // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,serialize: null == serialize ? _self.serialize : serialize // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MwDetailResult {

 dynamic get id; String get name; String? get nickname;@JsonKey(name: 'picx') String? get picx; List<String> get author; String? get state; String? get text; List<MwTagItem> get tags;@JsonKey(name: 'chapter_list') List<MwChapterItem> get chapterList;
/// Create a copy of MwDetailResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwDetailResultCopyWith<MwDetailResult> get copyWith => _$MwDetailResultCopyWithImpl<MwDetailResult>(this as MwDetailResult, _$identity);

  /// Serializes this MwDetailResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwDetailResult&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.picx, picx) || other.picx == picx)&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.state, state) || other.state == state)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.chapterList, chapterList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,nickname,picx,const DeepCollectionEquality().hash(author),state,text,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(chapterList));

@override
String toString() {
  return 'MwDetailResult(id: $id, name: $name, nickname: $nickname, picx: $picx, author: $author, state: $state, text: $text, tags: $tags, chapterList: $chapterList)';
}


}

/// @nodoc
abstract mixin class $MwDetailResultCopyWith<$Res>  {
  factory $MwDetailResultCopyWith(MwDetailResult value, $Res Function(MwDetailResult) _then) = _$MwDetailResultCopyWithImpl;
@useResult
$Res call({
 dynamic id, String name, String? nickname,@JsonKey(name: 'picx') String? picx, List<String> author, String? state, String? text, List<MwTagItem> tags,@JsonKey(name: 'chapter_list') List<MwChapterItem> chapterList
});




}
/// @nodoc
class _$MwDetailResultCopyWithImpl<$Res>
    implements $MwDetailResultCopyWith<$Res> {
  _$MwDetailResultCopyWithImpl(this._self, this._then);

  final MwDetailResult _self;
  final $Res Function(MwDetailResult) _then;

/// Create a copy of MwDetailResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? nickname = freezed,Object? picx = freezed,Object? author = null,Object? state = freezed,Object? text = freezed,Object? tags = null,Object? chapterList = null,}) {
  return _then(MwDetailResult(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,picx: freezed == picx ? _self.picx : picx // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as List<String>,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<MwTagItem>,chapterList: null == chapterList ? _self.chapterList : chapterList // ignore: cast_nullable_to_non_nullable
as List<MwChapterItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MwDetailResult].
extension MwDetailResultPatterns on MwDetailResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwDetailResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwDetailResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwDetailResult value)  $default,){
final _that = this;
switch (_that) {
case _MwDetailResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwDetailResult value)?  $default,){
final _that = this;
switch (_that) {
case _MwDetailResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String name,  String? nickname, @JsonKey(name: 'picx')  String? picx,  List<String> author,  String? state,  String? text,  List<MwTagItem> tags, @JsonKey(name: 'chapter_list')  List<MwChapterItem> chapterList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwDetailResult() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.picx,_that.author,_that.state,_that.text,_that.tags,_that.chapterList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String name,  String? nickname, @JsonKey(name: 'picx')  String? picx,  List<String> author,  String? state,  String? text,  List<MwTagItem> tags, @JsonKey(name: 'chapter_list')  List<MwChapterItem> chapterList)  $default,) {final _that = this;
switch (_that) {
case _MwDetailResult():
return $default(_that.id,_that.name,_that.nickname,_that.picx,_that.author,_that.state,_that.text,_that.tags,_that.chapterList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String name,  String? nickname, @JsonKey(name: 'picx')  String? picx,  List<String> author,  String? state,  String? text,  List<MwTagItem> tags, @JsonKey(name: 'chapter_list')  List<MwChapterItem> chapterList)?  $default,) {final _that = this;
switch (_that) {
case _MwDetailResult() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.picx,_that.author,_that.state,_that.text,_that.tags,_that.chapterList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwDetailResult implements MwDetailResult {
  const _MwDetailResult({required this.id, required this.name, this.nickname, @JsonKey(name: 'picx') this.picx,  List<String> author = const [], this.state, this.text,  List<MwTagItem> tags = const [], @JsonKey(name: 'chapter_list')  List<MwChapterItem> chapterList = const []}): _author = author,_tags = tags,_chapterList = chapterList;
  factory _MwDetailResult.fromJson(Map<String, dynamic> json) => _$MwDetailResultFromJson(json);

@override final  dynamic id;
@override final  String name;
@override final  String? nickname;
@override@JsonKey(name: 'picx') final  String? picx;
 final  List<String> _author;
@override@JsonKey() List<String> get author {
  if (_author is EqualUnmodifiableListView) return _author;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_author);
}

@override final  String? state;
@override final  String? text;
 final  List<MwTagItem> _tags;
@override@JsonKey() List<MwTagItem> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<MwChapterItem> _chapterList;
@override@JsonKey(name: 'chapter_list') List<MwChapterItem> get chapterList {
  if (_chapterList is EqualUnmodifiableListView) return _chapterList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapterList);
}


/// Create a copy of MwDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwDetailResultCopyWith<_MwDetailResult> get copyWith => __$MwDetailResultCopyWithImpl<_MwDetailResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwDetailResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwDetailResult&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.picx, picx) || other.picx == picx)&&const DeepCollectionEquality().equals(other._author, _author)&&(identical(other.state, state) || other.state == state)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._chapterList, _chapterList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,nickname,picx,const DeepCollectionEquality().hash(_author),state,text,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_chapterList));

@override
String toString() {
  return 'MwDetailResult(id: $id, name: $name, nickname: $nickname, picx: $picx, author: $author, state: $state, text: $text, tags: $tags, chapterList: $chapterList)';
}


}

/// @nodoc
abstract mixin class _$MwDetailResultCopyWith<$Res> implements $MwDetailResultCopyWith<$Res> {
  factory _$MwDetailResultCopyWith(_MwDetailResult value, $Res Function(_MwDetailResult) _then) = __$MwDetailResultCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String name, String? nickname,@JsonKey(name: 'picx') String? picx, List<String> author, String? state, String? text, List<MwTagItem> tags,@JsonKey(name: 'chapter_list') List<MwChapterItem> chapterList
});




}
/// @nodoc
class __$MwDetailResultCopyWithImpl<$Res>
    implements _$MwDetailResultCopyWith<$Res> {
  __$MwDetailResultCopyWithImpl(this._self, this._then);

  final _MwDetailResult _self;
  final $Res Function(_MwDetailResult) _then;

/// Create a copy of MwDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? nickname = freezed,Object? picx = freezed,Object? author = null,Object? state = freezed,Object? text = freezed,Object? tags = null,Object? chapterList = null,}) {
  return _then(_MwDetailResult(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,picx: freezed == picx ? _self.picx : picx // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self._author : author // ignore: cast_nullable_to_non_nullable
as List<String>,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<MwTagItem>,chapterList: null == chapterList ? _self._chapterList : chapterList // ignore: cast_nullable_to_non_nullable
as List<MwChapterItem>,
  ));
}


}


/// @nodoc
mixin _$MwChapterItem {

 int get id; String get name; String? get addtime;
/// Create a copy of MwChapterItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwChapterItemCopyWith<MwChapterItem> get copyWith => _$MwChapterItemCopyWithImpl<MwChapterItem>(this as MwChapterItem, _$identity);

  /// Serializes this MwChapterItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwChapterItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.addtime, addtime) || other.addtime == addtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,addtime);

@override
String toString() {
  return 'MwChapterItem(id: $id, name: $name, addtime: $addtime)';
}


}

/// @nodoc
abstract mixin class $MwChapterItemCopyWith<$Res>  {
  factory $MwChapterItemCopyWith(MwChapterItem value, $Res Function(MwChapterItem) _then) = _$MwChapterItemCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? addtime
});




}
/// @nodoc
class _$MwChapterItemCopyWithImpl<$Res>
    implements $MwChapterItemCopyWith<$Res> {
  _$MwChapterItemCopyWithImpl(this._self, this._then);

  final MwChapterItem _self;
  final $Res Function(MwChapterItem) _then;

/// Create a copy of MwChapterItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? addtime = freezed,}) {
  return _then(MwChapterItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addtime: freezed == addtime ? _self.addtime : addtime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MwChapterItem].
extension MwChapterItemPatterns on MwChapterItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwChapterItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwChapterItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwChapterItem value)  $default,){
final _that = this;
switch (_that) {
case _MwChapterItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwChapterItem value)?  $default,){
final _that = this;
switch (_that) {
case _MwChapterItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? addtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwChapterItem() when $default != null:
return $default(_that.id,_that.name,_that.addtime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? addtime)  $default,) {final _that = this;
switch (_that) {
case _MwChapterItem():
return $default(_that.id,_that.name,_that.addtime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? addtime)?  $default,) {final _that = this;
switch (_that) {
case _MwChapterItem() when $default != null:
return $default(_that.id,_that.name,_that.addtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwChapterItem implements MwChapterItem {
  const _MwChapterItem({required this.id, required this.name, this.addtime});
  factory _MwChapterItem.fromJson(Map<String, dynamic> json) => _$MwChapterItemFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? addtime;

/// Create a copy of MwChapterItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwChapterItemCopyWith<_MwChapterItem> get copyWith => __$MwChapterItemCopyWithImpl<_MwChapterItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwChapterItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwChapterItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.addtime, addtime) || other.addtime == addtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,addtime);

@override
String toString() {
  return 'MwChapterItem(id: $id, name: $name, addtime: $addtime)';
}


}

/// @nodoc
abstract mixin class _$MwChapterItemCopyWith<$Res> implements $MwChapterItemCopyWith<$Res> {
  factory _$MwChapterItemCopyWith(_MwChapterItem value, $Res Function(_MwChapterItem) _then) = __$MwChapterItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? addtime
});




}
/// @nodoc
class __$MwChapterItemCopyWithImpl<$Res>
    implements _$MwChapterItemCopyWith<$Res> {
  __$MwChapterItemCopyWithImpl(this._self, this._then);

  final _MwChapterItem _self;
  final $Res Function(_MwChapterItem) _then;

/// Create a copy of MwChapterItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? addtime = freezed,}) {
  return _then(_MwChapterItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addtime: freezed == addtime ? _self.addtime : addtime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MwTagItem {

 String get name;
/// Create a copy of MwTagItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwTagItemCopyWith<MwTagItem> get copyWith => _$MwTagItemCopyWithImpl<MwTagItem>(this as MwTagItem, _$identity);

  /// Serializes this MwTagItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwTagItem&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'MwTagItem(name: $name)';
}


}

/// @nodoc
abstract mixin class $MwTagItemCopyWith<$Res>  {
  factory $MwTagItemCopyWith(MwTagItem value, $Res Function(MwTagItem) _then) = _$MwTagItemCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$MwTagItemCopyWithImpl<$Res>
    implements $MwTagItemCopyWith<$Res> {
  _$MwTagItemCopyWithImpl(this._self, this._then);

  final MwTagItem _self;
  final $Res Function(MwTagItem) _then;

/// Create a copy of MwTagItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(MwTagItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MwTagItem].
extension MwTagItemPatterns on MwTagItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwTagItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwTagItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwTagItem value)  $default,){
final _that = this;
switch (_that) {
case _MwTagItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwTagItem value)?  $default,){
final _that = this;
switch (_that) {
case _MwTagItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwTagItem() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _MwTagItem():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _MwTagItem() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwTagItem implements MwTagItem {
  const _MwTagItem({required this.name});
  factory _MwTagItem.fromJson(Map<String, dynamic> json) => _$MwTagItemFromJson(json);

@override final  String name;

/// Create a copy of MwTagItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwTagItemCopyWith<_MwTagItem> get copyWith => __$MwTagItemCopyWithImpl<_MwTagItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwTagItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwTagItem&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'MwTagItem(name: $name)';
}


}

/// @nodoc
abstract mixin class _$MwTagItemCopyWith<$Res> implements $MwTagItemCopyWith<$Res> {
  factory _$MwTagItemCopyWith(_MwTagItem value, $Res Function(_MwTagItem) _then) = __$MwTagItemCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$MwTagItemCopyWithImpl<$Res>
    implements _$MwTagItemCopyWith<$Res> {
  __$MwTagItemCopyWithImpl(this._self, this._then);

  final _MwTagItem _self;
  final $Res Function(_MwTagItem) _then;

/// Create a copy of MwTagItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_MwTagItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MwChapterImageResult {

 List<MwImageItem> get piclist;
/// Create a copy of MwChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwChapterImageResultCopyWith<MwChapterImageResult> get copyWith => _$MwChapterImageResultCopyWithImpl<MwChapterImageResult>(this as MwChapterImageResult, _$identity);

  /// Serializes this MwChapterImageResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwChapterImageResult&&const DeepCollectionEquality().equals(other.piclist, piclist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(piclist));

@override
String toString() {
  return 'MwChapterImageResult(piclist: $piclist)';
}


}

/// @nodoc
abstract mixin class $MwChapterImageResultCopyWith<$Res>  {
  factory $MwChapterImageResultCopyWith(MwChapterImageResult value, $Res Function(MwChapterImageResult) _then) = _$MwChapterImageResultCopyWithImpl;
@useResult
$Res call({
 List<MwImageItem> piclist
});




}
/// @nodoc
class _$MwChapterImageResultCopyWithImpl<$Res>
    implements $MwChapterImageResultCopyWith<$Res> {
  _$MwChapterImageResultCopyWithImpl(this._self, this._then);

  final MwChapterImageResult _self;
  final $Res Function(MwChapterImageResult) _then;

/// Create a copy of MwChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? piclist = null,}) {
  return _then(MwChapterImageResult(
piclist: null == piclist ? _self.piclist : piclist // ignore: cast_nullable_to_non_nullable
as List<MwImageItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MwChapterImageResult].
extension MwChapterImageResultPatterns on MwChapterImageResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwChapterImageResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwChapterImageResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwChapterImageResult value)  $default,){
final _that = this;
switch (_that) {
case _MwChapterImageResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwChapterImageResult value)?  $default,){
final _that = this;
switch (_that) {
case _MwChapterImageResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MwImageItem> piclist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwChapterImageResult() when $default != null:
return $default(_that.piclist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MwImageItem> piclist)  $default,) {final _that = this;
switch (_that) {
case _MwChapterImageResult():
return $default(_that.piclist);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MwImageItem> piclist)?  $default,) {final _that = this;
switch (_that) {
case _MwChapterImageResult() when $default != null:
return $default(_that.piclist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwChapterImageResult implements MwChapterImageResult {
  const _MwChapterImageResult({ List<MwImageItem> piclist = const []}): _piclist = piclist;
  factory _MwChapterImageResult.fromJson(Map<String, dynamic> json) => _$MwChapterImageResultFromJson(json);

 final  List<MwImageItem> _piclist;
@override@JsonKey() List<MwImageItem> get piclist {
  if (_piclist is EqualUnmodifiableListView) return _piclist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_piclist);
}


/// Create a copy of MwChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwChapterImageResultCopyWith<_MwChapterImageResult> get copyWith => __$MwChapterImageResultCopyWithImpl<_MwChapterImageResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwChapterImageResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwChapterImageResult&&const DeepCollectionEquality().equals(other._piclist, _piclist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_piclist));

@override
String toString() {
  return 'MwChapterImageResult(piclist: $piclist)';
}


}

/// @nodoc
abstract mixin class _$MwChapterImageResultCopyWith<$Res> implements $MwChapterImageResultCopyWith<$Res> {
  factory _$MwChapterImageResultCopyWith(_MwChapterImageResult value, $Res Function(_MwChapterImageResult) _then) = __$MwChapterImageResultCopyWithImpl;
@override @useResult
$Res call({
 List<MwImageItem> piclist
});




}
/// @nodoc
class __$MwChapterImageResultCopyWithImpl<$Res>
    implements _$MwChapterImageResultCopyWith<$Res> {
  __$MwChapterImageResultCopyWithImpl(this._self, this._then);

  final _MwChapterImageResult _self;
  final $Res Function(_MwChapterImageResult) _then;

/// Create a copy of MwChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? piclist = null,}) {
  return _then(_MwChapterImageResult(
piclist: null == piclist ? _self._piclist : piclist // ignore: cast_nullable_to_non_nullable
as List<MwImageItem>,
  ));
}


}


/// @nodoc
mixin _$MwImageItem {

 String get pic;
/// Create a copy of MwImageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MwImageItemCopyWith<MwImageItem> get copyWith => _$MwImageItemCopyWithImpl<MwImageItem>(this as MwImageItem, _$identity);

  /// Serializes this MwImageItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MwImageItem&&(identical(other.pic, pic) || other.pic == pic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pic);

@override
String toString() {
  return 'MwImageItem(pic: $pic)';
}


}

/// @nodoc
abstract mixin class $MwImageItemCopyWith<$Res>  {
  factory $MwImageItemCopyWith(MwImageItem value, $Res Function(MwImageItem) _then) = _$MwImageItemCopyWithImpl;
@useResult
$Res call({
 String pic
});




}
/// @nodoc
class _$MwImageItemCopyWithImpl<$Res>
    implements $MwImageItemCopyWith<$Res> {
  _$MwImageItemCopyWithImpl(this._self, this._then);

  final MwImageItem _self;
  final $Res Function(MwImageItem) _then;

/// Create a copy of MwImageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pic = null,}) {
  return _then(MwImageItem(
pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MwImageItem].
extension MwImageItemPatterns on MwImageItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MwImageItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MwImageItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MwImageItem value)  $default,){
final _that = this;
switch (_that) {
case _MwImageItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MwImageItem value)?  $default,){
final _that = this;
switch (_that) {
case _MwImageItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MwImageItem() when $default != null:
return $default(_that.pic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pic)  $default,) {final _that = this;
switch (_that) {
case _MwImageItem():
return $default(_that.pic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pic)?  $default,) {final _that = this;
switch (_that) {
case _MwImageItem() when $default != null:
return $default(_that.pic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MwImageItem implements MwImageItem {
  const _MwImageItem({required this.pic});
  factory _MwImageItem.fromJson(Map<String, dynamic> json) => _$MwImageItemFromJson(json);

@override final  String pic;

/// Create a copy of MwImageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MwImageItemCopyWith<_MwImageItem> get copyWith => __$MwImageItemCopyWithImpl<_MwImageItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MwImageItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MwImageItem&&(identical(other.pic, pic) || other.pic == pic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pic);

@override
String toString() {
  return 'MwImageItem(pic: $pic)';
}


}

/// @nodoc
abstract mixin class _$MwImageItemCopyWith<$Res> implements $MwImageItemCopyWith<$Res> {
  factory _$MwImageItemCopyWith(_MwImageItem value, $Res Function(_MwImageItem) _then) = __$MwImageItemCopyWithImpl;
@override @useResult
$Res call({
 String pic
});




}
/// @nodoc
class __$MwImageItemCopyWithImpl<$Res>
    implements _$MwImageItemCopyWith<$Res> {
  __$MwImageItemCopyWithImpl(this._self, this._then);

  final _MwImageItem _self;
  final $Res Function(_MwImageItem) _then;

/// Create a copy of MwImageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pic = null,}) {
  return _then(_MwImageItem(
pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
