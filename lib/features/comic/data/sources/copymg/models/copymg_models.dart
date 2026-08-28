import 'package:freezed_annotation/freezed_annotation.dart';

part 'copymg_models.freezed.dart';
part 'copymg_models.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class CopyMGResponse<T> with _$CopyMGResponse<T> {
  const factory CopyMGResponse({
    @Default(200) int code,
    @Default('') String message,
    T? results,
  }) = _CopyMGResponse;

  factory CopyMGResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$CopyMGResponseFromJson(json, fromJsonT);
}

@freezed
abstract class CmAuthor with _$CmAuthor {
  const factory CmAuthor({
    required String name,
    String? alias,
    @JsonKey(name: 'path_word') required String pathWord,
  }) = _CmAuthor;

  factory CmAuthor.fromJson(Map<String, dynamic> json) => _$CmAuthorFromJson(json);
}

@freezed
abstract class CmTheme with _$CmTheme {
  const factory CmTheme({
    required String name,
    @JsonKey(name: 'path_word') required String pathWord,
  }) = _CmTheme;

  factory CmTheme.fromJson(Map<String, dynamic> json) => _$CmThemeFromJson(json);
}

@freezed
abstract class CmComicItem with _$CmComicItem {
  const factory CmComicItem({
    required String name,
    String? alias,
    @JsonKey(name: 'path_word') required String pathWord,
    required String cover,
    @Default(0) int ban,
    @Default([]) List<CmAuthor> author,
    @Default(0) int popular,
  }) = _CmComicItem;

  factory CmComicItem.fromJson(Map<String, dynamic> json) => _$CmComicItemFromJson(json);
}

@freezed
abstract class CmExploreResult with _$CmExploreResult {
  const factory CmExploreResult({
    @Default([]) List<CmComicItem> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _CmExploreResult;

  factory CmExploreResult.fromJson(Map<String, dynamic> json) => _$CmExploreResultFromJson(json);
}

@freezed
abstract class CmSearchResult with _$CmSearchResult {
  const factory CmSearchResult({
    @Default([]) List<CmComicItem> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _CmSearchResult;

  factory CmSearchResult.fromJson(Map<String, dynamic> json) => _$CmSearchResultFromJson(json);
}

@freezed
abstract class CmComicDetailItem with _$CmComicDetailItem {
  const factory CmComicDetailItem({
    required String name,
    String? alias,
    @JsonKey(name: 'path_word') required String pathWord,
    required String cover,
    @Default([]) List<CmAuthor> author,
    @Default([]) List<CmTheme> theme,
    String? brief,
    @JsonKey(name: 'datetime_updated') String? datetimeUpdated,
    dynamic status,
  }) = _CmComicDetailItem;

  factory CmComicDetailItem.fromJson(Map<String, dynamic> json) => _$CmComicDetailItemFromJson(json);
}

@freezed
abstract class CmDetailResult with _$CmDetailResult {
  const factory CmDetailResult({
    required CmComicDetailItem comic,
  }) = _CmDetailResult;

  factory CmDetailResult.fromJson(Map<String, dynamic> json) => _$CmDetailResultFromJson(json);
}

@freezed
abstract class CmChapterItem with _$CmChapterItem {
  const factory CmChapterItem({
    required String uuid,
    required String name,
    int? size,
    @JsonKey(name: 'datetime_created') String? datetimeCreated,
  }) = _CmChapterItem;

  factory CmChapterItem.fromJson(Map<String, dynamic> json) => _$CmChapterItemFromJson(json);
}

@freezed
abstract class CmChapterListResult with _$CmChapterListResult {
  const factory CmChapterListResult({
    @Default([]) List<CmChapterItem> list,
    @Default(0) int total,
  }) = _CmChapterListResult;

  factory CmChapterListResult.fromJson(Map<String, dynamic> json) => _$CmChapterListResultFromJson(json);
}

@freezed
abstract class CmImageItem with _$CmImageItem {
  const factory CmImageItem({
    required String url,
  }) = _CmImageItem;

  factory CmImageItem.fromJson(Map<String, dynamic> json) => _$CmImageItemFromJson(json);
}

@freezed
abstract class CmChapterImageInner with _$CmChapterImageInner {
  const factory CmChapterImageInner({
    @Default([]) List<CmImageItem> contents,
    @Default([]) List<int> words,
  }) = _CmChapterImageInner;

  factory CmChapterImageInner.fromJson(Map<String, dynamic> json) => _$CmChapterImageInnerFromJson(json);
}

@freezed
abstract class CmChapterImageResult with _$CmChapterImageResult {
  const factory CmChapterImageResult({
    CmChapterImageInner? chapter,
  }) = _CmChapterImageResult;

  factory CmChapterImageResult.fromJson(Map<String, dynamic> json) => _$CmChapterImageResultFromJson(json);
}
