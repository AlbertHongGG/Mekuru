import 'package:freezed_annotation/freezed_annotation.dart';
import 'comic_base.dart';

part 'comic_models.freezed.dart';
part 'comic_models.g.dart';

@freezed
abstract class ComicDetail with _$ComicDetail implements IComicItem {
  const factory ComicDetail({
    @JsonKey(name: 'id') required String comicId,
    @JsonKey(name: 'provider_id') required String providerId,
    required String title,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @Default('未知作者') String author,
    required String description,
    @Default([]) List<String> tags,
    @JsonKey(name: 'update_status') @Default('') String status,
  }) = _ComicDetail;

  factory ComicDetail.fromJson(Map<String, dynamic> json) => _$ComicDetailFromJson(json);
}

@freezed
abstract class ComicExploreResult with _$ComicExploreResult implements IComicItem {
  const factory ComicExploreResult({
    @JsonKey(name: 'id') required String comicId,
    @JsonKey(name: 'provider_id') required String providerId,
    required String title,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @Default([]) List<String> tags,
  }) = _ComicExploreResult;

  factory ComicExploreResult.fromJson(Map<String, dynamic> json) => _$ComicExploreResultFromJson(json);
}

@freezed
abstract class ComicSearchResult with _$ComicSearchResult implements IComicItem {
  const factory ComicSearchResult({
    @JsonKey(name: 'id') required String comicId,
    @JsonKey(name: 'provider_id') required String providerId,
    // Note: Search results might not always have title/cover depending on the API (e.g. Webtoon)
    // But we include them as optional since the interface allows nullable.
    String? title,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @Default([]) List<String> tags,
  }) = _ComicSearchResult;

  factory ComicSearchResult.fromJson(Map<String, dynamic> json) => _$ComicSearchResultFromJson(json);
}
