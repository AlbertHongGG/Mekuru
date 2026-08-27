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
mixin _$ChapterTask {

@JsonKey(name: 'chapter_id') String get chapterId; String get title; String get status;@JsonKey(name: 'total_pages') int get totalPages;@JsonKey(name: 'downloaded_pages') int get downloadedPages;@JsonKey(name: 'error_message') String? get errorMessage;
/// Create a copy of ChapterTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterTaskCopyWith<ChapterTask> get copyWith => _$ChapterTaskCopyWithImpl<ChapterTask>(this as ChapterTask, _$identity);

  /// Serializes this ChapterTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterTask&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.downloadedPages, downloadedPages) || other.downloadedPages == downloadedPages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapterId,title,status,totalPages,downloadedPages,errorMessage);

@override
String toString() {
  return 'ChapterTask(chapterId: $chapterId, title: $title, status: $status, totalPages: $totalPages, downloadedPages: $downloadedPages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ChapterTaskCopyWith<$Res>  {
  factory $ChapterTaskCopyWith(ChapterTask value, $Res Function(ChapterTask) _then) = _$ChapterTaskCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'chapter_id') String chapterId, String title, String status,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'downloaded_pages') int downloadedPages,@JsonKey(name: 'error_message') String? errorMessage
});




}
/// @nodoc
class _$ChapterTaskCopyWithImpl<$Res>
    implements $ChapterTaskCopyWith<$Res> {
  _$ChapterTaskCopyWithImpl(this._self, this._then);

  final ChapterTask _self;
  final $Res Function(ChapterTask) _then;

/// Create a copy of ChapterTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapterId = null,Object? title = null,Object? status = null,Object? totalPages = null,Object? downloadedPages = null,Object? errorMessage = freezed,}) {
  return _then(ChapterTask(
chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,downloadedPages: null == downloadedPages ? _self.downloadedPages : downloadedPages // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterTask].
extension ChapterTaskPatterns on ChapterTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterTask value)  $default,){
final _that = this;
switch (_that) {
case _ChapterTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterTask value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'chapter_id')  String chapterId,  String title,  String status, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'downloaded_pages')  int downloadedPages, @JsonKey(name: 'error_message')  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterTask() when $default != null:
return $default(_that.chapterId,_that.title,_that.status,_that.totalPages,_that.downloadedPages,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'chapter_id')  String chapterId,  String title,  String status, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'downloaded_pages')  int downloadedPages, @JsonKey(name: 'error_message')  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ChapterTask():
return $default(_that.chapterId,_that.title,_that.status,_that.totalPages,_that.downloadedPages,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'chapter_id')  String chapterId,  String title,  String status, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'downloaded_pages')  int downloadedPages, @JsonKey(name: 'error_message')  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChapterTask() when $default != null:
return $default(_that.chapterId,_that.title,_that.status,_that.totalPages,_that.downloadedPages,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterTask implements ChapterTask {
  const _ChapterTask({@JsonKey(name: 'chapter_id') required this.chapterId, required this.title, this.status = 'queued', @JsonKey(name: 'total_pages') this.totalPages = 0, @JsonKey(name: 'downloaded_pages') this.downloadedPages = 0, @JsonKey(name: 'error_message') this.errorMessage});
  factory _ChapterTask.fromJson(Map<String, dynamic> json) => _$ChapterTaskFromJson(json);

@override@JsonKey(name: 'chapter_id') final  String chapterId;
@override final  String title;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'total_pages') final  int totalPages;
@override@JsonKey(name: 'downloaded_pages') final  int downloadedPages;
@override@JsonKey(name: 'error_message') final  String? errorMessage;

/// Create a copy of ChapterTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterTaskCopyWith<_ChapterTask> get copyWith => __$ChapterTaskCopyWithImpl<_ChapterTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterTaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterTask&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.downloadedPages, downloadedPages) || other.downloadedPages == downloadedPages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapterId,title,status,totalPages,downloadedPages,errorMessage);

@override
String toString() {
  return 'ChapterTask(chapterId: $chapterId, title: $title, status: $status, totalPages: $totalPages, downloadedPages: $downloadedPages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ChapterTaskCopyWith<$Res> implements $ChapterTaskCopyWith<$Res> {
  factory _$ChapterTaskCopyWith(_ChapterTask value, $Res Function(_ChapterTask) _then) = __$ChapterTaskCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'chapter_id') String chapterId, String title, String status,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'downloaded_pages') int downloadedPages,@JsonKey(name: 'error_message') String? errorMessage
});




}
/// @nodoc
class __$ChapterTaskCopyWithImpl<$Res>
    implements _$ChapterTaskCopyWith<$Res> {
  __$ChapterTaskCopyWithImpl(this._self, this._then);

  final _ChapterTask _self;
  final $Res Function(_ChapterTask) _then;

/// Create a copy of ChapterTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapterId = null,Object? title = null,Object? status = null,Object? totalPages = null,Object? downloadedPages = null,Object? errorMessage = freezed,}) {
  return _then(_ChapterTask(
chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,downloadedPages: null == downloadedPages ? _self.downloadedPages : downloadedPages // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ArchiveTask {

@JsonKey(name: 'task_id') String get taskId;@JsonKey(name: 'provider_id') String get providerId;@JsonKey(name: 'comic_id') String get comicId;@JsonKey(name: 'comic_title') String get comicTitle;@JsonKey(name: 'cover_url') String get coverUrl; String get status; Map<String, ChapterTask> get chapters;@JsonKey(name: 'error_message') String? get errorMessage;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ArchiveTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveTaskCopyWith<ArchiveTask> get copyWith => _$ArchiveTaskCopyWithImpl<ArchiveTask>(this as ArchiveTask, _$identity);

  /// Serializes this ArchiveTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.comicTitle, comicTitle) || other.comicTitle == comicTitle)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,providerId,comicId,comicTitle,coverUrl,status,const DeepCollectionEquality().hash(chapters),errorMessage,createdAt,updatedAt);

@override
String toString() {
  return 'ArchiveTask(taskId: $taskId, providerId: $providerId, comicId: $comicId, comicTitle: $comicTitle, coverUrl: $coverUrl, status: $status, chapters: $chapters, errorMessage: $errorMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ArchiveTaskCopyWith<$Res>  {
  factory $ArchiveTaskCopyWith(ArchiveTask value, $Res Function(ArchiveTask) _then) = _$ArchiveTaskCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'task_id') String taskId,@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId,@JsonKey(name: 'comic_title') String comicTitle,@JsonKey(name: 'cover_url') String coverUrl, String status, Map<String, ChapterTask> chapters,@JsonKey(name: 'error_message') String? errorMessage,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? providerId = null,Object? comicId = null,Object? comicTitle = null,Object? coverUrl = null,Object? status = null,Object? chapters = null,Object? errorMessage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ArchiveTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,comicTitle: null == comicTitle ? _self.comicTitle : comicTitle // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as Map<String, ChapterTask>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId, @JsonKey(name: 'comic_title')  String comicTitle, @JsonKey(name: 'cover_url')  String coverUrl,  String status,  Map<String, ChapterTask> chapters, @JsonKey(name: 'error_message')  String? errorMessage, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchiveTask() when $default != null:
return $default(_that.taskId,_that.providerId,_that.comicId,_that.comicTitle,_that.coverUrl,_that.status,_that.chapters,_that.errorMessage,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId, @JsonKey(name: 'comic_title')  String comicTitle, @JsonKey(name: 'cover_url')  String coverUrl,  String status,  Map<String, ChapterTask> chapters, @JsonKey(name: 'error_message')  String? errorMessage, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ArchiveTask():
return $default(_that.taskId,_that.providerId,_that.comicId,_that.comicTitle,_that.coverUrl,_that.status,_that.chapters,_that.errorMessage,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'task_id')  String taskId, @JsonKey(name: 'provider_id')  String providerId, @JsonKey(name: 'comic_id')  String comicId, @JsonKey(name: 'comic_title')  String comicTitle, @JsonKey(name: 'cover_url')  String coverUrl,  String status,  Map<String, ChapterTask> chapters, @JsonKey(name: 'error_message')  String? errorMessage, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ArchiveTask() when $default != null:
return $default(_that.taskId,_that.providerId,_that.comicId,_that.comicTitle,_that.coverUrl,_that.status,_that.chapters,_that.errorMessage,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArchiveTask extends ArchiveTask {
  const _ArchiveTask({@JsonKey(name: 'task_id') required this.taskId, @JsonKey(name: 'provider_id') required this.providerId, @JsonKey(name: 'comic_id') required this.comicId, @JsonKey(name: 'comic_title') this.comicTitle = '', @JsonKey(name: 'cover_url') this.coverUrl = '', this.status = 'queued',  Map<String, ChapterTask> chapters = const {}, @JsonKey(name: 'error_message') this.errorMessage, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _chapters = chapters,super._();
  factory _ArchiveTask.fromJson(Map<String, dynamic> json) => _$ArchiveTaskFromJson(json);

@override@JsonKey(name: 'task_id') final  String taskId;
@override@JsonKey(name: 'provider_id') final  String providerId;
@override@JsonKey(name: 'comic_id') final  String comicId;
@override@JsonKey(name: 'comic_title') final  String comicTitle;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override@JsonKey() final  String status;
 final  Map<String, ChapterTask> _chapters;
@override@JsonKey() Map<String, ChapterTask> get chapters {
  if (_chapters is EqualUnmodifiableMapView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_chapters);
}

@override@JsonKey(name: 'error_message') final  String? errorMessage;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchiveTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.comicTitle, comicTitle) || other.comicTitle == comicTitle)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,providerId,comicId,comicTitle,coverUrl,status,const DeepCollectionEquality().hash(_chapters),errorMessage,createdAt,updatedAt);

@override
String toString() {
  return 'ArchiveTask(taskId: $taskId, providerId: $providerId, comicId: $comicId, comicTitle: $comicTitle, coverUrl: $coverUrl, status: $status, chapters: $chapters, errorMessage: $errorMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ArchiveTaskCopyWith<$Res> implements $ArchiveTaskCopyWith<$Res> {
  factory _$ArchiveTaskCopyWith(_ArchiveTask value, $Res Function(_ArchiveTask) _then) = __$ArchiveTaskCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'task_id') String taskId,@JsonKey(name: 'provider_id') String providerId,@JsonKey(name: 'comic_id') String comicId,@JsonKey(name: 'comic_title') String comicTitle,@JsonKey(name: 'cover_url') String coverUrl, String status, Map<String, ChapterTask> chapters,@JsonKey(name: 'error_message') String? errorMessage,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? providerId = null,Object? comicId = null,Object? comicTitle = null,Object? coverUrl = null,Object? status = null,Object? chapters = null,Object? errorMessage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ArchiveTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,comicTitle: null == comicTitle ? _self.comicTitle : comicTitle // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as Map<String, ChapterTask>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
