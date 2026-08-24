// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryEntity _$HistoryEntityFromJson(Map<String, dynamic> json) =>
    _HistoryEntity(
      comicId: json['comicId'] as String,
      lastReadChapterId: json['lastReadChapterId'] as String,
      lastReadChapterTitle: json['lastReadChapterTitle'] as String,
      lastReadPageIndex: (json['lastReadPageIndex'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      readChapterIds:
          (json['readChapterIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HistoryEntityToJson(_HistoryEntity instance) =>
    <String, dynamic>{
      'comicId': instance.comicId,
      'lastReadChapterId': instance.lastReadChapterId,
      'lastReadChapterTitle': instance.lastReadChapterTitle,
      'lastReadPageIndex': instance.lastReadPageIndex,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'readChapterIds': instance.readChapterIds,
    };
