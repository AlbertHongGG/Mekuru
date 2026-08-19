import 'package:freezed_annotation/freezed_annotation.dart';

part 'webtoon_models.freezed.dart';
part 'webtoon_models.g.dart';

// --- Shared ---
@freezed
class WtAuthor with _$WtAuthor {
  const factory WtAuthor({
    required String authorName,
  }) = _WtAuthor;
  factory WtAuthor.fromJson(Map<String, dynamic> json) => _$WtAuthorFromJson(json);
}

// --- Search ---
@freezed
class WtTitle with _$WtTitle {
  const factory WtTitle({
    required int titleNo,
    required String thumbnailUrl,
  }) = _WtTitle;
  factory WtTitle.fromJson(Map<String, dynamic> json) => _$WtTitleFromJson(json);
}

@freezed
class WtSearchSection with _$WtSearchSection {
  const factory WtSearchSection({
    @Default([]) List<WtTitle> titleList,
    @Default(false) bool hasMore,
  }) = _WtSearchSection;
  factory WtSearchSection.fromJson(Map<String, dynamic> json) => _$WtSearchSectionFromJson(json);
}

@freezed
class WtSearchResult with _$WtSearchResult {
  const factory WtSearchResult({
    required WtSearchSection webtoonSearch,
  }) = _WtSearchResult;
  factory WtSearchResult.fromJson(Map<String, dynamic> json) => _$WtSearchResultFromJson(json);
}

// --- Explore ---
@freezed
class WtGenre with _$WtGenre {
  const factory WtGenre({
    required String displayName,
  }) = _WtGenre;
  factory WtGenre.fromJson(Map<String, dynamic> json) => _$WtGenreFromJson(json);
}

@freezed
class WtChallengeTitleItem with _$WtChallengeTitleItem {
  const factory WtChallengeTitleItem({
    required int titleNo,
    required String readingTitle,
    required String thumbnailImageUrl,
    WtGenre? representGenre,
  }) = _WtChallengeTitleItem;
  factory WtChallengeTitleItem.fromJson(Map<String, dynamic> json) => _$WtChallengeTitleItemFromJson(json);
}

@freezed
class WtChallengeGenreTitleListResult with _$WtChallengeGenreTitleListResult {
  const factory WtChallengeGenreTitleListResult({
    @Default([]) List<WtChallengeTitleItem> challengeTitleList,
  }) = _WtChallengeGenreTitleListResult;
  factory WtChallengeGenreTitleListResult.fromJson(Map<String, dynamic> json) => _$WtChallengeGenreTitleListResultFromJson(json);
}

// --- Title Detail ---
@freezed
class WtTitleDetail with _$WtTitleDetail {
  const factory WtTitleDetail({
    required int titleNo,
    required String title,
    required String synopsis,
    required String posterThumbnailUrl,
    @Default([]) List<WtAuthor> authorList,
  }) = _WtTitleDetail;
  factory WtTitleDetail.fromJson(Map<String, dynamic> json) => _$WtTitleDetailFromJson(json);
}

@freezed
class WtEpisodeMeta with _$WtEpisodeMeta {
  const factory WtEpisodeMeta({
    required int totalEpisodeCount,
  }) = _WtEpisodeMeta;
  factory WtEpisodeMeta.fromJson(Map<String, dynamic> json) => _$WtEpisodeMetaFromJson(json);
}

@freezed
class WtTagItem with _$WtTagItem {
  const factory WtTagItem({
    required String text,
    required String type,
  }) = _WtTagItem;
  factory WtTagItem.fromJson(Map<String, dynamic> json) => _$WtTagItemFromJson(json);
}

@freezed
class WtTagInfo with _$WtTagInfo {
  const factory WtTagInfo({
    @Default([]) List<WtTagItem> tagList,
  }) = _WtTagInfo;
  factory WtTagInfo.fromJson(Map<String, dynamic> json) => _$WtTagInfoFromJson(json);
}

@freezed
class WtTitleHomeResult with _$WtTitleHomeResult {
  const factory WtTitleHomeResult({
    required WtTitleDetail title,
    WtTagInfo? tag,
    required WtEpisodeMeta episodeMeta,
  }) = _WtTitleHomeResult;
  factory WtTitleHomeResult.fromJson(Map<String, dynamic> json) => _$WtTitleHomeResultFromJson(json);
}

// --- Episode List ---
@freezed
class WtEpisodeItem with _$WtEpisodeItem {
  const factory WtEpisodeItem({
    required int episodeNo,
    required String episodeTitle,
    String? thumbnailUrl,
    int? exposureYmdt,
  }) = _WtEpisodeItem;
  factory WtEpisodeItem.fromJson(Map<String, dynamic> json) => _$WtEpisodeItemFromJson(json);
}

@freezed
class WtEpisodeListResult with _$WtEpisodeListResult {
  const factory WtEpisodeListResult({
    @Default([]) List<WtEpisodeItem> episodeList,
    @Default(false) bool hasMore,
  }) = _WtEpisodeListResult;
  factory WtEpisodeListResult.fromJson(Map<String, dynamic> json) => _$WtEpisodeListResultFromJson(json);
}

// --- Episode Info (Images) ---
@freezed
class WtImageInfo with _$WtImageInfo {
  const factory WtImageInfo({
    required String url,
  }) = _WtImageInfo;
  factory WtImageInfo.fromJson(Map<String, dynamic> json) => _$WtImageInfoFromJson(json);
}

@freezed
class WtEpisodeInfo with _$WtEpisodeInfo {
  const factory WtEpisodeInfo({
    @Default([]) List<WtImageInfo> imageInfo,
  }) = _WtEpisodeInfo;
  factory WtEpisodeInfo.fromJson(Map<String, dynamic> json) => _$WtEpisodeInfoFromJson(json);
}

@freezed
class WtEpisodeInfoResult with _$WtEpisodeInfoResult {
  const factory WtEpisodeInfoResult({
    required WtEpisodeInfo episodeInfo,
  }) = _WtEpisodeInfoResult;
  factory WtEpisodeInfoResult.fromJson(Map<String, dynamic> json) => _$WtEpisodeInfoResultFromJson(json);
}
