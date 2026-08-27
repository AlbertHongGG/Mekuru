// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_comic_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalComicEntity _$LocalComicEntityFromJson(Map<String, dynamic> json) =>
    _LocalComicEntity(
      providerId: json['providerId'] as String,
      comicId: json['comicId'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      author: json['author'] as String? ?? '',
      description: json['description'] as String? ?? '',
      chapterIds:
          (json['chapterIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      archivedAt: DateTime.parse(json['archivedAt'] as String),
    );

Map<String, dynamic> _$LocalComicEntityToJson(_LocalComicEntity instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'comicId': instance.comicId,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
      'tags': instance.tags,
      'author': instance.author,
      'description': instance.description,
      'chapterIds': instance.chapterIds,
      'archivedAt': instance.archivedAt.toIso8601String(),
    };
