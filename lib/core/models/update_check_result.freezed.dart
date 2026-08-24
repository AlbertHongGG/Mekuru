// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_check_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateCheckResult {

 bool get hasNew; int get newTotal; DateTime? get newSourceUpdatedAt; String? get newLatestTitle;
/// Create a copy of UpdateCheckResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCheckResultCopyWith<UpdateCheckResult> get copyWith => _$UpdateCheckResultCopyWithImpl<UpdateCheckResult>(this as UpdateCheckResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCheckResult&&(identical(other.hasNew, hasNew) || other.hasNew == hasNew)&&(identical(other.newTotal, newTotal) || other.newTotal == newTotal)&&(identical(other.newSourceUpdatedAt, newSourceUpdatedAt) || other.newSourceUpdatedAt == newSourceUpdatedAt)&&(identical(other.newLatestTitle, newLatestTitle) || other.newLatestTitle == newLatestTitle));
}


@override
int get hashCode => Object.hash(runtimeType,hasNew,newTotal,newSourceUpdatedAt,newLatestTitle);

@override
String toString() {
  return 'UpdateCheckResult(hasNew: $hasNew, newTotal: $newTotal, newSourceUpdatedAt: $newSourceUpdatedAt, newLatestTitle: $newLatestTitle)';
}


}

/// @nodoc
abstract mixin class $UpdateCheckResultCopyWith<$Res>  {
  factory $UpdateCheckResultCopyWith(UpdateCheckResult value, $Res Function(UpdateCheckResult) _then) = _$UpdateCheckResultCopyWithImpl;
@useResult
$Res call({
 bool hasNew, int newTotal, DateTime? newSourceUpdatedAt, String? newLatestTitle
});




}
/// @nodoc
class _$UpdateCheckResultCopyWithImpl<$Res>
    implements $UpdateCheckResultCopyWith<$Res> {
  _$UpdateCheckResultCopyWithImpl(this._self, this._then);

  final UpdateCheckResult _self;
  final $Res Function(UpdateCheckResult) _then;

/// Create a copy of UpdateCheckResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasNew = null,Object? newTotal = null,Object? newSourceUpdatedAt = freezed,Object? newLatestTitle = freezed,}) {
  return _then(UpdateCheckResult(
hasNew: null == hasNew ? _self.hasNew : hasNew // ignore: cast_nullable_to_non_nullable
as bool,newTotal: null == newTotal ? _self.newTotal : newTotal // ignore: cast_nullable_to_non_nullable
as int,newSourceUpdatedAt: freezed == newSourceUpdatedAt ? _self.newSourceUpdatedAt : newSourceUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,newLatestTitle: freezed == newLatestTitle ? _self.newLatestTitle : newLatestTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCheckResult].
extension UpdateCheckResultPatterns on UpdateCheckResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCheckResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCheckResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCheckResult value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCheckResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCheckResult value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCheckResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasNew,  int newTotal,  DateTime? newSourceUpdatedAt,  String? newLatestTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCheckResult() when $default != null:
return $default(_that.hasNew,_that.newTotal,_that.newSourceUpdatedAt,_that.newLatestTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasNew,  int newTotal,  DateTime? newSourceUpdatedAt,  String? newLatestTitle)  $default,) {final _that = this;
switch (_that) {
case _UpdateCheckResult():
return $default(_that.hasNew,_that.newTotal,_that.newSourceUpdatedAt,_that.newLatestTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasNew,  int newTotal,  DateTime? newSourceUpdatedAt,  String? newLatestTitle)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCheckResult() when $default != null:
return $default(_that.hasNew,_that.newTotal,_that.newSourceUpdatedAt,_that.newLatestTitle);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateCheckResult implements UpdateCheckResult {
  const _UpdateCheckResult({required this.hasNew, required this.newTotal, this.newSourceUpdatedAt, this.newLatestTitle});
  

@override final  bool hasNew;
@override final  int newTotal;
@override final  DateTime? newSourceUpdatedAt;
@override final  String? newLatestTitle;

/// Create a copy of UpdateCheckResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCheckResultCopyWith<_UpdateCheckResult> get copyWith => __$UpdateCheckResultCopyWithImpl<_UpdateCheckResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCheckResult&&(identical(other.hasNew, hasNew) || other.hasNew == hasNew)&&(identical(other.newTotal, newTotal) || other.newTotal == newTotal)&&(identical(other.newSourceUpdatedAt, newSourceUpdatedAt) || other.newSourceUpdatedAt == newSourceUpdatedAt)&&(identical(other.newLatestTitle, newLatestTitle) || other.newLatestTitle == newLatestTitle));
}


@override
int get hashCode => Object.hash(runtimeType,hasNew,newTotal,newSourceUpdatedAt,newLatestTitle);

@override
String toString() {
  return 'UpdateCheckResult(hasNew: $hasNew, newTotal: $newTotal, newSourceUpdatedAt: $newSourceUpdatedAt, newLatestTitle: $newLatestTitle)';
}


}

/// @nodoc
abstract mixin class _$UpdateCheckResultCopyWith<$Res> implements $UpdateCheckResultCopyWith<$Res> {
  factory _$UpdateCheckResultCopyWith(_UpdateCheckResult value, $Res Function(_UpdateCheckResult) _then) = __$UpdateCheckResultCopyWithImpl;
@override @useResult
$Res call({
 bool hasNew, int newTotal, DateTime? newSourceUpdatedAt, String? newLatestTitle
});




}
/// @nodoc
class __$UpdateCheckResultCopyWithImpl<$Res>
    implements _$UpdateCheckResultCopyWith<$Res> {
  __$UpdateCheckResultCopyWithImpl(this._self, this._then);

  final _UpdateCheckResult _self;
  final $Res Function(_UpdateCheckResult) _then;

/// Create a copy of UpdateCheckResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasNew = null,Object? newTotal = null,Object? newSourceUpdatedAt = freezed,Object? newLatestTitle = freezed,}) {
  return _then(_UpdateCheckResult(
hasNew: null == hasNew ? _self.hasNew : hasNew // ignore: cast_nullable_to_non_nullable
as bool,newTotal: null == newTotal ? _self.newTotal : newTotal // ignore: cast_nullable_to_non_nullable
as int,newSourceUpdatedAt: freezed == newSourceUpdatedAt ? _self.newSourceUpdatedAt : newSourceUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,newLatestTitle: freezed == newLatestTitle ? _self.newLatestTitle : newLatestTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
