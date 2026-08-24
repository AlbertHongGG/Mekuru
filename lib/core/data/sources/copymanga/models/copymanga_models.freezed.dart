// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'copymanga_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CopymangaResponse<T> {

 int get code; String get message; T? get results;
/// Create a copy of CopymangaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopymangaResponseCopyWith<T, CopymangaResponse<T>> get copyWith => _$CopymangaResponseCopyWithImpl<T, CopymangaResponse<T>>(this as CopymangaResponse<T>, _$identity);

  /// Serializes this CopymangaResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopymangaResponse<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CopymangaResponse<$T>(code: $code, message: $message, results: $results)';
}


}

/// @nodoc
abstract mixin class $CopymangaResponseCopyWith<T,$Res>  {
  factory $CopymangaResponseCopyWith(CopymangaResponse<T> value, $Res Function(CopymangaResponse<T>) _then) = _$CopymangaResponseCopyWithImpl;
@useResult
$Res call({
 int code, String message, T? results
});




}
/// @nodoc
class _$CopymangaResponseCopyWithImpl<T,$Res>
    implements $CopymangaResponseCopyWith<T, $Res> {
  _$CopymangaResponseCopyWithImpl(this._self, this._then);

  final CopymangaResponse<T> _self;
  final $Res Function(CopymangaResponse<T>) _then;

/// Create a copy of CopymangaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? results = freezed,}) {
  return _then(CopymangaResponse(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [CopymangaResponse].
extension CopymangaResponsePatterns<T> on CopymangaResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CopymangaResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CopymangaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CopymangaResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _CopymangaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CopymangaResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _CopymangaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String message,  T? results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CopymangaResponse() when $default != null:
return $default(_that.code,_that.message,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String message,  T? results)  $default,) {final _that = this;
switch (_that) {
case _CopymangaResponse():
return $default(_that.code,_that.message,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String message,  T? results)?  $default,) {final _that = this;
switch (_that) {
case _CopymangaResponse() when $default != null:
return $default(_that.code,_that.message,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _CopymangaResponse<T> implements CopymangaResponse<T> {
  const _CopymangaResponse({this.code = 200, this.message = '', this.results});
  factory _CopymangaResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$CopymangaResponseFromJson(json,fromJsonT);

@override@JsonKey() final  int code;
@override@JsonKey() final  String message;
@override final  T? results;

/// Create a copy of CopymangaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CopymangaResponseCopyWith<T, _CopymangaResponse<T>> get copyWith => __$CopymangaResponseCopyWithImpl<T, _CopymangaResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$CopymangaResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CopymangaResponse<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CopymangaResponse<$T>(code: $code, message: $message, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CopymangaResponseCopyWith<T,$Res> implements $CopymangaResponseCopyWith<T, $Res> {
  factory _$CopymangaResponseCopyWith(_CopymangaResponse<T> value, $Res Function(_CopymangaResponse<T>) _then) = __$CopymangaResponseCopyWithImpl;
@override @useResult
$Res call({
 int code, String message, T? results
});




}
/// @nodoc
class __$CopymangaResponseCopyWithImpl<T,$Res>
    implements _$CopymangaResponseCopyWith<T, $Res> {
  __$CopymangaResponseCopyWithImpl(this._self, this._then);

  final _CopymangaResponse<T> _self;
  final $Res Function(_CopymangaResponse<T>) _then;

/// Create a copy of CopymangaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? results = freezed,}) {
  return _then(_CopymangaResponse<T>(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}


/// @nodoc
mixin _$CmAuthor {

 String get name; String? get alias;@JsonKey(name: 'path_word') String get pathWord;
/// Create a copy of CmAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmAuthorCopyWith<CmAuthor> get copyWith => _$CmAuthorCopyWithImpl<CmAuthor>(this as CmAuthor, _$identity);

  /// Serializes this CmAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmAuthor&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,alias,pathWord);

@override
String toString() {
  return 'CmAuthor(name: $name, alias: $alias, pathWord: $pathWord)';
}


}

/// @nodoc
abstract mixin class $CmAuthorCopyWith<$Res>  {
  factory $CmAuthorCopyWith(CmAuthor value, $Res Function(CmAuthor) _then) = _$CmAuthorCopyWithImpl;
@useResult
$Res call({
 String name, String? alias,@JsonKey(name: 'path_word') String pathWord
});




}
/// @nodoc
class _$CmAuthorCopyWithImpl<$Res>
    implements $CmAuthorCopyWith<$Res> {
  _$CmAuthorCopyWithImpl(this._self, this._then);

  final CmAuthor _self;
  final $Res Function(CmAuthor) _then;

/// Create a copy of CmAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? alias = freezed,Object? pathWord = null,}) {
  return _then(CmAuthor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CmAuthor].
extension CmAuthorPatterns on CmAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmAuthor value)  $default,){
final _that = this;
switch (_that) {
case _CmAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _CmAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmAuthor() when $default != null:
return $default(_that.name,_that.alias,_that.pathWord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord)  $default,) {final _that = this;
switch (_that) {
case _CmAuthor():
return $default(_that.name,_that.alias,_that.pathWord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord)?  $default,) {final _that = this;
switch (_that) {
case _CmAuthor() when $default != null:
return $default(_that.name,_that.alias,_that.pathWord);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmAuthor implements CmAuthor {
  const _CmAuthor({required this.name, this.alias, @JsonKey(name: 'path_word') required this.pathWord});
  factory _CmAuthor.fromJson(Map<String, dynamic> json) => _$CmAuthorFromJson(json);

@override final  String name;
@override final  String? alias;
@override@JsonKey(name: 'path_word') final  String pathWord;

/// Create a copy of CmAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmAuthorCopyWith<_CmAuthor> get copyWith => __$CmAuthorCopyWithImpl<_CmAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmAuthor&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,alias,pathWord);

@override
String toString() {
  return 'CmAuthor(name: $name, alias: $alias, pathWord: $pathWord)';
}


}

/// @nodoc
abstract mixin class _$CmAuthorCopyWith<$Res> implements $CmAuthorCopyWith<$Res> {
  factory _$CmAuthorCopyWith(_CmAuthor value, $Res Function(_CmAuthor) _then) = __$CmAuthorCopyWithImpl;
@override @useResult
$Res call({
 String name, String? alias,@JsonKey(name: 'path_word') String pathWord
});




}
/// @nodoc
class __$CmAuthorCopyWithImpl<$Res>
    implements _$CmAuthorCopyWith<$Res> {
  __$CmAuthorCopyWithImpl(this._self, this._then);

  final _CmAuthor _self;
  final $Res Function(_CmAuthor) _then;

/// Create a copy of CmAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? alias = freezed,Object? pathWord = null,}) {
  return _then(_CmAuthor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CmTheme {

 String get name;@JsonKey(name: 'path_word') String get pathWord;
/// Create a copy of CmTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmThemeCopyWith<CmTheme> get copyWith => _$CmThemeCopyWithImpl<CmTheme>(this as CmTheme, _$identity);

  /// Serializes this CmTheme to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmTheme&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord);

@override
String toString() {
  return 'CmTheme(name: $name, pathWord: $pathWord)';
}


}

/// @nodoc
abstract mixin class $CmThemeCopyWith<$Res>  {
  factory $CmThemeCopyWith(CmTheme value, $Res Function(CmTheme) _then) = _$CmThemeCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'path_word') String pathWord
});




}
/// @nodoc
class _$CmThemeCopyWithImpl<$Res>
    implements $CmThemeCopyWith<$Res> {
  _$CmThemeCopyWithImpl(this._self, this._then);

  final CmTheme _self;
  final $Res Function(CmTheme) _then;

/// Create a copy of CmTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pathWord = null,}) {
  return _then(CmTheme(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CmTheme].
extension CmThemePatterns on CmTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmTheme value)  $default,){
final _that = this;
switch (_that) {
case _CmTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmTheme value)?  $default,){
final _that = this;
switch (_that) {
case _CmTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'path_word')  String pathWord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmTheme() when $default != null:
return $default(_that.name,_that.pathWord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'path_word')  String pathWord)  $default,) {final _that = this;
switch (_that) {
case _CmTheme():
return $default(_that.name,_that.pathWord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'path_word')  String pathWord)?  $default,) {final _that = this;
switch (_that) {
case _CmTheme() when $default != null:
return $default(_that.name,_that.pathWord);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmTheme implements CmTheme {
  const _CmTheme({required this.name, @JsonKey(name: 'path_word') required this.pathWord});
  factory _CmTheme.fromJson(Map<String, dynamic> json) => _$CmThemeFromJson(json);

@override final  String name;
@override@JsonKey(name: 'path_word') final  String pathWord;

/// Create a copy of CmTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmThemeCopyWith<_CmTheme> get copyWith => __$CmThemeCopyWithImpl<_CmTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmThemeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmTheme&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord);

@override
String toString() {
  return 'CmTheme(name: $name, pathWord: $pathWord)';
}


}

/// @nodoc
abstract mixin class _$CmThemeCopyWith<$Res> implements $CmThemeCopyWith<$Res> {
  factory _$CmThemeCopyWith(_CmTheme value, $Res Function(_CmTheme) _then) = __$CmThemeCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'path_word') String pathWord
});




}
/// @nodoc
class __$CmThemeCopyWithImpl<$Res>
    implements _$CmThemeCopyWith<$Res> {
  __$CmThemeCopyWithImpl(this._self, this._then);

  final _CmTheme _self;
  final $Res Function(_CmTheme) _then;

/// Create a copy of CmTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pathWord = null,}) {
  return _then(_CmTheme(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CmComicItem {

 String get name; String? get alias;@JsonKey(name: 'path_word') String get pathWord; String get cover; int get ban; List<CmAuthor> get author; int get popular;
/// Create a copy of CmComicItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmComicItemCopyWith<CmComicItem> get copyWith => _$CmComicItemCopyWithImpl<CmComicItem>(this as CmComicItem, _$identity);

  /// Serializes this CmComicItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmComicItem&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.ban, ban) || other.ban == ban)&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.popular, popular) || other.popular == popular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,alias,pathWord,cover,ban,const DeepCollectionEquality().hash(author),popular);

@override
String toString() {
  return 'CmComicItem(name: $name, alias: $alias, pathWord: $pathWord, cover: $cover, ban: $ban, author: $author, popular: $popular)';
}


}

/// @nodoc
abstract mixin class $CmComicItemCopyWith<$Res>  {
  factory $CmComicItemCopyWith(CmComicItem value, $Res Function(CmComicItem) _then) = _$CmComicItemCopyWithImpl;
@useResult
$Res call({
 String name, String? alias,@JsonKey(name: 'path_word') String pathWord, String cover, int ban, List<CmAuthor> author, int popular
});




}
/// @nodoc
class _$CmComicItemCopyWithImpl<$Res>
    implements $CmComicItemCopyWith<$Res> {
  _$CmComicItemCopyWithImpl(this._self, this._then);

  final CmComicItem _self;
  final $Res Function(CmComicItem) _then;

/// Create a copy of CmComicItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? alias = freezed,Object? pathWord = null,Object? cover = null,Object? ban = null,Object? author = null,Object? popular = null,}) {
  return _then(CmComicItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,ban: null == ban ? _self.ban : ban // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as List<CmAuthor>,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CmComicItem].
extension CmComicItemPatterns on CmComicItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmComicItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmComicItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmComicItem value)  $default,){
final _that = this;
switch (_that) {
case _CmComicItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmComicItem value)?  $default,){
final _that = this;
switch (_that) {
case _CmComicItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord,  String cover,  int ban,  List<CmAuthor> author,  int popular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmComicItem() when $default != null:
return $default(_that.name,_that.alias,_that.pathWord,_that.cover,_that.ban,_that.author,_that.popular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord,  String cover,  int ban,  List<CmAuthor> author,  int popular)  $default,) {final _that = this;
switch (_that) {
case _CmComicItem():
return $default(_that.name,_that.alias,_that.pathWord,_that.cover,_that.ban,_that.author,_that.popular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord,  String cover,  int ban,  List<CmAuthor> author,  int popular)?  $default,) {final _that = this;
switch (_that) {
case _CmComicItem() when $default != null:
return $default(_that.name,_that.alias,_that.pathWord,_that.cover,_that.ban,_that.author,_that.popular);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmComicItem implements CmComicItem {
  const _CmComicItem({required this.name, this.alias, @JsonKey(name: 'path_word') required this.pathWord, required this.cover, this.ban = 0,  List<CmAuthor> author = const [], this.popular = 0}): _author = author;
  factory _CmComicItem.fromJson(Map<String, dynamic> json) => _$CmComicItemFromJson(json);

@override final  String name;
@override final  String? alias;
@override@JsonKey(name: 'path_word') final  String pathWord;
@override final  String cover;
@override@JsonKey() final  int ban;
 final  List<CmAuthor> _author;
@override@JsonKey() List<CmAuthor> get author {
  if (_author is EqualUnmodifiableListView) return _author;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_author);
}

@override@JsonKey() final  int popular;

/// Create a copy of CmComicItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmComicItemCopyWith<_CmComicItem> get copyWith => __$CmComicItemCopyWithImpl<_CmComicItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmComicItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmComicItem&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.ban, ban) || other.ban == ban)&&const DeepCollectionEquality().equals(other._author, _author)&&(identical(other.popular, popular) || other.popular == popular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,alias,pathWord,cover,ban,const DeepCollectionEquality().hash(_author),popular);

@override
String toString() {
  return 'CmComicItem(name: $name, alias: $alias, pathWord: $pathWord, cover: $cover, ban: $ban, author: $author, popular: $popular)';
}


}

/// @nodoc
abstract mixin class _$CmComicItemCopyWith<$Res> implements $CmComicItemCopyWith<$Res> {
  factory _$CmComicItemCopyWith(_CmComicItem value, $Res Function(_CmComicItem) _then) = __$CmComicItemCopyWithImpl;
@override @useResult
$Res call({
 String name, String? alias,@JsonKey(name: 'path_word') String pathWord, String cover, int ban, List<CmAuthor> author, int popular
});




}
/// @nodoc
class __$CmComicItemCopyWithImpl<$Res>
    implements _$CmComicItemCopyWith<$Res> {
  __$CmComicItemCopyWithImpl(this._self, this._then);

  final _CmComicItem _self;
  final $Res Function(_CmComicItem) _then;

/// Create a copy of CmComicItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? alias = freezed,Object? pathWord = null,Object? cover = null,Object? ban = null,Object? author = null,Object? popular = null,}) {
  return _then(_CmComicItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,ban: null == ban ? _self.ban : ban // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self._author : author // ignore: cast_nullable_to_non_nullable
as List<CmAuthor>,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CmExploreResult {

 List<CmComicItem> get list; int get total; int get limit; int get offset;
/// Create a copy of CmExploreResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmExploreResultCopyWith<CmExploreResult> get copyWith => _$CmExploreResultCopyWithImpl<CmExploreResult>(this as CmExploreResult, _$identity);

  /// Serializes this CmExploreResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmExploreResult&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,limit,offset);

@override
String toString() {
  return 'CmExploreResult(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $CmExploreResultCopyWith<$Res>  {
  factory $CmExploreResultCopyWith(CmExploreResult value, $Res Function(CmExploreResult) _then) = _$CmExploreResultCopyWithImpl;
@useResult
$Res call({
 List<CmComicItem> list, int total, int limit, int offset
});




}
/// @nodoc
class _$CmExploreResultCopyWithImpl<$Res>
    implements $CmExploreResultCopyWith<$Res> {
  _$CmExploreResultCopyWithImpl(this._self, this._then);

  final CmExploreResult _self;
  final $Res Function(CmExploreResult) _then;

/// Create a copy of CmExploreResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(CmExploreResult(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<CmComicItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CmExploreResult].
extension CmExploreResultPatterns on CmExploreResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmExploreResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmExploreResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmExploreResult value)  $default,){
final _that = this;
switch (_that) {
case _CmExploreResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmExploreResult value)?  $default,){
final _that = this;
switch (_that) {
case _CmExploreResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CmComicItem> list,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmExploreResult() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CmComicItem> list,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _CmExploreResult():
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CmComicItem> list,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _CmExploreResult() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmExploreResult implements CmExploreResult {
  const _CmExploreResult({ List<CmComicItem> list = const [], this.total = 0, this.limit = 0, this.offset = 0}): _list = list;
  factory _CmExploreResult.fromJson(Map<String, dynamic> json) => _$CmExploreResultFromJson(json);

 final  List<CmComicItem> _list;
@override@JsonKey() List<CmComicItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;

/// Create a copy of CmExploreResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmExploreResultCopyWith<_CmExploreResult> get copyWith => __$CmExploreResultCopyWithImpl<_CmExploreResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmExploreResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmExploreResult&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,limit,offset);

@override
String toString() {
  return 'CmExploreResult(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$CmExploreResultCopyWith<$Res> implements $CmExploreResultCopyWith<$Res> {
  factory _$CmExploreResultCopyWith(_CmExploreResult value, $Res Function(_CmExploreResult) _then) = __$CmExploreResultCopyWithImpl;
@override @useResult
$Res call({
 List<CmComicItem> list, int total, int limit, int offset
});




}
/// @nodoc
class __$CmExploreResultCopyWithImpl<$Res>
    implements _$CmExploreResultCopyWith<$Res> {
  __$CmExploreResultCopyWithImpl(this._self, this._then);

  final _CmExploreResult _self;
  final $Res Function(_CmExploreResult) _then;

/// Create a copy of CmExploreResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_CmExploreResult(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<CmComicItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CmSearchResult {

 List<CmComicItem> get list; int get total; int get limit; int get offset;
/// Create a copy of CmSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmSearchResultCopyWith<CmSearchResult> get copyWith => _$CmSearchResultCopyWithImpl<CmSearchResult>(this as CmSearchResult, _$identity);

  /// Serializes this CmSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmSearchResult&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,limit,offset);

@override
String toString() {
  return 'CmSearchResult(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $CmSearchResultCopyWith<$Res>  {
  factory $CmSearchResultCopyWith(CmSearchResult value, $Res Function(CmSearchResult) _then) = _$CmSearchResultCopyWithImpl;
@useResult
$Res call({
 List<CmComicItem> list, int total, int limit, int offset
});




}
/// @nodoc
class _$CmSearchResultCopyWithImpl<$Res>
    implements $CmSearchResultCopyWith<$Res> {
  _$CmSearchResultCopyWithImpl(this._self, this._then);

  final CmSearchResult _self;
  final $Res Function(CmSearchResult) _then;

/// Create a copy of CmSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(CmSearchResult(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<CmComicItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CmSearchResult].
extension CmSearchResultPatterns on CmSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _CmSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _CmSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CmComicItem> list,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmSearchResult() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CmComicItem> list,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _CmSearchResult():
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CmComicItem> list,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _CmSearchResult() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmSearchResult implements CmSearchResult {
  const _CmSearchResult({ List<CmComicItem> list = const [], this.total = 0, this.limit = 0, this.offset = 0}): _list = list;
  factory _CmSearchResult.fromJson(Map<String, dynamic> json) => _$CmSearchResultFromJson(json);

 final  List<CmComicItem> _list;
@override@JsonKey() List<CmComicItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;

/// Create a copy of CmSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmSearchResultCopyWith<_CmSearchResult> get copyWith => __$CmSearchResultCopyWithImpl<_CmSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmSearchResult&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,limit,offset);

@override
String toString() {
  return 'CmSearchResult(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$CmSearchResultCopyWith<$Res> implements $CmSearchResultCopyWith<$Res> {
  factory _$CmSearchResultCopyWith(_CmSearchResult value, $Res Function(_CmSearchResult) _then) = __$CmSearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<CmComicItem> list, int total, int limit, int offset
});




}
/// @nodoc
class __$CmSearchResultCopyWithImpl<$Res>
    implements _$CmSearchResultCopyWith<$Res> {
  __$CmSearchResultCopyWithImpl(this._self, this._then);

  final _CmSearchResult _self;
  final $Res Function(_CmSearchResult) _then;

/// Create a copy of CmSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_CmSearchResult(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<CmComicItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CmComicDetailItem {

 String get name; String? get alias;@JsonKey(name: 'path_word') String get pathWord; String get cover; List<CmAuthor> get author; List<CmTheme> get theme; String? get brief;@JsonKey(name: 'datetime_updated') String? get datetimeUpdated; dynamic get status;
/// Create a copy of CmComicDetailItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmComicDetailItemCopyWith<CmComicDetailItem> get copyWith => _$CmComicDetailItemCopyWithImpl<CmComicDetailItem>(this as CmComicDetailItem, _$identity);

  /// Serializes this CmComicDetailItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmComicDetailItem&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.author, author)&&const DeepCollectionEquality().equals(other.theme, theme)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&const DeepCollectionEquality().equals(other.status, status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,alias,pathWord,cover,const DeepCollectionEquality().hash(author),const DeepCollectionEquality().hash(theme),brief,datetimeUpdated,const DeepCollectionEquality().hash(status));

@override
String toString() {
  return 'CmComicDetailItem(name: $name, alias: $alias, pathWord: $pathWord, cover: $cover, author: $author, theme: $theme, brief: $brief, datetimeUpdated: $datetimeUpdated, status: $status)';
}


}

/// @nodoc
abstract mixin class $CmComicDetailItemCopyWith<$Res>  {
  factory $CmComicDetailItemCopyWith(CmComicDetailItem value, $Res Function(CmComicDetailItem) _then) = _$CmComicDetailItemCopyWithImpl;
@useResult
$Res call({
 String name, String? alias,@JsonKey(name: 'path_word') String pathWord, String cover, List<CmAuthor> author, List<CmTheme> theme, String? brief,@JsonKey(name: 'datetime_updated') String? datetimeUpdated, dynamic status
});




}
/// @nodoc
class _$CmComicDetailItemCopyWithImpl<$Res>
    implements $CmComicDetailItemCopyWith<$Res> {
  _$CmComicDetailItemCopyWithImpl(this._self, this._then);

  final CmComicDetailItem _self;
  final $Res Function(CmComicDetailItem) _then;

/// Create a copy of CmComicDetailItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? alias = freezed,Object? pathWord = null,Object? cover = null,Object? author = null,Object? theme = null,Object? brief = freezed,Object? datetimeUpdated = freezed,Object? status = freezed,}) {
  return _then(CmComicDetailItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as List<CmAuthor>,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as List<CmTheme>,brief: freezed == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String?,datetimeUpdated: freezed == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [CmComicDetailItem].
extension CmComicDetailItemPatterns on CmComicDetailItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmComicDetailItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmComicDetailItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmComicDetailItem value)  $default,){
final _that = this;
switch (_that) {
case _CmComicDetailItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmComicDetailItem value)?  $default,){
final _that = this;
switch (_that) {
case _CmComicDetailItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord,  String cover,  List<CmAuthor> author,  List<CmTheme> theme,  String? brief, @JsonKey(name: 'datetime_updated')  String? datetimeUpdated,  dynamic status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmComicDetailItem() when $default != null:
return $default(_that.name,_that.alias,_that.pathWord,_that.cover,_that.author,_that.theme,_that.brief,_that.datetimeUpdated,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord,  String cover,  List<CmAuthor> author,  List<CmTheme> theme,  String? brief, @JsonKey(name: 'datetime_updated')  String? datetimeUpdated,  dynamic status)  $default,) {final _that = this;
switch (_that) {
case _CmComicDetailItem():
return $default(_that.name,_that.alias,_that.pathWord,_that.cover,_that.author,_that.theme,_that.brief,_that.datetimeUpdated,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? alias, @JsonKey(name: 'path_word')  String pathWord,  String cover,  List<CmAuthor> author,  List<CmTheme> theme,  String? brief, @JsonKey(name: 'datetime_updated')  String? datetimeUpdated,  dynamic status)?  $default,) {final _that = this;
switch (_that) {
case _CmComicDetailItem() when $default != null:
return $default(_that.name,_that.alias,_that.pathWord,_that.cover,_that.author,_that.theme,_that.brief,_that.datetimeUpdated,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmComicDetailItem implements CmComicDetailItem {
  const _CmComicDetailItem({required this.name, this.alias, @JsonKey(name: 'path_word') required this.pathWord, required this.cover,  List<CmAuthor> author = const [],  List<CmTheme> theme = const [], this.brief, @JsonKey(name: 'datetime_updated') this.datetimeUpdated, this.status}): _author = author,_theme = theme;
  factory _CmComicDetailItem.fromJson(Map<String, dynamic> json) => _$CmComicDetailItemFromJson(json);

@override final  String name;
@override final  String? alias;
@override@JsonKey(name: 'path_word') final  String pathWord;
@override final  String cover;
 final  List<CmAuthor> _author;
@override@JsonKey() List<CmAuthor> get author {
  if (_author is EqualUnmodifiableListView) return _author;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_author);
}

 final  List<CmTheme> _theme;
@override@JsonKey() List<CmTheme> get theme {
  if (_theme is EqualUnmodifiableListView) return _theme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_theme);
}

@override final  String? brief;
@override@JsonKey(name: 'datetime_updated') final  String? datetimeUpdated;
@override final  dynamic status;

/// Create a copy of CmComicDetailItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmComicDetailItemCopyWith<_CmComicDetailItem> get copyWith => __$CmComicDetailItemCopyWithImpl<_CmComicDetailItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmComicDetailItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmComicDetailItem&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._author, _author)&&const DeepCollectionEquality().equals(other._theme, _theme)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&const DeepCollectionEquality().equals(other.status, status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,alias,pathWord,cover,const DeepCollectionEquality().hash(_author),const DeepCollectionEquality().hash(_theme),brief,datetimeUpdated,const DeepCollectionEquality().hash(status));

@override
String toString() {
  return 'CmComicDetailItem(name: $name, alias: $alias, pathWord: $pathWord, cover: $cover, author: $author, theme: $theme, brief: $brief, datetimeUpdated: $datetimeUpdated, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CmComicDetailItemCopyWith<$Res> implements $CmComicDetailItemCopyWith<$Res> {
  factory _$CmComicDetailItemCopyWith(_CmComicDetailItem value, $Res Function(_CmComicDetailItem) _then) = __$CmComicDetailItemCopyWithImpl;
@override @useResult
$Res call({
 String name, String? alias,@JsonKey(name: 'path_word') String pathWord, String cover, List<CmAuthor> author, List<CmTheme> theme, String? brief,@JsonKey(name: 'datetime_updated') String? datetimeUpdated, dynamic status
});




}
/// @nodoc
class __$CmComicDetailItemCopyWithImpl<$Res>
    implements _$CmComicDetailItemCopyWith<$Res> {
  __$CmComicDetailItemCopyWithImpl(this._self, this._then);

  final _CmComicDetailItem _self;
  final $Res Function(_CmComicDetailItem) _then;

/// Create a copy of CmComicDetailItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? alias = freezed,Object? pathWord = null,Object? cover = null,Object? author = null,Object? theme = null,Object? brief = freezed,Object? datetimeUpdated = freezed,Object? status = freezed,}) {
  return _then(_CmComicDetailItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self._author : author // ignore: cast_nullable_to_non_nullable
as List<CmAuthor>,theme: null == theme ? _self._theme : theme // ignore: cast_nullable_to_non_nullable
as List<CmTheme>,brief: freezed == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String?,datetimeUpdated: freezed == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$CmDetailResult {

 CmComicDetailItem get comic;
/// Create a copy of CmDetailResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmDetailResultCopyWith<CmDetailResult> get copyWith => _$CmDetailResultCopyWithImpl<CmDetailResult>(this as CmDetailResult, _$identity);

  /// Serializes this CmDetailResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmDetailResult&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comic);

@override
String toString() {
  return 'CmDetailResult(comic: $comic)';
}


}

/// @nodoc
abstract mixin class $CmDetailResultCopyWith<$Res>  {
  factory $CmDetailResultCopyWith(CmDetailResult value, $Res Function(CmDetailResult) _then) = _$CmDetailResultCopyWithImpl;
@useResult
$Res call({
 CmComicDetailItem comic
});


$CmComicDetailItemCopyWith<$Res> get comic;

}
/// @nodoc
class _$CmDetailResultCopyWithImpl<$Res>
    implements $CmDetailResultCopyWith<$Res> {
  _$CmDetailResultCopyWithImpl(this._self, this._then);

  final CmDetailResult _self;
  final $Res Function(CmDetailResult) _then;

/// Create a copy of CmDetailResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comic = null,}) {
  return _then(CmDetailResult(
comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as CmComicDetailItem,
  ));
}
/// Create a copy of CmDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CmComicDetailItemCopyWith<$Res> get comic {
  
  return $CmComicDetailItemCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [CmDetailResult].
extension CmDetailResultPatterns on CmDetailResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmDetailResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmDetailResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmDetailResult value)  $default,){
final _that = this;
switch (_that) {
case _CmDetailResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmDetailResult value)?  $default,){
final _that = this;
switch (_that) {
case _CmDetailResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CmComicDetailItem comic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmDetailResult() when $default != null:
return $default(_that.comic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CmComicDetailItem comic)  $default,) {final _that = this;
switch (_that) {
case _CmDetailResult():
return $default(_that.comic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CmComicDetailItem comic)?  $default,) {final _that = this;
switch (_that) {
case _CmDetailResult() when $default != null:
return $default(_that.comic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmDetailResult implements CmDetailResult {
  const _CmDetailResult({required this.comic});
  factory _CmDetailResult.fromJson(Map<String, dynamic> json) => _$CmDetailResultFromJson(json);

@override final  CmComicDetailItem comic;

/// Create a copy of CmDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmDetailResultCopyWith<_CmDetailResult> get copyWith => __$CmDetailResultCopyWithImpl<_CmDetailResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmDetailResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmDetailResult&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comic);

@override
String toString() {
  return 'CmDetailResult(comic: $comic)';
}


}

/// @nodoc
abstract mixin class _$CmDetailResultCopyWith<$Res> implements $CmDetailResultCopyWith<$Res> {
  factory _$CmDetailResultCopyWith(_CmDetailResult value, $Res Function(_CmDetailResult) _then) = __$CmDetailResultCopyWithImpl;
@override @useResult
$Res call({
 CmComicDetailItem comic
});


@override $CmComicDetailItemCopyWith<$Res> get comic;

}
/// @nodoc
class __$CmDetailResultCopyWithImpl<$Res>
    implements _$CmDetailResultCopyWith<$Res> {
  __$CmDetailResultCopyWithImpl(this._self, this._then);

  final _CmDetailResult _self;
  final $Res Function(_CmDetailResult) _then;

/// Create a copy of CmDetailResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comic = null,}) {
  return _then(_CmDetailResult(
comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as CmComicDetailItem,
  ));
}

/// Create a copy of CmDetailResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CmComicDetailItemCopyWith<$Res> get comic {
  
  return $CmComicDetailItemCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$CmChapterItem {

 String get uuid; String get name; int? get size;@JsonKey(name: 'datetime_created') String? get datetimeCreated;
/// Create a copy of CmChapterItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmChapterItemCopyWith<CmChapterItem> get copyWith => _$CmChapterItemCopyWithImpl<CmChapterItem>(this as CmChapterItem, _$identity);

  /// Serializes this CmChapterItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmChapterItem&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,name,size,datetimeCreated);

@override
String toString() {
  return 'CmChapterItem(uuid: $uuid, name: $name, size: $size, datetimeCreated: $datetimeCreated)';
}


}

/// @nodoc
abstract mixin class $CmChapterItemCopyWith<$Res>  {
  factory $CmChapterItemCopyWith(CmChapterItem value, $Res Function(CmChapterItem) _then) = _$CmChapterItemCopyWithImpl;
@useResult
$Res call({
 String uuid, String name, int? size,@JsonKey(name: 'datetime_created') String? datetimeCreated
});




}
/// @nodoc
class _$CmChapterItemCopyWithImpl<$Res>
    implements $CmChapterItemCopyWith<$Res> {
  _$CmChapterItemCopyWithImpl(this._self, this._then);

  final CmChapterItem _self;
  final $Res Function(CmChapterItem) _then;

/// Create a copy of CmChapterItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? name = null,Object? size = freezed,Object? datetimeCreated = freezed,}) {
  return _then(CmChapterItem(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,datetimeCreated: freezed == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CmChapterItem].
extension CmChapterItemPatterns on CmChapterItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmChapterItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmChapterItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmChapterItem value)  $default,){
final _that = this;
switch (_that) {
case _CmChapterItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmChapterItem value)?  $default,){
final _that = this;
switch (_that) {
case _CmChapterItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  String name,  int? size, @JsonKey(name: 'datetime_created')  String? datetimeCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmChapterItem() when $default != null:
return $default(_that.uuid,_that.name,_that.size,_that.datetimeCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  String name,  int? size, @JsonKey(name: 'datetime_created')  String? datetimeCreated)  $default,) {final _that = this;
switch (_that) {
case _CmChapterItem():
return $default(_that.uuid,_that.name,_that.size,_that.datetimeCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  String name,  int? size, @JsonKey(name: 'datetime_created')  String? datetimeCreated)?  $default,) {final _that = this;
switch (_that) {
case _CmChapterItem() when $default != null:
return $default(_that.uuid,_that.name,_that.size,_that.datetimeCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmChapterItem implements CmChapterItem {
  const _CmChapterItem({required this.uuid, required this.name, this.size, @JsonKey(name: 'datetime_created') this.datetimeCreated});
  factory _CmChapterItem.fromJson(Map<String, dynamic> json) => _$CmChapterItemFromJson(json);

@override final  String uuid;
@override final  String name;
@override final  int? size;
@override@JsonKey(name: 'datetime_created') final  String? datetimeCreated;

/// Create a copy of CmChapterItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmChapterItemCopyWith<_CmChapterItem> get copyWith => __$CmChapterItemCopyWithImpl<_CmChapterItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmChapterItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmChapterItem&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,name,size,datetimeCreated);

@override
String toString() {
  return 'CmChapterItem(uuid: $uuid, name: $name, size: $size, datetimeCreated: $datetimeCreated)';
}


}

/// @nodoc
abstract mixin class _$CmChapterItemCopyWith<$Res> implements $CmChapterItemCopyWith<$Res> {
  factory _$CmChapterItemCopyWith(_CmChapterItem value, $Res Function(_CmChapterItem) _then) = __$CmChapterItemCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String name, int? size,@JsonKey(name: 'datetime_created') String? datetimeCreated
});




}
/// @nodoc
class __$CmChapterItemCopyWithImpl<$Res>
    implements _$CmChapterItemCopyWith<$Res> {
  __$CmChapterItemCopyWithImpl(this._self, this._then);

  final _CmChapterItem _self;
  final $Res Function(_CmChapterItem) _then;

/// Create a copy of CmChapterItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? name = null,Object? size = freezed,Object? datetimeCreated = freezed,}) {
  return _then(_CmChapterItem(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,datetimeCreated: freezed == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CmChapterListResult {

 List<CmChapterItem> get list; int get total;
/// Create a copy of CmChapterListResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmChapterListResultCopyWith<CmChapterListResult> get copyWith => _$CmChapterListResultCopyWithImpl<CmChapterListResult>(this as CmChapterListResult, _$identity);

  /// Serializes this CmChapterListResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmChapterListResult&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total);

@override
String toString() {
  return 'CmChapterListResult(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class $CmChapterListResultCopyWith<$Res>  {
  factory $CmChapterListResultCopyWith(CmChapterListResult value, $Res Function(CmChapterListResult) _then) = _$CmChapterListResultCopyWithImpl;
@useResult
$Res call({
 List<CmChapterItem> list, int total
});




}
/// @nodoc
class _$CmChapterListResultCopyWithImpl<$Res>
    implements $CmChapterListResultCopyWith<$Res> {
  _$CmChapterListResultCopyWithImpl(this._self, this._then);

  final CmChapterListResult _self;
  final $Res Function(CmChapterListResult) _then;

/// Create a copy of CmChapterListResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,}) {
  return _then(CmChapterListResult(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<CmChapterItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CmChapterListResult].
extension CmChapterListResultPatterns on CmChapterListResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmChapterListResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmChapterListResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmChapterListResult value)  $default,){
final _that = this;
switch (_that) {
case _CmChapterListResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmChapterListResult value)?  $default,){
final _that = this;
switch (_that) {
case _CmChapterListResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CmChapterItem> list,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmChapterListResult() when $default != null:
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CmChapterItem> list,  int total)  $default,) {final _that = this;
switch (_that) {
case _CmChapterListResult():
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CmChapterItem> list,  int total)?  $default,) {final _that = this;
switch (_that) {
case _CmChapterListResult() when $default != null:
return $default(_that.list,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmChapterListResult implements CmChapterListResult {
  const _CmChapterListResult({ List<CmChapterItem> list = const [], this.total = 0}): _list = list;
  factory _CmChapterListResult.fromJson(Map<String, dynamic> json) => _$CmChapterListResultFromJson(json);

 final  List<CmChapterItem> _list;
@override@JsonKey() List<CmChapterItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int total;

/// Create a copy of CmChapterListResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmChapterListResultCopyWith<_CmChapterListResult> get copyWith => __$CmChapterListResultCopyWithImpl<_CmChapterListResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmChapterListResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmChapterListResult&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total);

@override
String toString() {
  return 'CmChapterListResult(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CmChapterListResultCopyWith<$Res> implements $CmChapterListResultCopyWith<$Res> {
  factory _$CmChapterListResultCopyWith(_CmChapterListResult value, $Res Function(_CmChapterListResult) _then) = __$CmChapterListResultCopyWithImpl;
@override @useResult
$Res call({
 List<CmChapterItem> list, int total
});




}
/// @nodoc
class __$CmChapterListResultCopyWithImpl<$Res>
    implements _$CmChapterListResultCopyWith<$Res> {
  __$CmChapterListResultCopyWithImpl(this._self, this._then);

  final _CmChapterListResult _self;
  final $Res Function(_CmChapterListResult) _then;

/// Create a copy of CmChapterListResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,}) {
  return _then(_CmChapterListResult(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<CmChapterItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CmImageItem {

 String get url;
/// Create a copy of CmImageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmImageItemCopyWith<CmImageItem> get copyWith => _$CmImageItemCopyWithImpl<CmImageItem>(this as CmImageItem, _$identity);

  /// Serializes this CmImageItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmImageItem&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'CmImageItem(url: $url)';
}


}

/// @nodoc
abstract mixin class $CmImageItemCopyWith<$Res>  {
  factory $CmImageItemCopyWith(CmImageItem value, $Res Function(CmImageItem) _then) = _$CmImageItemCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$CmImageItemCopyWithImpl<$Res>
    implements $CmImageItemCopyWith<$Res> {
  _$CmImageItemCopyWithImpl(this._self, this._then);

  final CmImageItem _self;
  final $Res Function(CmImageItem) _then;

/// Create a copy of CmImageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(CmImageItem(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CmImageItem].
extension CmImageItemPatterns on CmImageItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmImageItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmImageItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmImageItem value)  $default,){
final _that = this;
switch (_that) {
case _CmImageItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmImageItem value)?  $default,){
final _that = this;
switch (_that) {
case _CmImageItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmImageItem() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _CmImageItem():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _CmImageItem() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmImageItem implements CmImageItem {
  const _CmImageItem({required this.url});
  factory _CmImageItem.fromJson(Map<String, dynamic> json) => _$CmImageItemFromJson(json);

@override final  String url;

/// Create a copy of CmImageItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmImageItemCopyWith<_CmImageItem> get copyWith => __$CmImageItemCopyWithImpl<_CmImageItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmImageItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmImageItem&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'CmImageItem(url: $url)';
}


}

/// @nodoc
abstract mixin class _$CmImageItemCopyWith<$Res> implements $CmImageItemCopyWith<$Res> {
  factory _$CmImageItemCopyWith(_CmImageItem value, $Res Function(_CmImageItem) _then) = __$CmImageItemCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$CmImageItemCopyWithImpl<$Res>
    implements _$CmImageItemCopyWith<$Res> {
  __$CmImageItemCopyWithImpl(this._self, this._then);

  final _CmImageItem _self;
  final $Res Function(_CmImageItem) _then;

/// Create a copy of CmImageItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_CmImageItem(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CmChapterImageInner {

 List<CmImageItem> get contents; List<int> get words;
/// Create a copy of CmChapterImageInner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmChapterImageInnerCopyWith<CmChapterImageInner> get copyWith => _$CmChapterImageInnerCopyWithImpl<CmChapterImageInner>(this as CmChapterImageInner, _$identity);

  /// Serializes this CmChapterImageInner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmChapterImageInner&&const DeepCollectionEquality().equals(other.contents, contents)&&const DeepCollectionEquality().equals(other.words, words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contents),const DeepCollectionEquality().hash(words));

@override
String toString() {
  return 'CmChapterImageInner(contents: $contents, words: $words)';
}


}

/// @nodoc
abstract mixin class $CmChapterImageInnerCopyWith<$Res>  {
  factory $CmChapterImageInnerCopyWith(CmChapterImageInner value, $Res Function(CmChapterImageInner) _then) = _$CmChapterImageInnerCopyWithImpl;
@useResult
$Res call({
 List<CmImageItem> contents, List<int> words
});




}
/// @nodoc
class _$CmChapterImageInnerCopyWithImpl<$Res>
    implements $CmChapterImageInnerCopyWith<$Res> {
  _$CmChapterImageInnerCopyWithImpl(this._self, this._then);

  final CmChapterImageInner _self;
  final $Res Function(CmChapterImageInner) _then;

/// Create a copy of CmChapterImageInner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contents = null,Object? words = null,}) {
  return _then(CmChapterImageInner(
contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<CmImageItem>,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [CmChapterImageInner].
extension CmChapterImageInnerPatterns on CmChapterImageInner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmChapterImageInner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmChapterImageInner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmChapterImageInner value)  $default,){
final _that = this;
switch (_that) {
case _CmChapterImageInner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmChapterImageInner value)?  $default,){
final _that = this;
switch (_that) {
case _CmChapterImageInner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CmImageItem> contents,  List<int> words)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmChapterImageInner() when $default != null:
return $default(_that.contents,_that.words);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CmImageItem> contents,  List<int> words)  $default,) {final _that = this;
switch (_that) {
case _CmChapterImageInner():
return $default(_that.contents,_that.words);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CmImageItem> contents,  List<int> words)?  $default,) {final _that = this;
switch (_that) {
case _CmChapterImageInner() when $default != null:
return $default(_that.contents,_that.words);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmChapterImageInner implements CmChapterImageInner {
  const _CmChapterImageInner({ List<CmImageItem> contents = const [],  List<int> words = const []}): _contents = contents,_words = words;
  factory _CmChapterImageInner.fromJson(Map<String, dynamic> json) => _$CmChapterImageInnerFromJson(json);

 final  List<CmImageItem> _contents;
@override@JsonKey() List<CmImageItem> get contents {
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contents);
}

 final  List<int> _words;
@override@JsonKey() List<int> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}


/// Create a copy of CmChapterImageInner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmChapterImageInnerCopyWith<_CmChapterImageInner> get copyWith => __$CmChapterImageInnerCopyWithImpl<_CmChapterImageInner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmChapterImageInnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmChapterImageInner&&const DeepCollectionEquality().equals(other._contents, _contents)&&const DeepCollectionEquality().equals(other._words, _words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contents),const DeepCollectionEquality().hash(_words));

@override
String toString() {
  return 'CmChapterImageInner(contents: $contents, words: $words)';
}


}

/// @nodoc
abstract mixin class _$CmChapterImageInnerCopyWith<$Res> implements $CmChapterImageInnerCopyWith<$Res> {
  factory _$CmChapterImageInnerCopyWith(_CmChapterImageInner value, $Res Function(_CmChapterImageInner) _then) = __$CmChapterImageInnerCopyWithImpl;
@override @useResult
$Res call({
 List<CmImageItem> contents, List<int> words
});




}
/// @nodoc
class __$CmChapterImageInnerCopyWithImpl<$Res>
    implements _$CmChapterImageInnerCopyWith<$Res> {
  __$CmChapterImageInnerCopyWithImpl(this._self, this._then);

  final _CmChapterImageInner _self;
  final $Res Function(_CmChapterImageInner) _then;

/// Create a copy of CmChapterImageInner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contents = null,Object? words = null,}) {
  return _then(_CmChapterImageInner(
contents: null == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<CmImageItem>,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$CmChapterImageResult {

 CmChapterImageInner? get chapter;
/// Create a copy of CmChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmChapterImageResultCopyWith<CmChapterImageResult> get copyWith => _$CmChapterImageResultCopyWithImpl<CmChapterImageResult>(this as CmChapterImageResult, _$identity);

  /// Serializes this CmChapterImageResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmChapterImageResult&&(identical(other.chapter, chapter) || other.chapter == chapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter);

@override
String toString() {
  return 'CmChapterImageResult(chapter: $chapter)';
}


}

/// @nodoc
abstract mixin class $CmChapterImageResultCopyWith<$Res>  {
  factory $CmChapterImageResultCopyWith(CmChapterImageResult value, $Res Function(CmChapterImageResult) _then) = _$CmChapterImageResultCopyWithImpl;
@useResult
$Res call({
 CmChapterImageInner? chapter
});


$CmChapterImageInnerCopyWith<$Res>? get chapter;

}
/// @nodoc
class _$CmChapterImageResultCopyWithImpl<$Res>
    implements $CmChapterImageResultCopyWith<$Res> {
  _$CmChapterImageResultCopyWithImpl(this._self, this._then);

  final CmChapterImageResult _self;
  final $Res Function(CmChapterImageResult) _then;

/// Create a copy of CmChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapter = freezed,}) {
  return _then(CmChapterImageResult(
chapter: freezed == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as CmChapterImageInner?,
  ));
}
/// Create a copy of CmChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CmChapterImageInnerCopyWith<$Res>? get chapter {
    if (_self.chapter == null) {
    return null;
  }

  return $CmChapterImageInnerCopyWith<$Res>(_self.chapter!, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// Adds pattern-matching-related methods to [CmChapterImageResult].
extension CmChapterImageResultPatterns on CmChapterImageResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmChapterImageResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmChapterImageResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmChapterImageResult value)  $default,){
final _that = this;
switch (_that) {
case _CmChapterImageResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmChapterImageResult value)?  $default,){
final _that = this;
switch (_that) {
case _CmChapterImageResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CmChapterImageInner? chapter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmChapterImageResult() when $default != null:
return $default(_that.chapter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CmChapterImageInner? chapter)  $default,) {final _that = this;
switch (_that) {
case _CmChapterImageResult():
return $default(_that.chapter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CmChapterImageInner? chapter)?  $default,) {final _that = this;
switch (_that) {
case _CmChapterImageResult() when $default != null:
return $default(_that.chapter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmChapterImageResult implements CmChapterImageResult {
  const _CmChapterImageResult({this.chapter});
  factory _CmChapterImageResult.fromJson(Map<String, dynamic> json) => _$CmChapterImageResultFromJson(json);

@override final  CmChapterImageInner? chapter;

/// Create a copy of CmChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmChapterImageResultCopyWith<_CmChapterImageResult> get copyWith => __$CmChapterImageResultCopyWithImpl<_CmChapterImageResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmChapterImageResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmChapterImageResult&&(identical(other.chapter, chapter) || other.chapter == chapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter);

@override
String toString() {
  return 'CmChapterImageResult(chapter: $chapter)';
}


}

/// @nodoc
abstract mixin class _$CmChapterImageResultCopyWith<$Res> implements $CmChapterImageResultCopyWith<$Res> {
  factory _$CmChapterImageResultCopyWith(_CmChapterImageResult value, $Res Function(_CmChapterImageResult) _then) = __$CmChapterImageResultCopyWithImpl;
@override @useResult
$Res call({
 CmChapterImageInner? chapter
});


@override $CmChapterImageInnerCopyWith<$Res>? get chapter;

}
/// @nodoc
class __$CmChapterImageResultCopyWithImpl<$Res>
    implements _$CmChapterImageResultCopyWith<$Res> {
  __$CmChapterImageResultCopyWithImpl(this._self, this._then);

  final _CmChapterImageResult _self;
  final $Res Function(_CmChapterImageResult) _then;

/// Create a copy of CmChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapter = freezed,}) {
  return _then(_CmChapterImageResult(
chapter: freezed == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as CmChapterImageInner?,
  ));
}

/// Create a copy of CmChapterImageResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CmChapterImageInnerCopyWith<$Res>? get chapter {
    if (_self.chapter == null) {
    return null;
  }

  return $CmChapterImageInnerCopyWith<$Res>(_self.chapter!, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}

// dart format on
