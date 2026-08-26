// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
LogEntry _$LogEntryFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'api':
          return ApiLogEntry.fromJson(
            json
          );
                case 'system':
          return SystemLogEntry.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'LogEntry',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$LogEntry {

 String get id; DateTime get timestamp;
/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogEntryCopyWith<LogEntry> get copyWith => _$LogEntryCopyWithImpl<LogEntry>(this as LogEntry, _$identity);

  /// Serializes this LogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp);

@override
String toString() {
  return 'LogEntry(id: $id, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $LogEntryCopyWith<$Res>  {
  factory $LogEntryCopyWith(LogEntry value, $Res Function(LogEntry) _then) = _$LogEntryCopyWithImpl;
@useResult
$Res call({
 String id, DateTime timestamp
});




}
/// @nodoc
class _$LogEntryCopyWithImpl<$Res>
    implements $LogEntryCopyWith<$Res> {
  _$LogEntryCopyWithImpl(this._self, this._then);

  final LogEntry _self;
  final $Res Function(LogEntry) _then;

/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LogEntry].
extension LogEntryPatterns on LogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiLogEntry value)?  api,TResult Function( SystemLogEntry value)?  system,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiLogEntry() when api != null:
return api(_that);case SystemLogEntry() when system != null:
return system(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiLogEntry value)  api,required TResult Function( SystemLogEntry value)  system,}){
final _that = this;
switch (_that) {
case ApiLogEntry():
return api(_that);case SystemLogEntry():
return system(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiLogEntry value)?  api,TResult? Function( SystemLogEntry value)?  system,}){
final _that = this;
switch (_that) {
case ApiLogEntry() when api != null:
return api(_that);case SystemLogEntry() when system != null:
return system(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  DateTime timestamp,  String method,  String url,  String? providerId,  String? actionType,  Map<String, dynamic> requestHeaders,  dynamic requestBody,  int? statusCode,  Map<String, dynamic>? responseHeaders,  dynamic responseBody,  DateTime? responseTime,  String? error)?  api,TResult Function( String id,  DateTime timestamp,  String eventType,  dynamic data)?  system,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiLogEntry() when api != null:
return api(_that.id,_that.timestamp,_that.method,_that.url,_that.providerId,_that.actionType,_that.requestHeaders,_that.requestBody,_that.statusCode,_that.responseHeaders,_that.responseBody,_that.responseTime,_that.error);case SystemLogEntry() when system != null:
return system(_that.id,_that.timestamp,_that.eventType,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  DateTime timestamp,  String method,  String url,  String? providerId,  String? actionType,  Map<String, dynamic> requestHeaders,  dynamic requestBody,  int? statusCode,  Map<String, dynamic>? responseHeaders,  dynamic responseBody,  DateTime? responseTime,  String? error)  api,required TResult Function( String id,  DateTime timestamp,  String eventType,  dynamic data)  system,}) {final _that = this;
switch (_that) {
case ApiLogEntry():
return api(_that.id,_that.timestamp,_that.method,_that.url,_that.providerId,_that.actionType,_that.requestHeaders,_that.requestBody,_that.statusCode,_that.responseHeaders,_that.responseBody,_that.responseTime,_that.error);case SystemLogEntry():
return system(_that.id,_that.timestamp,_that.eventType,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  DateTime timestamp,  String method,  String url,  String? providerId,  String? actionType,  Map<String, dynamic> requestHeaders,  dynamic requestBody,  int? statusCode,  Map<String, dynamic>? responseHeaders,  dynamic responseBody,  DateTime? responseTime,  String? error)?  api,TResult? Function( String id,  DateTime timestamp,  String eventType,  dynamic data)?  system,}) {final _that = this;
switch (_that) {
case ApiLogEntry() when api != null:
return api(_that.id,_that.timestamp,_that.method,_that.url,_that.providerId,_that.actionType,_that.requestHeaders,_that.requestBody,_that.statusCode,_that.responseHeaders,_that.responseBody,_that.responseTime,_that.error);case SystemLogEntry() when system != null:
return system(_that.id,_that.timestamp,_that.eventType,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ApiLogEntry extends LogEntry {
  const ApiLogEntry({required this.id, required this.timestamp, required this.method, required this.url, this.providerId, this.actionType,  Map<String, dynamic> requestHeaders = const {}, this.requestBody, this.statusCode,  Map<String, dynamic>? responseHeaders, this.responseBody, this.responseTime, this.error,  String? $type}): _requestHeaders = requestHeaders,_responseHeaders = responseHeaders,$type = $type ?? 'api',super._();
  factory ApiLogEntry.fromJson(Map<String, dynamic> json) => _$ApiLogEntryFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  String method;
 final  String url;
 final  String? providerId;
 final  String? actionType;
 final  Map<String, dynamic> _requestHeaders;
@JsonKey() Map<String, dynamic> get requestHeaders {
  if (_requestHeaders is EqualUnmodifiableMapView) return _requestHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_requestHeaders);
}

 final  dynamic requestBody;
 final  int? statusCode;
 final  Map<String, dynamic>? _responseHeaders;
 Map<String, dynamic>? get responseHeaders {
  final value = _responseHeaders;
  if (value == null) return null;
  if (_responseHeaders is EqualUnmodifiableMapView) return _responseHeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  dynamic responseBody;
 final  DateTime? responseTime;
 final  String? error;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiLogEntryCopyWith<ApiLogEntry> get copyWith => _$ApiLogEntryCopyWithImpl<ApiLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.method, method) || other.method == method)&&(identical(other.url, url) || other.url == url)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&const DeepCollectionEquality().equals(other._requestHeaders, _requestHeaders)&&const DeepCollectionEquality().equals(other.requestBody, requestBody)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other._responseHeaders, _responseHeaders)&&const DeepCollectionEquality().equals(other.responseBody, responseBody)&&(identical(other.responseTime, responseTime) || other.responseTime == responseTime)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,method,url,providerId,actionType,const DeepCollectionEquality().hash(_requestHeaders),const DeepCollectionEquality().hash(requestBody),statusCode,const DeepCollectionEquality().hash(_responseHeaders),const DeepCollectionEquality().hash(responseBody),responseTime,error);

@override
String toString() {
  return 'LogEntry.api(id: $id, timestamp: $timestamp, method: $method, url: $url, providerId: $providerId, actionType: $actionType, requestHeaders: $requestHeaders, requestBody: $requestBody, statusCode: $statusCode, responseHeaders: $responseHeaders, responseBody: $responseBody, responseTime: $responseTime, error: $error)';
}


}

/// @nodoc
abstract mixin class $ApiLogEntryCopyWith<$Res> implements $LogEntryCopyWith<$Res> {
  factory $ApiLogEntryCopyWith(ApiLogEntry value, $Res Function(ApiLogEntry) _then) = _$ApiLogEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String method, String url, String? providerId, String? actionType, Map<String, dynamic> requestHeaders, dynamic requestBody, int? statusCode, Map<String, dynamic>? responseHeaders, dynamic responseBody, DateTime? responseTime, String? error
});




}
/// @nodoc
class _$ApiLogEntryCopyWithImpl<$Res>
    implements $ApiLogEntryCopyWith<$Res> {
  _$ApiLogEntryCopyWithImpl(this._self, this._then);

  final ApiLogEntry _self;
  final $Res Function(ApiLogEntry) _then;

/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? method = null,Object? url = null,Object? providerId = freezed,Object? actionType = freezed,Object? requestHeaders = null,Object? requestBody = freezed,Object? statusCode = freezed,Object? responseHeaders = freezed,Object? responseBody = freezed,Object? responseTime = freezed,Object? error = freezed,}) {
  return _then(ApiLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,providerId: freezed == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String?,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,requestHeaders: null == requestHeaders ? _self._requestHeaders : requestHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,requestBody: freezed == requestBody ? _self.requestBody : requestBody // ignore: cast_nullable_to_non_nullable
as dynamic,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,responseHeaders: freezed == responseHeaders ? _self._responseHeaders : responseHeaders // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,responseBody: freezed == responseBody ? _self.responseBody : responseBody // ignore: cast_nullable_to_non_nullable
as dynamic,responseTime: freezed == responseTime ? _self.responseTime : responseTime // ignore: cast_nullable_to_non_nullable
as DateTime?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SystemLogEntry extends LogEntry {
  const SystemLogEntry({required this.id, required this.timestamp, required this.eventType, required this.data,  String? $type}): $type = $type ?? 'system',super._();
  factory SystemLogEntry.fromJson(Map<String, dynamic> json) => _$SystemLogEntryFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  String eventType;
 final  dynamic data;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemLogEntryCopyWith<SystemLogEntry> get copyWith => _$SystemLogEntryCopyWithImpl<SystemLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,eventType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'LogEntry.system(id: $id, timestamp: $timestamp, eventType: $eventType, data: $data)';
}


}

/// @nodoc
abstract mixin class $SystemLogEntryCopyWith<$Res> implements $LogEntryCopyWith<$Res> {
  factory $SystemLogEntryCopyWith(SystemLogEntry value, $Res Function(SystemLogEntry) _then) = _$SystemLogEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String eventType, dynamic data
});




}
/// @nodoc
class _$SystemLogEntryCopyWithImpl<$Res>
    implements $SystemLogEntryCopyWith<$Res> {
  _$SystemLogEntryCopyWithImpl(this._self, this._then);

  final SystemLogEntry _self;
  final $Res Function(SystemLogEntry) _then;

/// Create a copy of LogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? eventType = null,Object? data = freezed,}) {
  return _then(SystemLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
