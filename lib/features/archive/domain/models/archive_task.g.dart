// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterTask _$ChapterTaskFromJson(Map<String, dynamic> json) => _ChapterTask(
  chapterId: json['chapterId'] as String,
  title: json['title'] as String,
  status:
      $enumDecodeNullable(_$ArchiveTaskStatusEnumMap, json['status']) ??
      ArchiveTaskStatus.queued,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  downloadedPages: (json['downloadedPages'] as num?)?.toInt() ?? 0,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$ChapterTaskToJson(_ChapterTask instance) =>
    <String, dynamic>{
      'chapterId': instance.chapterId,
      'title': instance.title,
      'status': _$ArchiveTaskStatusEnumMap[instance.status]!,
      'totalPages': instance.totalPages,
      'downloadedPages': instance.downloadedPages,
      'errorMessage': instance.errorMessage,
    };

const _$ArchiveTaskStatusEnumMap = {
  ArchiveTaskStatus.queued: 'queued',
  ArchiveTaskStatus.downloading: 'downloading',
  ArchiveTaskStatus.paused: 'paused',
  ArchiveTaskStatus.completed: 'completed',
  ArchiveTaskStatus.error: 'error',
};

_ArchiveTask _$ArchiveTaskFromJson(Map<String, dynamic> json) => _ArchiveTask(
  providerId: json['providerId'] as String,
  comicId: json['comicId'] as String,
  comicTitle: json['comicTitle'] as String? ?? '',
  coverUrl: json['coverUrl'] as String? ?? '',
  status:
      $enumDecodeNullable(_$ArchiveTaskStatusEnumMap, json['status']) ??
      ArchiveTaskStatus.queued,
  chapters:
      (json['chapters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ChapterTask.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  errorMessage: json['errorMessage'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ArchiveTaskToJson(_ArchiveTask instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'comicId': instance.comicId,
      'comicTitle': instance.comicTitle,
      'coverUrl': instance.coverUrl,
      'status': _$ArchiveTaskStatusEnumMap[instance.status]!,
      'chapters': instance.chapters,
      'errorMessage': instance.errorMessage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
