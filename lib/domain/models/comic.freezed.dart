// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Comic {

@JsonKey(name: 'id') String? get comicId;@JsonKey(name: 'provider_id') String? get providerId; String? get title;@JsonKey(name: 'cover_url') String? get coverUrl; String? get description; List<String>? get tags; String? get author;@JsonKey(name: 'update_status') String? get status;
/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCopyWith<Comic> get copyWith => _$ComicCopyWithImpl<Comic>(this as Comic, _$identity);

  /// Serializes this Comic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comic&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,description,const DeepCollectionEquality().hash(tags),author,status);

@override
String toString() {
  return 'Comic(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, description: $description, tags: $tags, author: $author, status: $status)';
}


}

/// @nodoc
abstract mixin class $ComicCopyWith<$Res>  {
  factory $ComicCopyWith(Comic value, $Res Function(Comic) _then) = _$ComicCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? comicId,@JsonKey(name: 'provider_id') String? providerId, String? title,@JsonKey(name: 'cover_url') String? coverUrl, String? description, List<String>? tags, String? author,@JsonKey(name: 'update_status') String? status
});




}
/// @nodoc
class _$ComicCopyWithImpl<$Res>
    implements $ComicCopyWith<$Res> {
  _$ComicCopyWithImpl(this._self, this._then);

  final Comic _self;
  final $Res Function(Comic) _then;

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = freezed,Object? providerId = freezed,Object? title = freezed,Object? coverUrl = freezed,Object? description = freezed,Object? tags = freezed,Object? author = freezed,Object? status = freezed,}) {
  return _then(Comic(
comicId: freezed == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String?,providerId: freezed == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Comic].
extension ComicPatterns on Comic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comic value)  $default,){
final _that = this;
switch (_that) {
case _Comic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comic value)?  $default,){
final _that = this;
switch (_that) {
case _Comic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? comicId, @JsonKey(name: 'provider_id')  String? providerId,  String? title, @JsonKey(name: 'cover_url')  String? coverUrl,  String? description,  List<String>? tags,  String? author, @JsonKey(name: 'update_status')  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comic() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.description,_that.tags,_that.author,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? comicId, @JsonKey(name: 'provider_id')  String? providerId,  String? title, @JsonKey(name: 'cover_url')  String? coverUrl,  String? description,  List<String>? tags,  String? author, @JsonKey(name: 'update_status')  String? status)  $default,) {final _that = this;
switch (_that) {
case _Comic():
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.description,_that.tags,_that.author,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? comicId, @JsonKey(name: 'provider_id')  String? providerId,  String? title, @JsonKey(name: 'cover_url')  String? coverUrl,  String? description,  List<String>? tags,  String? author, @JsonKey(name: 'update_status')  String? status)?  $default,) {final _that = this;
switch (_that) {
case _Comic() when $default != null:
return $default(_that.comicId,_that.providerId,_that.title,_that.coverUrl,_that.description,_that.tags,_that.author,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Comic implements Comic {
  const _Comic({@JsonKey(name: 'id') this.comicId, @JsonKey(name: 'provider_id') this.providerId, this.title, @JsonKey(name: 'cover_url') this.coverUrl, this.description,  List<String>? tags, this.author, @JsonKey(name: 'update_status') this.status}): _tags = tags;
  factory _Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

@override@JsonKey(name: 'id') final  String? comicId;
@override@JsonKey(name: 'provider_id') final  String? providerId;
@override final  String? title;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
@override final  String? description;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? author;
@override@JsonKey(name: 'update_status') final  String? status;

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicCopyWith<_Comic> get copyWith => __$ComicCopyWithImpl<_Comic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comic&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,providerId,title,coverUrl,description,const DeepCollectionEquality().hash(_tags),author,status);

@override
String toString() {
  return 'Comic(comicId: $comicId, providerId: $providerId, title: $title, coverUrl: $coverUrl, description: $description, tags: $tags, author: $author, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ComicCopyWith<$Res> implements $ComicCopyWith<$Res> {
  factory _$ComicCopyWith(_Comic value, $Res Function(_Comic) _then) = __$ComicCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? comicId,@JsonKey(name: 'provider_id') String? providerId, String? title,@JsonKey(name: 'cover_url') String? coverUrl, String? description, List<String>? tags, String? author,@JsonKey(name: 'update_status') String? status
});




}
/// @nodoc
class __$ComicCopyWithImpl<$Res>
    implements _$ComicCopyWith<$Res> {
  __$ComicCopyWithImpl(this._self, this._then);

  final _Comic _self;
  final $Res Function(_Comic) _then;

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = freezed,Object? providerId = freezed,Object? title = freezed,Object? coverUrl = freezed,Object? description = freezed,Object? tags = freezed,Object? author = freezed,Object? status = freezed,}) {
  return _then(_Comic(
comicId: freezed == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String?,providerId: freezed == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
