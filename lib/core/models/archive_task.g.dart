// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterTask _$ChapterTaskFromJson(Map<String, dynamic> json) => _ChapterTask(
  chapterId: json['chapter_id'] as String,
  title: json['title'] as String,
  status: json['status'] as String? ?? 'queued',
  totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
  downloadedPages: (json['downloaded_pages'] as num?)?.toInt() ?? 0,
  errorMessage: json['error_message'] as String?,
);

Map<String, dynamic> _$ChapterTaskToJson(_ChapterTask instance) =>
    <String, dynamic>{
      'chapter_id': instance.chapterId,
      'title': instance.title,
      'status': instance.status,
      'total_pages': instance.totalPages,
      'downloaded_pages': instance.downloadedPages,
      'error_message': instance.errorMessage,
    };

_ArchiveTask _$ArchiveTaskFromJson(Map<String, dynamic> json) => _ArchiveTask(
  taskId: json['task_id'] as String,
  providerId: json['provider_id'] as String,
  comicId: json['comic_id'] as String,
  comicTitle: json['comic_title'] as String? ?? '',
  coverUrl: json['cover_url'] as String? ?? '',
  status: json['status'] as String? ?? 'queued',
  chapters:
      (json['chapters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ChapterTask.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  errorMessage: json['error_message'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ArchiveTaskToJson(_ArchiveTask instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'provider_id': instance.providerId,
      'comic_id': instance.comicId,
      'comic_title': instance.comicTitle,
      'cover_url': instance.coverUrl,
      'status': instance.status,
      'chapters': instance.chapters,
      'error_message': instance.errorMessage,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
