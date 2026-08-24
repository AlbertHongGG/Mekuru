// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArchiveTask _$ArchiveTaskFromJson(Map<String, dynamic> json) => _ArchiveTask(
  taskId: json['task_id'] as String,
  providerId: json['provider_id'] as String,
  comicId: json['comic_id'] as String,
  status: json['status'] as String?,
  progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ArchiveTaskToJson(_ArchiveTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'provider_id': instance.providerId,
      'comic_id': instance.comicId,
      'status': instance.status,
      'progress': instance.progress,
    };
