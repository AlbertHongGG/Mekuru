// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comic _$ComicFromJson(Map<String, dynamic> json) => _Comic(
  comicId: json['id'] as String?,
  providerId: json['provider_id'] as String?,
  title: json['title'] as String?,
  coverUrl: json['cover_url'] as String?,
  description: json['description'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  status: json['update_status'] as String?,
);

Map<String, dynamic> _$ComicToJson(_Comic instance) => <String, dynamic>{
  'id': instance.comicId,
  'provider_id': instance.providerId,
  'title': instance.title,
  'cover_url': instance.coverUrl,
  'description': instance.description,
  'tags': instance.tags,
  'update_status': instance.status,
};
