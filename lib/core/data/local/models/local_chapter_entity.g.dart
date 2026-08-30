// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_chapter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalChapterEntity _$LocalChapterEntityFromJson(Map<String, dynamic> json) =>
    _LocalChapterEntity(
      chapterId: json['chapterId'] as String,
      title: json['title'] as String,
      archivedAt: DateTime.parse(json['archivedAt'] as String),
    );

Map<String, dynamic> _$LocalChapterEntityToJson(_LocalChapterEntity instance) =>
    <String, dynamic>{
      'chapterId': instance.chapterId,
      'title': instance.title,
      'archivedAt': instance.archivedAt.toIso8601String(),
    };
