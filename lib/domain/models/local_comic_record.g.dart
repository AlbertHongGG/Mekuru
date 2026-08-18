// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_comic_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalComicRecord _$LocalComicRecordFromJson(Map<String, dynamic> json) =>
    _LocalComicRecord(
      id: json['id'] as String,
      dataSourceMode: json['dataSourceMode'] as String,
      providerId: json['providerId'] as String,
      comicId: json['comicId'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      lastReadChapterId: json['lastReadChapterId'] as String?,
      lastReadChapterTitle: json['lastReadChapterTitle'] as String?,
      lastReadPageIndex: (json['lastReadPageIndex'] as num?)?.toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      favoriteAt: json['favoriteAt'] == null
          ? null
          : DateTime.parse(json['favoriteAt'] as String),
    );

Map<String, dynamic> _$LocalComicRecordToJson(_LocalComicRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dataSourceMode': instance.dataSourceMode,
      'providerId': instance.providerId,
      'comicId': instance.comicId,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
      'isFavorite': instance.isFavorite,
      'lastReadChapterId': instance.lastReadChapterId,
      'lastReadChapterTitle': instance.lastReadChapterTitle,
      'lastReadPageIndex': instance.lastReadPageIndex,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'favoriteAt': instance.favoriteAt?.toIso8601String(),
    };
