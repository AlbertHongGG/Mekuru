// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copymg_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CopyMGResponse<T> _$CopyMGResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _CopyMGResponse<T>(
  code: (json['code'] as num?)?.toInt() ?? 200,
  message: json['message'] as String? ?? '',
  results: _$nullableGenericFromJson(json['results'], fromJsonT),
);

Map<String, dynamic> _$CopyMGResponseToJson<T>(
  _CopyMGResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'results': _$nullableGenericToJson(instance.results, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_CmAuthor _$CmAuthorFromJson(Map<String, dynamic> json) => _CmAuthor(
  name: json['name'] as String,
  alias: json['alias'] as String?,
  pathWord: json['path_word'] as String,
);

Map<String, dynamic> _$CmAuthorToJson(_CmAuthor instance) => <String, dynamic>{
  'name': instance.name,
  'alias': instance.alias,
  'path_word': instance.pathWord,
};

_CmTheme _$CmThemeFromJson(Map<String, dynamic> json) => _CmTheme(
  name: json['name'] as String,
  pathWord: json['path_word'] as String,
);

Map<String, dynamic> _$CmThemeToJson(_CmTheme instance) => <String, dynamic>{
  'name': instance.name,
  'path_word': instance.pathWord,
};

_CmComicItem _$CmComicItemFromJson(Map<String, dynamic> json) => _CmComicItem(
  name: json['name'] as String,
  alias: json['alias'] as String?,
  pathWord: json['path_word'] as String,
  cover: json['cover'] as String,
  ban: (json['ban'] as num?)?.toInt() ?? 0,
  author:
      (json['author'] as List<dynamic>?)
          ?.map((e) => CmAuthor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  popular: (json['popular'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CmComicItemToJson(_CmComicItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alias': instance.alias,
      'path_word': instance.pathWord,
      'cover': instance.cover,
      'ban': instance.ban,
      'author': instance.author,
      'popular': instance.popular,
    };

_CmExploreResult _$CmExploreResultFromJson(Map<String, dynamic> json) =>
    _CmExploreResult(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => CmComicItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CmExploreResultToJson(_CmExploreResult instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };

_CmSearchResult _$CmSearchResultFromJson(Map<String, dynamic> json) =>
    _CmSearchResult(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => CmComicItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CmSearchResultToJson(_CmSearchResult instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };

_CmComicDetailItem _$CmComicDetailItemFromJson(Map<String, dynamic> json) =>
    _CmComicDetailItem(
      name: json['name'] as String,
      alias: json['alias'] as String?,
      pathWord: json['path_word'] as String,
      cover: json['cover'] as String,
      author:
          (json['author'] as List<dynamic>?)
              ?.map((e) => CmAuthor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      theme:
          (json['theme'] as List<dynamic>?)
              ?.map((e) => CmTheme.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brief: json['brief'] as String?,
      datetimeUpdated: json['datetime_updated'] as String?,
      status: json['status'],
    );

Map<String, dynamic> _$CmComicDetailItemToJson(_CmComicDetailItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'alias': instance.alias,
      'path_word': instance.pathWord,
      'cover': instance.cover,
      'author': instance.author,
      'theme': instance.theme,
      'brief': instance.brief,
      'datetime_updated': instance.datetimeUpdated,
      'status': instance.status,
    };

_CmDetailResult _$CmDetailResultFromJson(Map<String, dynamic> json) =>
    _CmDetailResult(
      comic: CmComicDetailItem.fromJson(json['comic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CmDetailResultToJson(_CmDetailResult instance) =>
    <String, dynamic>{'comic': instance.comic};

_CmChapterItem _$CmChapterItemFromJson(Map<String, dynamic> json) =>
    _CmChapterItem(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      size: (json['size'] as num?)?.toInt(),
      datetimeCreated: json['datetime_created'] as String?,
    );

Map<String, dynamic> _$CmChapterItemToJson(_CmChapterItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'size': instance.size,
      'datetime_created': instance.datetimeCreated,
    };

_CmChapterListResult _$CmChapterListResultFromJson(Map<String, dynamic> json) =>
    _CmChapterListResult(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => CmChapterItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CmChapterListResultToJson(
  _CmChapterListResult instance,
) => <String, dynamic>{'list': instance.list, 'total': instance.total};

_CmImageItem _$CmImageItemFromJson(Map<String, dynamic> json) =>
    _CmImageItem(url: json['url'] as String);

Map<String, dynamic> _$CmImageItemToJson(_CmImageItem instance) =>
    <String, dynamic>{'url': instance.url};

_CmChapterImageInner _$CmChapterImageInnerFromJson(Map<String, dynamic> json) =>
    _CmChapterImageInner(
      contents:
          (json['contents'] as List<dynamic>?)
              ?.map((e) => CmImageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      words:
          (json['words'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CmChapterImageInnerToJson(
  _CmChapterImageInner instance,
) => <String, dynamic>{'contents': instance.contents, 'words': instance.words};

_CmChapterImageResult _$CmChapterImageResultFromJson(
  Map<String, dynamic> json,
) => _CmChapterImageResult(
  chapter: json['chapter'] == null
      ? null
      : CmChapterImageInner.fromJson(json['chapter'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CmChapterImageResultToJson(
  _CmChapterImageResult instance,
) => <String, dynamic>{'chapter': instance.chapter};
