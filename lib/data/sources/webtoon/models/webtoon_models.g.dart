// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webtoon_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WtAuthor _$WtAuthorFromJson(Map<String, dynamic> json) =>
    _WtAuthor(authorName: json['authorName'] as String);

Map<String, dynamic> _$WtAuthorToJson(_WtAuthor instance) => <String, dynamic>{
  'authorName': instance.authorName,
};

_WtTitle _$WtTitleFromJson(Map<String, dynamic> json) => _WtTitle(
  titleNo: (json['titleNo'] as num).toInt(),
  thumbnailUrl: json['thumbnailUrl'] as String,
);

Map<String, dynamic> _$WtTitleToJson(_WtTitle instance) => <String, dynamic>{
  'titleNo': instance.titleNo,
  'thumbnailUrl': instance.thumbnailUrl,
};

_WtSearchSection _$WtSearchSectionFromJson(Map<String, dynamic> json) =>
    _WtSearchSection(
      titleList:
          (json['titleList'] as List<dynamic>?)
              ?.map((e) => WtTitle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$WtSearchSectionToJson(_WtSearchSection instance) =>
    <String, dynamic>{
      'titleList': instance.titleList,
      'hasMore': instance.hasMore,
    };

_WtSearchResult _$WtSearchResultFromJson(Map<String, dynamic> json) =>
    _WtSearchResult(
      webtoonSearch: WtSearchSection.fromJson(
        json['webtoonSearch'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WtSearchResultToJson(_WtSearchResult instance) =>
    <String, dynamic>{'webtoonSearch': instance.webtoonSearch};

_WtGenre _$WtGenreFromJson(Map<String, dynamic> json) =>
    _WtGenre(displayName: json['displayName'] as String);

Map<String, dynamic> _$WtGenreToJson(_WtGenre instance) => <String, dynamic>{
  'displayName': instance.displayName,
};

_WtChallengeTitleItem _$WtChallengeTitleItemFromJson(
  Map<String, dynamic> json,
) => _WtChallengeTitleItem(
  titleNo: (json['titleNo'] as num).toInt(),
  readingTitle: json['readingTitle'] as String,
  thumbnailImageUrl: json['thumbnailImageUrl'] as String,
  representGenre: json['representGenre'] == null
      ? null
      : WtGenre.fromJson(json['representGenre'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WtChallengeTitleItemToJson(
  _WtChallengeTitleItem instance,
) => <String, dynamic>{
  'titleNo': instance.titleNo,
  'readingTitle': instance.readingTitle,
  'thumbnailImageUrl': instance.thumbnailImageUrl,
  'representGenre': instance.representGenre,
};

_WtChallengeGenreTitleListResult _$WtChallengeGenreTitleListResultFromJson(
  Map<String, dynamic> json,
) => _WtChallengeGenreTitleListResult(
  challengeTitleList:
      (json['challengeTitleList'] as List<dynamic>?)
          ?.map((e) => WtChallengeTitleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$WtChallengeGenreTitleListResultToJson(
  _WtChallengeGenreTitleListResult instance,
) => <String, dynamic>{'challengeTitleList': instance.challengeTitleList};

_WtTitleDetail _$WtTitleDetailFromJson(Map<String, dynamic> json) =>
    _WtTitleDetail(
      titleNo: (json['titleNo'] as num).toInt(),
      title: json['title'] as String,
      synopsis: json['synopsis'] as String,
      posterThumbnailUrl: json['posterThumbnailUrl'] as String,
      authorList:
          (json['authorList'] as List<dynamic>?)
              ?.map((e) => WtAuthor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WtTitleDetailToJson(_WtTitleDetail instance) =>
    <String, dynamic>{
      'titleNo': instance.titleNo,
      'title': instance.title,
      'synopsis': instance.synopsis,
      'posterThumbnailUrl': instance.posterThumbnailUrl,
      'authorList': instance.authorList,
    };

_WtEpisodeMeta _$WtEpisodeMetaFromJson(Map<String, dynamic> json) =>
    _WtEpisodeMeta(
      totalEpisodeCount: (json['totalEpisodeCount'] as num).toInt(),
    );

Map<String, dynamic> _$WtEpisodeMetaToJson(_WtEpisodeMeta instance) =>
    <String, dynamic>{'totalEpisodeCount': instance.totalEpisodeCount};

_WtTagItem _$WtTagItemFromJson(Map<String, dynamic> json) =>
    _WtTagItem(text: json['text'] as String, type: json['type'] as String);

Map<String, dynamic> _$WtTagItemToJson(_WtTagItem instance) =>
    <String, dynamic>{'text': instance.text, 'type': instance.type};

_WtTagInfo _$WtTagInfoFromJson(Map<String, dynamic> json) => _WtTagInfo(
  tagList:
      (json['tagList'] as List<dynamic>?)
          ?.map((e) => WtTagItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$WtTagInfoToJson(_WtTagInfo instance) =>
    <String, dynamic>{'tagList': instance.tagList};

_WtTitleHomeResult _$WtTitleHomeResultFromJson(Map<String, dynamic> json) =>
    _WtTitleHomeResult(
      title: WtTitleDetail.fromJson(json['title'] as Map<String, dynamic>),
      tag: json['tag'] == null
          ? null
          : WtTagInfo.fromJson(json['tag'] as Map<String, dynamic>),
      episodeMeta: WtEpisodeMeta.fromJson(
        json['episodeMeta'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WtTitleHomeResultToJson(_WtTitleHomeResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tag': instance.tag,
      'episodeMeta': instance.episodeMeta,
    };

_WtEpisodeItem _$WtEpisodeItemFromJson(Map<String, dynamic> json) =>
    _WtEpisodeItem(
      episodeNo: (json['episodeNo'] as num).toInt(),
      episodeTitle: json['episodeTitle'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      exposureYmdt: (json['exposureYmdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WtEpisodeItemToJson(_WtEpisodeItem instance) =>
    <String, dynamic>{
      'episodeNo': instance.episodeNo,
      'episodeTitle': instance.episodeTitle,
      'thumbnailUrl': instance.thumbnailUrl,
      'exposureYmdt': instance.exposureYmdt,
    };

_WtEpisodeListResult _$WtEpisodeListResultFromJson(Map<String, dynamic> json) =>
    _WtEpisodeListResult(
      episodeList:
          (json['episodeList'] as List<dynamic>?)
              ?.map((e) => WtEpisodeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$WtEpisodeListResultToJson(
  _WtEpisodeListResult instance,
) => <String, dynamic>{
  'episodeList': instance.episodeList,
  'hasMore': instance.hasMore,
};

_WtImageInfo _$WtImageInfoFromJson(Map<String, dynamic> json) =>
    _WtImageInfo(url: json['url'] as String);

Map<String, dynamic> _$WtImageInfoToJson(_WtImageInfo instance) =>
    <String, dynamic>{'url': instance.url};

_WtEpisodeInfo _$WtEpisodeInfoFromJson(Map<String, dynamic> json) =>
    _WtEpisodeInfo(
      imageInfo:
          (json['imageInfo'] as List<dynamic>?)
              ?.map((e) => WtImageInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WtEpisodeInfoToJson(_WtEpisodeInfo instance) =>
    <String, dynamic>{'imageInfo': instance.imageInfo};

_WtEpisodeInfoResult _$WtEpisodeInfoResultFromJson(Map<String, dynamic> json) =>
    _WtEpisodeInfoResult(
      episodeInfo: WtEpisodeInfo.fromJson(
        json['episodeInfo'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WtEpisodeInfoResultToJson(
  _WtEpisodeInfoResult instance,
) => <String, dynamic>{'episodeInfo': instance.episodeInfo};
