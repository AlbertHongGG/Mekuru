// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicwf_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CwComicDetail _$CwComicDetailFromJson(Map<String, dynamic> json) =>
    _CwComicDetail(
      id: json['id'] as String,
      name: json['name'] as String?,
      cover: json['cover'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      desc: json['desc'] as String?,
      trace: json['trace'] as String?,
    );

Map<String, dynamic> _$CwComicDetailToJson(_CwComicDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover': instance.cover,
      'tags': instance.tags,
      'desc': instance.desc,
      'trace': instance.trace,
    };

_CwChapterInfo _$CwChapterInfoFromJson(Map<String, dynamic> json) =>
    _CwChapterInfo(
      chapterId: json['chapter_id'],
      chapterName: json['chapter_name'] as String?,
      chapterCover: json['chapter_cover'] as String?,
      createTime: json['create_time'] as String?,
    );

Map<String, dynamic> _$CwChapterInfoToJson(_CwChapterInfo instance) =>
    <String, dynamic>{
      'chapter_id': instance.chapterId,
      'chapter_name': instance.chapterName,
      'chapter_cover': instance.chapterCover,
      'create_time': instance.createTime,
    };

_CwChapterList _$CwChapterListFromJson(Map<String, dynamic> json) =>
    _CwChapterList(
      chapters:
          (json['chapters'] as List<dynamic>?)
              ?.map((e) => CwChapterInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CwChapterListToJson(_CwChapterList instance) =>
    <String, dynamic>{'chapters': instance.chapters, 'total': instance.total};

_CwChapterImage _$CwChapterImageFromJson(Map<String, dynamic> json) =>
    _CwChapterImage(
      url: json['url'] as String,
      height: (json['height'] as num?)?.toInt() ?? 0,
      width: (json['width'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CwChapterImageToJson(_CwChapterImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };

_CwChapterReadData _$CwChapterReadDataFromJson(Map<String, dynamic> json) =>
    _CwChapterReadData(
      imgs:
          (json['imgs'] as List<dynamic>?)
              ?.map((e) => CwChapterImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CwChapterReadDataToJson(_CwChapterReadData instance) =>
    <String, dynamic>{'imgs': instance.imgs};

_CwSearchModuleItem _$CwSearchModuleItemFromJson(Map<String, dynamic> json) =>
    _CwSearchModuleItem(
      id: json['id'] as String,
      name: json['name'] as String,
      cover: json['cover'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      desc: json['desc'] as String? ?? "",
    );

Map<String, dynamic> _$CwSearchModuleItemToJson(_CwSearchModuleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover': instance.cover,
      'tags': instance.tags,
      'desc': instance.desc,
    };

_CwSearchResultItem _$CwSearchResultItemFromJson(Map<String, dynamic> json) =>
    _CwSearchResultItem(
      moduleItem: CwSearchModuleItem.fromJson(
        json['module_item'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CwSearchResultItemToJson(_CwSearchResultItem instance) =>
    <String, dynamic>{'module_item': instance.moduleItem};
