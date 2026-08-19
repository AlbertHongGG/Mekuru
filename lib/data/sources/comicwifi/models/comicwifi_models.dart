import 'package:freezed_annotation/freezed_annotation.dart';

part 'comicwifi_models.freezed.dart';
part 'comicwifi_models.g.dart';

@freezed
class CwComicDetail with _$CwComicDetail {
  const factory CwComicDetail({
    required String id,
    String? name,
    String? cover,
    List<String>? tags,
    String? desc,
    String? trace,
  }) = _CwComicDetail;

  factory CwComicDetail.fromJson(Map<String, dynamic> json) => _$CwComicDetailFromJson(json);
}

@freezed
class CwChapterInfo with _$CwChapterInfo {
  const factory CwChapterInfo({
    @JsonKey(name: 'chapter_id') required dynamic chapterId,
    @JsonKey(name: 'chapter_name') String? chapterName,
    @JsonKey(name: 'chapter_cover') String? chapterCover,
    @JsonKey(name: 'create_time') String? createTime,
  }) = _CwChapterInfo;

  factory CwChapterInfo.fromJson(Map<String, dynamic> json) => _$CwChapterInfoFromJson(json);
}

@freezed
class CwChapterList with _$CwChapterList {
  const factory CwChapterList({
    @Default([]) List<CwChapterInfo> chapters,
  }) = _CwChapterList;

  factory CwChapterList.fromJson(Map<String, dynamic> json) => _$CwChapterListFromJson(json);
}

@freezed
class CwChapterImage with _$CwChapterImage {
  const factory CwChapterImage({
    required String url,
    @Default(0) int height,
    @Default(0) int width,
  }) = _CwChapterImage;

  factory CwChapterImage.fromJson(Map<String, dynamic> json) => _$CwChapterImageFromJson(json);
}

@freezed
class CwChapterReadData with _$CwChapterReadData {
  const factory CwChapterReadData({
    @Default([]) List<CwChapterImage> imgs,
  }) = _CwChapterReadData;

  factory CwChapterReadData.fromJson(Map<String, dynamic> json) => _$CwChapterReadDataFromJson(json);
}

@freezed
class CwSearchModuleItem with _$CwSearchModuleItem {
  const factory CwSearchModuleItem({
    required String id,
    required String name,
    required String cover,
    @Default([]) List<String> tags,
    @Default("") String desc,
  }) = _CwSearchModuleItem;

  factory CwSearchModuleItem.fromJson(Map<String, dynamic> json) => _$CwSearchModuleItemFromJson(json);
}

@freezed
class CwSearchResultItem with _$CwSearchResultItem {
  const factory CwSearchResultItem({
    @JsonKey(name: 'module_item') required CwSearchModuleItem moduleItem,
  }) = _CwSearchResultItem;

  factory CwSearchResultItem.fromJson(Map<String, dynamic> json) => _$CwSearchResultItemFromJson(json);
}
