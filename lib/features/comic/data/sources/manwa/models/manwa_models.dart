import 'package:freezed_annotation/freezed_annotation.dart';

part 'manwa_models.freezed.dart';
part 'manwa_models.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class MwResponse<T> with _$MwResponse<T> {
  const factory MwResponse({
    required int code,
    required T data,
    String? msg,
  }) = _MwResponse<T>;

  factory MwResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$MwResponseFromJson(json, fromJsonT);
}

@freezed
abstract class MwExploreResult with _$MwExploreResult {
  const factory MwExploreResult({
    @Default([]) List<MwComicItem> list,
    @Default(0) int nums,
    @Default(0) int size,
  }) = _MwExploreResult;

  factory MwExploreResult.fromJson(Map<String, dynamic> json) =>
      _$MwExploreResultFromJson(json);
}

@freezed
abstract class MwComicItem with _$MwComicItem {
  const factory MwComicItem({
    required int id,
    required String name,
    @JsonKey(name: 'picx') String? picx,
    @JsonKey(name: 'pic') String? pic,
    String? text,
    @Default('') String serialize,
  }) = _MwComicItem;

  factory MwComicItem.fromJson(Map<String, dynamic> json) =>
      _$MwComicItemFromJson(json);
}

@freezed
abstract class MwDetailResult with _$MwDetailResult {
  const factory MwDetailResult({
    required dynamic id, // Sometimes string, sometimes int
    required String name,
    String? nickname,
    @JsonKey(name: 'picx') String? picx,
    @Default([]) List<String> author,
    String? state,
    String? text,
    @Default([]) List<MwTagItem> tags,
    @JsonKey(name: 'chapter_list') @Default([]) List<MwChapterItem> chapterList,
  }) = _MwDetailResult;

  factory MwDetailResult.fromJson(Map<String, dynamic> json) =>
      _$MwDetailResultFromJson(json);
}

@freezed
abstract class MwChapterItem with _$MwChapterItem {
  const factory MwChapterItem({
    required int id,
    required String name,
    String? addtime,
  }) = _MwChapterItem;

  factory MwChapterItem.fromJson(Map<String, dynamic> json) =>
      _$MwChapterItemFromJson(json);
}

@freezed
abstract class MwTagItem with _$MwTagItem {
  const factory MwTagItem({
    required String name,
  }) = _MwTagItem;

  factory MwTagItem.fromJson(Map<String, dynamic> json) =>
      _$MwTagItemFromJson(json);
}

@freezed
abstract class MwChapterImageResult with _$MwChapterImageResult {
  const factory MwChapterImageResult({
    @Default([]) List<MwImageItem> piclist,
  }) = _MwChapterImageResult;

  factory MwChapterImageResult.fromJson(Map<String, dynamic> json) =>
      _$MwChapterImageResultFromJson(json);
}

@freezed
abstract class MwImageItem with _$MwImageItem {
  const factory MwImageItem({
    required String pic,
  }) = _MwImageItem;

  factory MwImageItem.fromJson(Map<String, dynamic> json) =>
      _$MwImageItemFromJson(json);
}
