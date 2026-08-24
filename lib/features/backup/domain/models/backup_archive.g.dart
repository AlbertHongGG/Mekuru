// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BackupArchive _$BackupArchiveFromJson(Map<String, dynamic> json) =>
    _BackupArchive(
      version: (json['version'] as num).toInt(),
      exportedAt: DateTime.parse(json['exportedAt'] as String),
      metadataList:
          (json['metadataList'] as List<dynamic>?)
              ?.map(
                (e) => ComicMetadataEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      favoritesMap:
          (json['favoritesMap'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, FavoriteEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      historyMap:
          (json['historyMap'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, HistoryEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$BackupArchiveToJson(_BackupArchive instance) =>
    <String, dynamic>{
      'version': instance.version,
      'exportedAt': instance.exportedAt.toIso8601String(),
      'metadataList': instance.metadataList,
      'favoritesMap': instance.favoritesMap,
      'historyMap': instance.historyMap,
    };
