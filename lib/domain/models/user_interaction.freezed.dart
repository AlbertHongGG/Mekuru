// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFavorite {

@JsonKey(name: 'provider_id') String get providerId;@JsonKey(name: 'comic_id') String get comicId; Comic? get comic;@JsonKey(name: 'added_at') String get addedAt;@JsonKey(name: 'last_read_at') String? get lastReadAt;@JsonKey(name: 'is_archived') bool? get isArchived;
/// Create a copy of UserFavorite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFavoriteCopyWith<UserFavorite> get copyWith => _$UserFavoriteCopyWithImpl<UserFavorite>(this as UserFavorite, _$identity);

  /// Serializes this UserFavorite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFavorite&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,comicId,comic,addedAt,lastReadAt,isArchived);

@override
String toString() {
  return 'UserFavorite(providerId: $providerId, comicId: $comicId, comic: $comic, addedAt: $addedAt, lastReadAt: $lastReadAt, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class $UserFavoriteCopyWith<$Res>  {
  factory $UserFavoriteCopyWith(UserFavorite value, $Res Function(UserFavorite) _then) = _$UserFavoriteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId, Comic? comic,@JsonKey(name: 'added_at') String addedAt,@JsonKey(name: 'last_read_at') String? lastReadAt,@JsonKey(name: 'is_archived') bool? isArchived
});


$ComicCopyWith<$Res>? get comic;

}
/// @nodoc
class _$UserFavoriteCopyWithImpl<$Res>
    implements $UserFavoriteCopyWith<$Res> {
  _$UserFavoriteCopyWithImpl(this._self, this._then);

  final UserFavorite _self;
  final $Res Function(UserFavorite) _then;

/// Create a copy of UserFavorite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? providerId = null,Object? comicId = null,Object? comic = freezed,Object? addedAt = null,Object? lastReadAt = freezed,Object? isArchived = freezed,}) {
  return _then(UserFavorite(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,comic: freezed == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as Comic?,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as String,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of UserFavorite
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCopyWith<$Res>? get comic {
    if (_self.comic == null) {
    return null;
  }

  return $ComicCopyWith<$Res>(_self.comic!, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserFavorite].
extension UserFavoritePatterns on UserFavorite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFavorite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFavorite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFavorite value)  $default,){
final _that = this;
switch (_that) {
case _UserFavorite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFavorite value)?  $default,){
final _that = this;
switch (_that) {
case _UserFavorite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId,  Comic? comic, @JsonKey(name: 'added_at')  String addedAt, @JsonKey(name: 'last_read_at')  String? lastReadAt, @JsonKey(name: 'is_archived')  bool? isArchived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFavorite() when $default != null:
return $default(_that.providerId,_that.comicId,_that.comic,_that.addedAt,_that.lastReadAt,_that.isArchived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId,  Comic? comic, @JsonKey(name: 'added_at')  String addedAt, @JsonKey(name: 'last_read_at')  String? lastReadAt, @JsonKey(name: 'is_archived')  bool? isArchived)  $default,) {final _that = this;
switch (_that) {
case _UserFavorite():
return $default(_that.providerId,_that.comicId,_that.comic,_that.addedAt,_that.lastReadAt,_that.isArchived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId,  Comic? comic, @JsonKey(name: 'added_at')  String addedAt, @JsonKey(name: 'last_read_at')  String? lastReadAt, @JsonKey(name: 'is_archived')  bool? isArchived)?  $default,) {final _that = this;
switch (_that) {
case _UserFavorite() when $default != null:
return $default(_that.providerId,_that.comicId,_that.comic,_that.addedAt,_that.lastReadAt,_that.isArchived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserFavorite implements UserFavorite {
  const _UserFavorite({@JsonKey(name: 'provider_id') required this.providerId, @JsonKey(name: 'comic_id') required this.comicId, this.comic, @JsonKey(name: 'added_at') required this.addedAt, @JsonKey(name: 'last_read_at') this.lastReadAt, @JsonKey(name: 'is_archived') this.isArchived});
  factory _UserFavorite.fromJson(Map<String, dynamic> json) => _$UserFavoriteFromJson(json);

@override@JsonKey(name: 'provider_id') final  String providerId;
@override@JsonKey(name: 'comic_id') final  String comicId;
@override final  Comic? comic;
@override@JsonKey(name: 'added_at') final  String addedAt;
@override@JsonKey(name: 'last_read_at') final  String? lastReadAt;
@override@JsonKey(name: 'is_archived') final  bool? isArchived;

/// Create a copy of UserFavorite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFavoriteCopyWith<_UserFavorite> get copyWith => __$UserFavoriteCopyWithImpl<_UserFavorite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFavoriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFavorite&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,comicId,comic,addedAt,lastReadAt,isArchived);

@override
String toString() {
  return 'UserFavorite(providerId: $providerId, comicId: $comicId, comic: $comic, addedAt: $addedAt, lastReadAt: $lastReadAt, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class _$UserFavoriteCopyWith<$Res> implements $UserFavoriteCopyWith<$Res> {
  factory _$UserFavoriteCopyWith(_UserFavorite value, $Res Function(_UserFavorite) _then) = __$UserFavoriteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId, Comic? comic,@JsonKey(name: 'added_at') String addedAt,@JsonKey(name: 'last_read_at') String? lastReadAt,@JsonKey(name: 'is_archived') bool? isArchived
});


@override $ComicCopyWith<$Res>? get comic;

}
/// @nodoc
class __$UserFavoriteCopyWithImpl<$Res>
    implements _$UserFavoriteCopyWith<$Res> {
  __$UserFavoriteCopyWithImpl(this._self, this._then);

  final _UserFavorite _self;
  final $Res Function(_UserFavorite) _then;

/// Create a copy of UserFavorite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? providerId = null,Object? comicId = null,Object? comic = freezed,Object? addedAt = null,Object? lastReadAt = freezed,Object? isArchived = freezed,}) {
  return _then(_UserFavorite(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,comic: freezed == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as Comic?,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as String,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as String?,isArchived: freezed == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of UserFavorite
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCopyWith<$Res>? get comic {
    if (_self.comic == null) {
    return null;
  }

  return $ComicCopyWith<$Res>(_self.comic!, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$UserInteraction {

@JsonKey(name: 'provider_id') String get providerId;@JsonKey(name: 'comic_id') String get comicId;@JsonKey(name: 'is_favorite') bool get isFavorite;@JsonKey(name: 'last_read_chapter') String? get lastReadChapter;@JsonKey(name: 'last_read_page') int? get lastReadPage;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of UserInteraction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInteractionCopyWith<UserInteraction> get copyWith => _$UserInteractionCopyWithImpl<UserInteraction>(this as UserInteraction, _$identity);

  /// Serializes this UserInteraction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInteraction&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.lastReadChapter, lastReadChapter) || other.lastReadChapter == lastReadChapter)&&(identical(other.lastReadPage, lastReadPage) || other.lastReadPage == lastReadPage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,comicId,isFavorite,lastReadChapter,lastReadPage,updatedAt);

@override
String toString() {
  return 'UserInteraction(providerId: $providerId, comicId: $comicId, isFavorite: $isFavorite, lastReadChapter: $lastReadChapter, lastReadPage: $lastReadPage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserInteractionCopyWith<$Res>  {
  factory $UserInteractionCopyWith(UserInteraction value, $Res Function(UserInteraction) _then) = _$UserInteractionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId,@JsonKey(name: 'is_favorite') bool isFavorite,@JsonKey(name: 'last_read_chapter') String? lastReadChapter,@JsonKey(name: 'last_read_page') int? lastReadPage,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$UserInteractionCopyWithImpl<$Res>
    implements $UserInteractionCopyWith<$Res> {
  _$UserInteractionCopyWithImpl(this._self, this._then);

  final UserInteraction _self;
  final $Res Function(UserInteraction) _then;

/// Create a copy of UserInteraction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? providerId = null,Object? comicId = null,Object? isFavorite = null,Object? lastReadChapter = freezed,Object? lastReadPage = freezed,Object? updatedAt = freezed,}) {
  return _then(UserInteraction(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,lastReadChapter: freezed == lastReadChapter ? _self.lastReadChapter : lastReadChapter // ignore: cast_nullable_to_non_nullable
as String?,lastReadPage: freezed == lastReadPage ? _self.lastReadPage : lastReadPage // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInteraction].
extension UserInteractionPatterns on UserInteraction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInteraction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInteraction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInteraction value)  $default,){
final _that = this;
switch (_that) {
case _UserInteraction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInteraction value)?  $default,){
final _that = this;
switch (_that) {
case _UserInteraction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId, @JsonKey(name: 'is_favorite')  bool isFavorite, @JsonKey(name: 'last_read_chapter')  String? lastReadChapter, @JsonKey(name: 'last_read_page')  int? lastReadPage, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInteraction() when $default != null:
return $default(_that.providerId,_that.comicId,_that.isFavorite,_that.lastReadChapter,_that.lastReadPage,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId, @JsonKey(name: 'is_favorite')  bool isFavorite, @JsonKey(name: 'last_read_chapter')  String? lastReadChapter, @JsonKey(name: 'last_read_page')  int? lastReadPage, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserInteraction():
return $default(_that.providerId,_that.comicId,_that.isFavorite,_that.lastReadChapter,_that.lastReadPage,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId, @JsonKey(name: 'is_favorite')  bool isFavorite, @JsonKey(name: 'last_read_chapter')  String? lastReadChapter, @JsonKey(name: 'last_read_page')  int? lastReadPage, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserInteraction() when $default != null:
return $default(_that.providerId,_that.comicId,_that.isFavorite,_that.lastReadChapter,_that.lastReadPage,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInteraction implements UserInteraction {
  const _UserInteraction({@JsonKey(name: 'provider_id') required this.providerId, @JsonKey(name: 'comic_id') required this.comicId, @JsonKey(name: 'is_favorite') required this.isFavorite, @JsonKey(name: 'last_read_chapter') this.lastReadChapter, @JsonKey(name: 'last_read_page') this.lastReadPage, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _UserInteraction.fromJson(Map<String, dynamic> json) => _$UserInteractionFromJson(json);

@override@JsonKey(name: 'provider_id') final  String providerId;
@override@JsonKey(name: 'comic_id') final  String comicId;
@override@JsonKey(name: 'is_favorite') final  bool isFavorite;
@override@JsonKey(name: 'last_read_chapter') final  String? lastReadChapter;
@override@JsonKey(name: 'last_read_page') final  int? lastReadPage;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of UserInteraction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInteractionCopyWith<_UserInteraction> get copyWith => __$UserInteractionCopyWithImpl<_UserInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInteraction&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.lastReadChapter, lastReadChapter) || other.lastReadChapter == lastReadChapter)&&(identical(other.lastReadPage, lastReadPage) || other.lastReadPage == lastReadPage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerId,comicId,isFavorite,lastReadChapter,lastReadPage,updatedAt);

@override
String toString() {
  return 'UserInteraction(providerId: $providerId, comicId: $comicId, isFavorite: $isFavorite, lastReadChapter: $lastReadChapter, lastReadPage: $lastReadPage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserInteractionCopyWith<$Res> implements $UserInteractionCopyWith<$Res> {
  factory _$UserInteractionCopyWith(_UserInteraction value, $Res Function(_UserInteraction) _then) = __$UserInteractionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId,@JsonKey(name: 'is_favorite') bool isFavorite,@JsonKey(name: 'last_read_chapter') String? lastReadChapter,@JsonKey(name: 'last_read_page') int? lastReadPage,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$UserInteractionCopyWithImpl<$Res>
    implements _$UserInteractionCopyWith<$Res> {
  __$UserInteractionCopyWithImpl(this._self, this._then);

  final _UserInteraction _self;
  final $Res Function(_UserInteraction) _then;

/// Create a copy of UserInteraction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? providerId = null,Object? comicId = null,Object? isFavorite = null,Object? lastReadChapter = freezed,Object? lastReadPage = freezed,Object? updatedAt = freezed,}) {
  return _then(_UserInteraction(
providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,lastReadChapter: freezed == lastReadChapter ? _self.lastReadChapter : lastReadChapter // ignore: cast_nullable_to_non_nullable
as String?,lastReadPage: freezed == lastReadPage ? _self.lastReadPage : lastReadPage // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
