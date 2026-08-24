// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_archive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupArchive {

 int get version; DateTime get exportedAt; List<ComicMetadataEntity> get metadataList; Map<String, FavoriteEntity> get favoritesMap; Map<String, HistoryEntity> get historyMap;
/// Create a copy of BackupArchive
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupArchiveCopyWith<BackupArchive> get copyWith => _$BackupArchiveCopyWithImpl<BackupArchive>(this as BackupArchive, _$identity);

  /// Serializes this BackupArchive to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupArchive&&(identical(other.version, version) || other.version == version)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&const DeepCollectionEquality().equals(other.metadataList, metadataList)&&const DeepCollectionEquality().equals(other.favoritesMap, favoritesMap)&&const DeepCollectionEquality().equals(other.historyMap, historyMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,exportedAt,const DeepCollectionEquality().hash(metadataList),const DeepCollectionEquality().hash(favoritesMap),const DeepCollectionEquality().hash(historyMap));

@override
String toString() {
  return 'BackupArchive(version: $version, exportedAt: $exportedAt, metadataList: $metadataList, favoritesMap: $favoritesMap, historyMap: $historyMap)';
}


}

/// @nodoc
abstract mixin class $BackupArchiveCopyWith<$Res>  {
  factory $BackupArchiveCopyWith(BackupArchive value, $Res Function(BackupArchive) _then) = _$BackupArchiveCopyWithImpl;
@useResult
$Res call({
 int version, DateTime exportedAt, List<ComicMetadataEntity> metadataList, Map<String, FavoriteEntity> favoritesMap, Map<String, HistoryEntity> historyMap
});




}
/// @nodoc
class _$BackupArchiveCopyWithImpl<$Res>
    implements $BackupArchiveCopyWith<$Res> {
  _$BackupArchiveCopyWithImpl(this._self, this._then);

  final BackupArchive _self;
  final $Res Function(BackupArchive) _then;

/// Create a copy of BackupArchive
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? exportedAt = null,Object? metadataList = null,Object? favoritesMap = null,Object? historyMap = null,}) {
  return _then(BackupArchive(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,exportedAt: null == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadataList: null == metadataList ? _self.metadataList : metadataList // ignore: cast_nullable_to_non_nullable
as List<ComicMetadataEntity>,favoritesMap: null == favoritesMap ? _self.favoritesMap : favoritesMap // ignore: cast_nullable_to_non_nullable
as Map<String, FavoriteEntity>,historyMap: null == historyMap ? _self.historyMap : historyMap // ignore: cast_nullable_to_non_nullable
as Map<String, HistoryEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupArchive].
extension BackupArchivePatterns on BackupArchive {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupArchive value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupArchive() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupArchive value)  $default,){
final _that = this;
switch (_that) {
case _BackupArchive():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupArchive value)?  $default,){
final _that = this;
switch (_that) {
case _BackupArchive() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  DateTime exportedAt,  List<ComicMetadataEntity> metadataList,  Map<String, FavoriteEntity> favoritesMap,  Map<String, HistoryEntity> historyMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupArchive() when $default != null:
return $default(_that.version,_that.exportedAt,_that.metadataList,_that.favoritesMap,_that.historyMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  DateTime exportedAt,  List<ComicMetadataEntity> metadataList,  Map<String, FavoriteEntity> favoritesMap,  Map<String, HistoryEntity> historyMap)  $default,) {final _that = this;
switch (_that) {
case _BackupArchive():
return $default(_that.version,_that.exportedAt,_that.metadataList,_that.favoritesMap,_that.historyMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  DateTime exportedAt,  List<ComicMetadataEntity> metadataList,  Map<String, FavoriteEntity> favoritesMap,  Map<String, HistoryEntity> historyMap)?  $default,) {final _that = this;
switch (_that) {
case _BackupArchive() when $default != null:
return $default(_that.version,_that.exportedAt,_that.metadataList,_that.favoritesMap,_that.historyMap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackupArchive implements BackupArchive {
  const _BackupArchive({required this.version, required this.exportedAt,  List<ComicMetadataEntity> metadataList = const [],  Map<String, FavoriteEntity> favoritesMap = const {},  Map<String, HistoryEntity> historyMap = const {}}): _metadataList = metadataList,_favoritesMap = favoritesMap,_historyMap = historyMap;
  factory _BackupArchive.fromJson(Map<String, dynamic> json) => _$BackupArchiveFromJson(json);

@override final  int version;
@override final  DateTime exportedAt;
 final  List<ComicMetadataEntity> _metadataList;
@override@JsonKey() List<ComicMetadataEntity> get metadataList {
  if (_metadataList is EqualUnmodifiableListView) return _metadataList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_metadataList);
}

 final  Map<String, FavoriteEntity> _favoritesMap;
@override@JsonKey() Map<String, FavoriteEntity> get favoritesMap {
  if (_favoritesMap is EqualUnmodifiableMapView) return _favoritesMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_favoritesMap);
}

 final  Map<String, HistoryEntity> _historyMap;
@override@JsonKey() Map<String, HistoryEntity> get historyMap {
  if (_historyMap is EqualUnmodifiableMapView) return _historyMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_historyMap);
}


/// Create a copy of BackupArchive
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupArchiveCopyWith<_BackupArchive> get copyWith => __$BackupArchiveCopyWithImpl<_BackupArchive>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackupArchiveToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupArchive&&(identical(other.version, version) || other.version == version)&&(identical(other.exportedAt, exportedAt) || other.exportedAt == exportedAt)&&const DeepCollectionEquality().equals(other._metadataList, _metadataList)&&const DeepCollectionEquality().equals(other._favoritesMap, _favoritesMap)&&const DeepCollectionEquality().equals(other._historyMap, _historyMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,exportedAt,const DeepCollectionEquality().hash(_metadataList),const DeepCollectionEquality().hash(_favoritesMap),const DeepCollectionEquality().hash(_historyMap));

@override
String toString() {
  return 'BackupArchive(version: $version, exportedAt: $exportedAt, metadataList: $metadataList, favoritesMap: $favoritesMap, historyMap: $historyMap)';
}


}

/// @nodoc
abstract mixin class _$BackupArchiveCopyWith<$Res> implements $BackupArchiveCopyWith<$Res> {
  factory _$BackupArchiveCopyWith(_BackupArchive value, $Res Function(_BackupArchive) _then) = __$BackupArchiveCopyWithImpl;
@override @useResult
$Res call({
 int version, DateTime exportedAt, List<ComicMetadataEntity> metadataList, Map<String, FavoriteEntity> favoritesMap, Map<String, HistoryEntity> historyMap
});




}
/// @nodoc
class __$BackupArchiveCopyWithImpl<$Res>
    implements _$BackupArchiveCopyWith<$Res> {
  __$BackupArchiveCopyWithImpl(this._self, this._then);

  final _BackupArchive _self;
  final $Res Function(_BackupArchive) _then;

/// Create a copy of BackupArchive
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? exportedAt = null,Object? metadataList = null,Object? favoritesMap = null,Object? historyMap = null,}) {
  return _then(_BackupArchive(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,exportedAt: null == exportedAt ? _self.exportedAt : exportedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadataList: null == metadataList ? _self._metadataList : metadataList // ignore: cast_nullable_to_non_nullable
as List<ComicMetadataEntity>,favoritesMap: null == favoritesMap ? _self._favoritesMap : favoritesMap // ignore: cast_nullable_to_non_nullable
as Map<String, FavoriteEntity>,historyMap: null == historyMap ? _self._historyMap : historyMap // ignore: cast_nullable_to_non_nullable
as Map<String, HistoryEntity>,
  ));
}


}

// dart format on
