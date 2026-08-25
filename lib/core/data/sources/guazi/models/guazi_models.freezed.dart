// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guazi_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuaziComicDetail {

 dynamic get id; String get name; String? get author;@JsonKey(name: 'pic_thumb') String? get picThumb; String? get pic; String? get serialize; String? get content;@JsonKey(name: 'category_name') String? get categoryName;
/// Create a copy of GuaziComicDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuaziComicDetailCopyWith<GuaziComicDetail> get copyWith => _$GuaziComicDetailCopyWithImpl<GuaziComicDetail>(this as GuaziComicDetail, _$identity);

  /// Serializes this GuaziComicDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuaziComicDetail&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.author, author) || other.author == author)&&(identical(other.picThumb, picThumb) || other.picThumb == picThumb)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.serialize, serialize) || other.serialize == serialize)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,author,picThumb,pic,serialize,content,categoryName);

@override
String toString() {
  return 'GuaziComicDetail(id: $id, name: $name, author: $author, picThumb: $picThumb, pic: $pic, serialize: $serialize, content: $content, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $GuaziComicDetailCopyWith<$Res>  {
  factory $GuaziComicDetailCopyWith(GuaziComicDetail value, $Res Function(GuaziComicDetail) _then) = _$GuaziComicDetailCopyWithImpl;
@useResult
$Res call({
 dynamic id, String name, String? author,@JsonKey(name: 'pic_thumb') String? picThumb, String? pic, String? serialize, String? content,@JsonKey(name: 'category_name') String? categoryName
});




}
/// @nodoc
class _$GuaziComicDetailCopyWithImpl<$Res>
    implements $GuaziComicDetailCopyWith<$Res> {
  _$GuaziComicDetailCopyWithImpl(this._self, this._then);

  final GuaziComicDetail _self;
  final $Res Function(GuaziComicDetail) _then;

/// Create a copy of GuaziComicDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? author = freezed,Object? picThumb = freezed,Object? pic = freezed,Object? serialize = freezed,Object? content = freezed,Object? categoryName = freezed,}) {
  return _then(GuaziComicDetail(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,picThumb: freezed == picThumb ? _self.picThumb : picThumb // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,serialize: freezed == serialize ? _self.serialize : serialize // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuaziComicDetail].
extension GuaziComicDetailPatterns on GuaziComicDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuaziComicDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuaziComicDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuaziComicDetail value)  $default,){
final _that = this;
switch (_that) {
case _GuaziComicDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuaziComicDetail value)?  $default,){
final _that = this;
switch (_that) {
case _GuaziComicDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String name,  String? author, @JsonKey(name: 'pic_thumb')  String? picThumb,  String? pic,  String? serialize,  String? content, @JsonKey(name: 'category_name')  String? categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuaziComicDetail() when $default != null:
return $default(_that.id,_that.name,_that.author,_that.picThumb,_that.pic,_that.serialize,_that.content,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String name,  String? author, @JsonKey(name: 'pic_thumb')  String? picThumb,  String? pic,  String? serialize,  String? content, @JsonKey(name: 'category_name')  String? categoryName)  $default,) {final _that = this;
switch (_that) {
case _GuaziComicDetail():
return $default(_that.id,_that.name,_that.author,_that.picThumb,_that.pic,_that.serialize,_that.content,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String name,  String? author, @JsonKey(name: 'pic_thumb')  String? picThumb,  String? pic,  String? serialize,  String? content, @JsonKey(name: 'category_name')  String? categoryName)?  $default,) {final _that = this;
switch (_that) {
case _GuaziComicDetail() when $default != null:
return $default(_that.id,_that.name,_that.author,_that.picThumb,_that.pic,_that.serialize,_that.content,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuaziComicDetail implements GuaziComicDetail {
  const _GuaziComicDetail({required this.id, required this.name, this.author, @JsonKey(name: 'pic_thumb') this.picThumb, this.pic, this.serialize, this.content, @JsonKey(name: 'category_name') this.categoryName});
  factory _GuaziComicDetail.fromJson(Map<String, dynamic> json) => _$GuaziComicDetailFromJson(json);

@override final  dynamic id;
@override final  String name;
@override final  String? author;
@override@JsonKey(name: 'pic_thumb') final  String? picThumb;
@override final  String? pic;
@override final  String? serialize;
@override final  String? content;
@override@JsonKey(name: 'category_name') final  String? categoryName;

/// Create a copy of GuaziComicDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuaziComicDetailCopyWith<_GuaziComicDetail> get copyWith => __$GuaziComicDetailCopyWithImpl<_GuaziComicDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuaziComicDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuaziComicDetail&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.author, author) || other.author == author)&&(identical(other.picThumb, picThumb) || other.picThumb == picThumb)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.serialize, serialize) || other.serialize == serialize)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,author,picThumb,pic,serialize,content,categoryName);

@override
String toString() {
  return 'GuaziComicDetail(id: $id, name: $name, author: $author, picThumb: $picThumb, pic: $pic, serialize: $serialize, content: $content, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$GuaziComicDetailCopyWith<$Res> implements $GuaziComicDetailCopyWith<$Res> {
  factory _$GuaziComicDetailCopyWith(_GuaziComicDetail value, $Res Function(_GuaziComicDetail) _then) = __$GuaziComicDetailCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String name, String? author,@JsonKey(name: 'pic_thumb') String? picThumb, String? pic, String? serialize, String? content,@JsonKey(name: 'category_name') String? categoryName
});




}
/// @nodoc
class __$GuaziComicDetailCopyWithImpl<$Res>
    implements _$GuaziComicDetailCopyWith<$Res> {
  __$GuaziComicDetailCopyWithImpl(this._self, this._then);

  final _GuaziComicDetail _self;
  final $Res Function(_GuaziComicDetail) _then;

/// Create a copy of GuaziComicDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? author = freezed,Object? picThumb = freezed,Object? pic = freezed,Object? serialize = freezed,Object? content = freezed,Object? categoryName = freezed,}) {
  return _then(_GuaziComicDetail(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,picThumb: freezed == picThumb ? _self.picThumb : picThumb // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,serialize: freezed == serialize ? _self.serialize : serialize // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GuaziChapterItem {

 dynamic get id; String get name; dynamic get xid; dynamic get addtime;
/// Create a copy of GuaziChapterItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuaziChapterItemCopyWith<GuaziChapterItem> get copyWith => _$GuaziChapterItemCopyWithImpl<GuaziChapterItem>(this as GuaziChapterItem, _$identity);

  /// Serializes this GuaziChapterItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuaziChapterItem&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.xid, xid)&&const DeepCollectionEquality().equals(other.addtime, addtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,const DeepCollectionEquality().hash(xid),const DeepCollectionEquality().hash(addtime));

@override
String toString() {
  return 'GuaziChapterItem(id: $id, name: $name, xid: $xid, addtime: $addtime)';
}


}

/// @nodoc
abstract mixin class $GuaziChapterItemCopyWith<$Res>  {
  factory $GuaziChapterItemCopyWith(GuaziChapterItem value, $Res Function(GuaziChapterItem) _then) = _$GuaziChapterItemCopyWithImpl;
@useResult
$Res call({
 dynamic id, String name, dynamic xid, dynamic addtime
});




}
/// @nodoc
class _$GuaziChapterItemCopyWithImpl<$Res>
    implements $GuaziChapterItemCopyWith<$Res> {
  _$GuaziChapterItemCopyWithImpl(this._self, this._then);

  final GuaziChapterItem _self;
  final $Res Function(GuaziChapterItem) _then;

/// Create a copy of GuaziChapterItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? xid = freezed,Object? addtime = freezed,}) {
  return _then(GuaziChapterItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,xid: freezed == xid ? _self.xid : xid // ignore: cast_nullable_to_non_nullable
as dynamic,addtime: freezed == addtime ? _self.addtime : addtime // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [GuaziChapterItem].
extension GuaziChapterItemPatterns on GuaziChapterItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuaziChapterItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuaziChapterItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuaziChapterItem value)  $default,){
final _that = this;
switch (_that) {
case _GuaziChapterItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuaziChapterItem value)?  $default,){
final _that = this;
switch (_that) {
case _GuaziChapterItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String name,  dynamic xid,  dynamic addtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuaziChapterItem() when $default != null:
return $default(_that.id,_that.name,_that.xid,_that.addtime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String name,  dynamic xid,  dynamic addtime)  $default,) {final _that = this;
switch (_that) {
case _GuaziChapterItem():
return $default(_that.id,_that.name,_that.xid,_that.addtime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String name,  dynamic xid,  dynamic addtime)?  $default,) {final _that = this;
switch (_that) {
case _GuaziChapterItem() when $default != null:
return $default(_that.id,_that.name,_that.xid,_that.addtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuaziChapterItem implements GuaziChapterItem {
  const _GuaziChapterItem({required this.id, required this.name, this.xid, this.addtime});
  factory _GuaziChapterItem.fromJson(Map<String, dynamic> json) => _$GuaziChapterItemFromJson(json);

@override final  dynamic id;
@override final  String name;
@override final  dynamic xid;
@override final  dynamic addtime;

/// Create a copy of GuaziChapterItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuaziChapterItemCopyWith<_GuaziChapterItem> get copyWith => __$GuaziChapterItemCopyWithImpl<_GuaziChapterItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuaziChapterItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuaziChapterItem&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.xid, xid)&&const DeepCollectionEquality().equals(other.addtime, addtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,const DeepCollectionEquality().hash(xid),const DeepCollectionEquality().hash(addtime));

@override
String toString() {
  return 'GuaziChapterItem(id: $id, name: $name, xid: $xid, addtime: $addtime)';
}


}

/// @nodoc
abstract mixin class _$GuaziChapterItemCopyWith<$Res> implements $GuaziChapterItemCopyWith<$Res> {
  factory _$GuaziChapterItemCopyWith(_GuaziChapterItem value, $Res Function(_GuaziChapterItem) _then) = __$GuaziChapterItemCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String name, dynamic xid, dynamic addtime
});




}
/// @nodoc
class __$GuaziChapterItemCopyWithImpl<$Res>
    implements _$GuaziChapterItemCopyWith<$Res> {
  __$GuaziChapterItemCopyWithImpl(this._self, this._then);

  final _GuaziChapterItem _self;
  final $Res Function(_GuaziChapterItem) _then;

/// Create a copy of GuaziChapterItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? xid = freezed,Object? addtime = freezed,}) {
  return _then(_GuaziChapterItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,xid: freezed == xid ? _self.xid : xid // ignore: cast_nullable_to_non_nullable
as dynamic,addtime: freezed == addtime ? _self.addtime : addtime // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$GuaziImageList {

 List<GuaziImageItem> get images;
/// Create a copy of GuaziImageList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuaziImageListCopyWith<GuaziImageList> get copyWith => _$GuaziImageListCopyWithImpl<GuaziImageList>(this as GuaziImageList, _$identity);

  /// Serializes this GuaziImageList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuaziImageList&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'GuaziImageList(images: $images)';
}


}

/// @nodoc
abstract mixin class $GuaziImageListCopyWith<$Res>  {
  factory $GuaziImageListCopyWith(GuaziImageList value, $Res Function(GuaziImageList) _then) = _$GuaziImageListCopyWithImpl;
@useResult
$Res call({
 List<GuaziImageItem> images
});




}
/// @nodoc
class _$GuaziImageListCopyWithImpl<$Res>
    implements $GuaziImageListCopyWith<$Res> {
  _$GuaziImageListCopyWithImpl(this._self, this._then);

  final GuaziImageList _self;
  final $Res Function(GuaziImageList) _then;

/// Create a copy of GuaziImageList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,}) {
  return _then(GuaziImageList(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<GuaziImageItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuaziImageList].
extension GuaziImageListPatterns on GuaziImageList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuaziImageList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuaziImageList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuaziImageList value)  $default,){
final _that = this;
switch (_that) {
case _GuaziImageList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuaziImageList value)?  $default,){
final _that = this;
switch (_that) {
case _GuaziImageList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GuaziImageItem> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuaziImageList() when $default != null:
return $default(_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GuaziImageItem> images)  $default,) {final _that = this;
switch (_that) {
case _GuaziImageList():
return $default(_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GuaziImageItem> images)?  $default,) {final _that = this;
switch (_that) {
case _GuaziImageList() when $default != null:
return $default(_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuaziImageList implements GuaziImageList {
  const _GuaziImageList({ List<GuaziImageItem> images = const []}): _images = images;
  factory _GuaziImageList.fromJson(Map<String, dynamic> json) => _$GuaziImageListFromJson(json);

 final  List<GuaziImageItem> _images;
@override@JsonKey() List<GuaziImageItem> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of GuaziImageList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuaziImageListCopyWith<_GuaziImageList> get copyWith => __$GuaziImageListCopyWithImpl<_GuaziImageList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuaziImageListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuaziImageList&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'GuaziImageList(images: $images)';
}


}

/// @nodoc
abstract mixin class _$GuaziImageListCopyWith<$Res> implements $GuaziImageListCopyWith<$Res> {
  factory _$GuaziImageListCopyWith(_GuaziImageList value, $Res Function(_GuaziImageList) _then) = __$GuaziImageListCopyWithImpl;
@override @useResult
$Res call({
 List<GuaziImageItem> images
});




}
/// @nodoc
class __$GuaziImageListCopyWithImpl<$Res>
    implements _$GuaziImageListCopyWith<$Res> {
  __$GuaziImageListCopyWithImpl(this._self, this._then);

  final _GuaziImageList _self;
  final $Res Function(_GuaziImageList) _then;

/// Create a copy of GuaziImageList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_GuaziImageList(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<GuaziImageItem>,
  ));
}


}


/// @nodoc
mixin _$GuaziImageItem {

 dynamic get id; String? get img;
/// Create a copy of GuaziImageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuaziImageItemCopyWith<GuaziImageItem> get copyWith => _$GuaziImageItemCopyWithImpl<GuaziImageItem>(this as GuaziImageItem, _$identity);

  /// Serializes this GuaziImageItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuaziImageItem&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.img, img) || other.img == img));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),img);

@override
String toString() {
  return 'GuaziImageItem(id: $id, img: $img)';
}


}

/// @nodoc
abstract mixin class $GuaziImageItemCopyWith<$Res>  {
  factory $GuaziImageItemCopyWith(GuaziImageItem value, $Res Function(GuaziImageItem) _then) = _$GuaziImageItemCopyWithImpl;
@useResult
$Res call({
 dynamic id, String? img
});




}
/// @nodoc
class _$GuaziImageItemCopyWithImpl<$Res>
    implements $GuaziImageItemCopyWith<$Res> {
  _$GuaziImageItemCopyWithImpl(this._self, this._then);

  final GuaziImageItem _self;
  final $Res Function(GuaziImageItem) _then;

/// Create a copy of GuaziImageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? img = freezed,}) {
  return _then(GuaziImageItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuaziImageItem].
extension GuaziImageItemPatterns on GuaziImageItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuaziImageItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuaziImageItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuaziImageItem value)  $default,){
final _that = this;
switch (_that) {
case _GuaziImageItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuaziImageItem value)?  $default,){
final _that = this;
switch (_that) {
case _GuaziImageItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String? img)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuaziImageItem() when $default != null:
return $default(_that.id,_that.img);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String? img)  $default,) {final _that = this;
switch (_that) {
case _GuaziImageItem():
return $default(_that.id,_that.img);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String? img)?  $default,) {final _that = this;
switch (_that) {
case _GuaziImageItem() when $default != null:
return $default(_that.id,_that.img);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuaziImageItem implements GuaziImageItem {
  const _GuaziImageItem({required this.id, this.img});
  factory _GuaziImageItem.fromJson(Map<String, dynamic> json) => _$GuaziImageItemFromJson(json);

@override final  dynamic id;
@override final  String? img;

/// Create a copy of GuaziImageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuaziImageItemCopyWith<_GuaziImageItem> get copyWith => __$GuaziImageItemCopyWithImpl<_GuaziImageItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuaziImageItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuaziImageItem&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.img, img) || other.img == img));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),img);

@override
String toString() {
  return 'GuaziImageItem(id: $id, img: $img)';
}


}

/// @nodoc
abstract mixin class _$GuaziImageItemCopyWith<$Res> implements $GuaziImageItemCopyWith<$Res> {
  factory _$GuaziImageItemCopyWith(_GuaziImageItem value, $Res Function(_GuaziImageItem) _then) = __$GuaziImageItemCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String? img
});




}
/// @nodoc
class __$GuaziImageItemCopyWithImpl<$Res>
    implements _$GuaziImageItemCopyWith<$Res> {
  __$GuaziImageItemCopyWithImpl(this._self, this._then);

  final _GuaziImageItem _self;
  final $Res Function(_GuaziImageItem) _then;

/// Create a copy of GuaziImageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? img = freezed,}) {
  return _then(_GuaziImageItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,img: freezed == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GuaziComicList {

@JsonKey(name: 'total') int? get total;@JsonKey(name: 'page') int? get page;@JsonKey(name: 'page_size') int? get pageSize; List<GuaziComicItem> get list;
/// Create a copy of GuaziComicList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuaziComicListCopyWith<GuaziComicList> get copyWith => _$GuaziComicListCopyWithImpl<GuaziComicList>(this as GuaziComicList, _$identity);

  /// Serializes this GuaziComicList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuaziComicList&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'GuaziComicList(total: $total, page: $page, pageSize: $pageSize, list: $list)';
}


}

/// @nodoc
abstract mixin class $GuaziComicListCopyWith<$Res>  {
  factory $GuaziComicListCopyWith(GuaziComicList value, $Res Function(GuaziComicList) _then) = _$GuaziComicListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total') int? total,@JsonKey(name: 'page') int? page,@JsonKey(name: 'page_size') int? pageSize, List<GuaziComicItem> list
});




}
/// @nodoc
class _$GuaziComicListCopyWithImpl<$Res>
    implements $GuaziComicListCopyWith<$Res> {
  _$GuaziComicListCopyWithImpl(this._self, this._then);

  final GuaziComicList _self;
  final $Res Function(GuaziComicList) _then;

/// Create a copy of GuaziComicList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = freezed,Object? page = freezed,Object? pageSize = freezed,Object? list = null,}) {
  return _then(GuaziComicList(
total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<GuaziComicItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuaziComicList].
extension GuaziComicListPatterns on GuaziComicList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuaziComicList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuaziComicList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuaziComicList value)  $default,){
final _that = this;
switch (_that) {
case _GuaziComicList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuaziComicList value)?  $default,){
final _that = this;
switch (_that) {
case _GuaziComicList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total')  int? total, @JsonKey(name: 'page')  int? page, @JsonKey(name: 'page_size')  int? pageSize,  List<GuaziComicItem> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuaziComicList() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total')  int? total, @JsonKey(name: 'page')  int? page, @JsonKey(name: 'page_size')  int? pageSize,  List<GuaziComicItem> list)  $default,) {final _that = this;
switch (_that) {
case _GuaziComicList():
return $default(_that.total,_that.page,_that.pageSize,_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total')  int? total, @JsonKey(name: 'page')  int? page, @JsonKey(name: 'page_size')  int? pageSize,  List<GuaziComicItem> list)?  $default,) {final _that = this;
switch (_that) {
case _GuaziComicList() when $default != null:
return $default(_that.total,_that.page,_that.pageSize,_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuaziComicList implements GuaziComicList {
  const _GuaziComicList({@JsonKey(name: 'total') this.total, @JsonKey(name: 'page') this.page, @JsonKey(name: 'page_size') this.pageSize,  List<GuaziComicItem> list = const []}): _list = list;
  factory _GuaziComicList.fromJson(Map<String, dynamic> json) => _$GuaziComicListFromJson(json);

@override@JsonKey(name: 'total') final  int? total;
@override@JsonKey(name: 'page') final  int? page;
@override@JsonKey(name: 'page_size') final  int? pageSize;
 final  List<GuaziComicItem> _list;
@override@JsonKey() List<GuaziComicItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of GuaziComicList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuaziComicListCopyWith<_GuaziComicList> get copyWith => __$GuaziComicListCopyWithImpl<_GuaziComicList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuaziComicListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuaziComicList&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pageSize,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'GuaziComicList(total: $total, page: $page, pageSize: $pageSize, list: $list)';
}


}

/// @nodoc
abstract mixin class _$GuaziComicListCopyWith<$Res> implements $GuaziComicListCopyWith<$Res> {
  factory _$GuaziComicListCopyWith(_GuaziComicList value, $Res Function(_GuaziComicList) _then) = __$GuaziComicListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total') int? total,@JsonKey(name: 'page') int? page,@JsonKey(name: 'page_size') int? pageSize, List<GuaziComicItem> list
});




}
/// @nodoc
class __$GuaziComicListCopyWithImpl<$Res>
    implements _$GuaziComicListCopyWith<$Res> {
  __$GuaziComicListCopyWithImpl(this._self, this._then);

  final _GuaziComicList _self;
  final $Res Function(_GuaziComicList) _then;

/// Create a copy of GuaziComicList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = freezed,Object? page = freezed,Object? pageSize = freezed,Object? list = null,}) {
  return _then(_GuaziComicList(
total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<GuaziComicItem>,
  ));
}


}


/// @nodoc
mixin _$GuaziComicItem {

 dynamic get id; String get name; String? get author; String? get pic;@JsonKey(name: 'pic_thumb') String? get picThumb; String? get serialize; String? get content;@JsonKey(name: 'category_name') String? get categoryName;
/// Create a copy of GuaziComicItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuaziComicItemCopyWith<GuaziComicItem> get copyWith => _$GuaziComicItemCopyWithImpl<GuaziComicItem>(this as GuaziComicItem, _$identity);

  /// Serializes this GuaziComicItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuaziComicItem&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.author, author) || other.author == author)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.picThumb, picThumb) || other.picThumb == picThumb)&&(identical(other.serialize, serialize) || other.serialize == serialize)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,author,pic,picThumb,serialize,content,categoryName);

@override
String toString() {
  return 'GuaziComicItem(id: $id, name: $name, author: $author, pic: $pic, picThumb: $picThumb, serialize: $serialize, content: $content, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $GuaziComicItemCopyWith<$Res>  {
  factory $GuaziComicItemCopyWith(GuaziComicItem value, $Res Function(GuaziComicItem) _then) = _$GuaziComicItemCopyWithImpl;
@useResult
$Res call({
 dynamic id, String name, String? author, String? pic,@JsonKey(name: 'pic_thumb') String? picThumb, String? serialize, String? content,@JsonKey(name: 'category_name') String? categoryName
});




}
/// @nodoc
class _$GuaziComicItemCopyWithImpl<$Res>
    implements $GuaziComicItemCopyWith<$Res> {
  _$GuaziComicItemCopyWithImpl(this._self, this._then);

  final GuaziComicItem _self;
  final $Res Function(GuaziComicItem) _then;

/// Create a copy of GuaziComicItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? author = freezed,Object? pic = freezed,Object? picThumb = freezed,Object? serialize = freezed,Object? content = freezed,Object? categoryName = freezed,}) {
  return _then(GuaziComicItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,picThumb: freezed == picThumb ? _self.picThumb : picThumb // ignore: cast_nullable_to_non_nullable
as String?,serialize: freezed == serialize ? _self.serialize : serialize // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuaziComicItem].
extension GuaziComicItemPatterns on GuaziComicItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuaziComicItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuaziComicItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuaziComicItem value)  $default,){
final _that = this;
switch (_that) {
case _GuaziComicItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuaziComicItem value)?  $default,){
final _that = this;
switch (_that) {
case _GuaziComicItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id,  String name,  String? author,  String? pic, @JsonKey(name: 'pic_thumb')  String? picThumb,  String? serialize,  String? content, @JsonKey(name: 'category_name')  String? categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuaziComicItem() when $default != null:
return $default(_that.id,_that.name,_that.author,_that.pic,_that.picThumb,_that.serialize,_that.content,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id,  String name,  String? author,  String? pic, @JsonKey(name: 'pic_thumb')  String? picThumb,  String? serialize,  String? content, @JsonKey(name: 'category_name')  String? categoryName)  $default,) {final _that = this;
switch (_that) {
case _GuaziComicItem():
return $default(_that.id,_that.name,_that.author,_that.pic,_that.picThumb,_that.serialize,_that.content,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id,  String name,  String? author,  String? pic, @JsonKey(name: 'pic_thumb')  String? picThumb,  String? serialize,  String? content, @JsonKey(name: 'category_name')  String? categoryName)?  $default,) {final _that = this;
switch (_that) {
case _GuaziComicItem() when $default != null:
return $default(_that.id,_that.name,_that.author,_that.pic,_that.picThumb,_that.serialize,_that.content,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuaziComicItem implements GuaziComicItem {
  const _GuaziComicItem({required this.id, required this.name, this.author, this.pic, @JsonKey(name: 'pic_thumb') this.picThumb, this.serialize, this.content, @JsonKey(name: 'category_name') this.categoryName});
  factory _GuaziComicItem.fromJson(Map<String, dynamic> json) => _$GuaziComicItemFromJson(json);

@override final  dynamic id;
@override final  String name;
@override final  String? author;
@override final  String? pic;
@override@JsonKey(name: 'pic_thumb') final  String? picThumb;
@override final  String? serialize;
@override final  String? content;
@override@JsonKey(name: 'category_name') final  String? categoryName;

/// Create a copy of GuaziComicItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuaziComicItemCopyWith<_GuaziComicItem> get copyWith => __$GuaziComicItemCopyWithImpl<_GuaziComicItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuaziComicItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuaziComicItem&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.author, author) || other.author == author)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.picThumb, picThumb) || other.picThumb == picThumb)&&(identical(other.serialize, serialize) || other.serialize == serialize)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,author,pic,picThumb,serialize,content,categoryName);

@override
String toString() {
  return 'GuaziComicItem(id: $id, name: $name, author: $author, pic: $pic, picThumb: $picThumb, serialize: $serialize, content: $content, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$GuaziComicItemCopyWith<$Res> implements $GuaziComicItemCopyWith<$Res> {
  factory _$GuaziComicItemCopyWith(_GuaziComicItem value, $Res Function(_GuaziComicItem) _then) = __$GuaziComicItemCopyWithImpl;
@override @useResult
$Res call({
 dynamic id, String name, String? author, String? pic,@JsonKey(name: 'pic_thumb') String? picThumb, String? serialize, String? content,@JsonKey(name: 'category_name') String? categoryName
});




}
/// @nodoc
class __$GuaziComicItemCopyWithImpl<$Res>
    implements _$GuaziComicItemCopyWith<$Res> {
  __$GuaziComicItemCopyWithImpl(this._self, this._then);

  final _GuaziComicItem _self;
  final $Res Function(_GuaziComicItem) _then;

/// Create a copy of GuaziComicItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? author = freezed,Object? pic = freezed,Object? picThumb = freezed,Object? serialize = freezed,Object? content = freezed,Object? categoryName = freezed,}) {
  return _then(_GuaziComicItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,picThumb: freezed == picThumb ? _self.picThumb : picThumb // ignore: cast_nullable_to_non_nullable
as String?,serialize: freezed == serialize ? _self.serialize : serialize // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
