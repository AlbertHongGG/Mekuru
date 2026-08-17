// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArchiveTask {

@JsonKey(name: 'task_id') String get taskId;@JsonKey(name: 'provider_id') String get providerId;@JsonKey(name: 'comic_id') String get comicId; String? get status; double get progress;
/// Create a copy of ArchiveTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveTaskCopyWith<ArchiveTask> get copyWith => _$ArchiveTaskCopyWithImpl<ArchiveTask>(this as ArchiveTask, _$identity);

  /// Serializes this ArchiveTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,providerId,comicId,status,progress);

@override
String toString() {
  return 'ArchiveTask(taskId: $taskId, providerId: $providerId, comicId: $comicId, status: $status, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $ArchiveTaskCopyWith<$Res>  {
  factory $ArchiveTaskCopyWith(ArchiveTask value, $Res Function(ArchiveTask) _then) = _$ArchiveTaskCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'task_id') String taskId,@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId, String? status, double progress
});




}
/// @nodoc
class _$ArchiveTaskCopyWithImpl<$Res>
    implements $ArchiveTaskCopyWith<$Res> {
  _$ArchiveTaskCopyWithImpl(this._self, this._then);

  final ArchiveTask _self;
  final $Res Function(ArchiveTask) _then;

/// Create a copy of ArchiveTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? providerId = null,Object? comicId = null,Object? status = freezed,Object? progress = null,}) {
  return _then(ArchiveTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchiveTask].
extension ArchiveTaskPatterns on ArchiveTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchiveTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchiveTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchiveTask value)  $default,){
final _that = this;
switch (_that) {
case _ArchiveTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchiveTask value)?  $default,){
final _that = this;
switch (_that) {
case _ArchiveTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId,  String? status,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchiveTask() when $default != null:
return $default(_that.taskId,_that.providerId,_that.comicId,_that.status,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId,  String? status,  double progress)  $default,) {final _that = this;
switch (_that) {
case _ArchiveTask():
return $default(_that.taskId,_that.providerId,_that.comicId,_that.status,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId,  String? status,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _ArchiveTask() when $default != null:
return $default(_that.taskId,_that.providerId,_that.comicId,_that.status,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArchiveTask implements ArchiveTask {
  const _ArchiveTask({@JsonKey(name: 'task_id') required this.taskId, @JsonKey(name: 'provider_id') required this.providerId, @JsonKey(name: 'comic_id') required this.comicId, this.status, this.progress = 0.0});
  factory _ArchiveTask.fromJson(Map<String, dynamic> json) => _$ArchiveTaskFromJson(json);

@override@JsonKey(name: 'task_id') final  String taskId;
@override@JsonKey(name: 'provider_id') final  String providerId;
@override@JsonKey(name: 'comic_id') final  String comicId;
@override final  String? status;
@override@JsonKey() final  double progress;

/// Create a copy of ArchiveTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchiveTaskCopyWith<_ArchiveTask> get copyWith => __$ArchiveTaskCopyWithImpl<_ArchiveTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArchiveTaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchiveTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,providerId,comicId,status,progress);

@override
String toString() {
  return 'ArchiveTask(taskId: $taskId, providerId: $providerId, comicId: $comicId, status: $status, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$ArchiveTaskCopyWith<$Res> implements $ArchiveTaskCopyWith<$Res> {
  factory _$ArchiveTaskCopyWith(_ArchiveTask value, $Res Function(_ArchiveTask) _then) = __$ArchiveTaskCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'task_id') String taskId,@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId, String? status, double progress
});




}
/// @nodoc
class __$ArchiveTaskCopyWithImpl<$Res>
    implements _$ArchiveTaskCopyWith<$Res> {
  __$ArchiveTaskCopyWithImpl(this._self, this._then);

  final _ArchiveTask _self;
  final $Res Function(_ArchiveTask) _then;

/// Create a copy of ArchiveTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? providerId = null,Object? comicId = null,Object? status = freezed,Object? progress = null,}) {
  return _then(_ArchiveTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
