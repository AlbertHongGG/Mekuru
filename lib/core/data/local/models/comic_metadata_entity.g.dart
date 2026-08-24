// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_metadata_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicMetadataEntity _$ComicMetadataEntityFromJson(Map<String, dynamic> json) =>
    _ComicMetadataEntity(
      id: json['id'] as String,
      dataSourceMode: $enumDecode(
        _$DataSourceModeEnumMap,
        json['dataSourceMode'],
      ),
      providerId: json['providerId'] as String,
      comicId: json['comicId'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      sourceUpdatedAt: json['sourceUpdatedAt'] == null
          ? null
          : DateTime.parse(json['sourceUpdatedAt'] as String),
      totalChapters: (json['totalChapters'] as num?)?.toInt(),
      latestChapterTitle: json['latestChapterTitle'] as String?,
    );

Map<String, dynamic> _$ComicMetadataEntityToJson(
  _ComicMetadataEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'dataSourceMode': _$DataSourceModeEnumMap[instance.dataSourceMode]!,
  'providerId': instance.providerId,
  'comicId': instance.comicId,
  'title': instance.title,
  'coverUrl': instance.coverUrl,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'sourceUpdatedAt': instance.sourceUpdatedAt?.toIso8601String(),
  'totalChapters': instance.totalChapters,
  'latestChapterTitle': instance.latestChapterTitle,
};

const _$DataSourceModeEnumMap = {
  DataSourceMode.source: 'source',
  DataSourceMode.db: 'db',
};
