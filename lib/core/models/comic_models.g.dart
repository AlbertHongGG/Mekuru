// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicDetail _$ComicDetailFromJson(Map<String, dynamic> json) => _ComicDetail(
  comicId: json['id'] as String,
  providerId: json['provider_id'] as String,
  title: json['title'] as String,
  coverUrl: json['cover_url'] as String,
  author: json['author'] as String? ?? '未知作者',
  description: json['description'] as String,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  status: json['update_status'] as String? ?? '',
);

Map<String, dynamic> _$ComicDetailToJson(_ComicDetail instance) =>
    <String, dynamic>{
      'id': instance.comicId,
      'provider_id': instance.providerId,
      'title': instance.title,
      'cover_url': instance.coverUrl,
      'author': instance.author,
      'description': instance.description,
      'tags': instance.tags,
      'update_status': instance.status,
    };

_ComicExploreResult _$ComicExploreResultFromJson(Map<String, dynamic> json) =>
    _ComicExploreResult(
      comicId: json['id'] as String,
      providerId: json['provider_id'] as String,
      title: json['title'] as String,
      coverUrl: json['cover_url'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$ComicExploreResultToJson(_ComicExploreResult instance) =>
    <String, dynamic>{
      'id': instance.comicId,
      'provider_id': instance.providerId,
      'title': instance.title,
      'cover_url': instance.coverUrl,
      'tags': instance.tags,
    };

_ComicSearchResult _$ComicSearchResultFromJson(Map<String, dynamic> json) =>
    _ComicSearchResult(
      comicId: json['id'] as String,
      providerId: json['provider_id'] as String,
      title: json['title'] as String?,
      coverUrl: json['cover_url'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$ComicSearchResultToJson(_ComicSearchResult instance) =>
    <String, dynamic>{
      'id': instance.comicId,
      'provider_id': instance.providerId,
      'title': instance.title,
      'cover_url': instance.coverUrl,
      'tags': instance.tags,
    };
