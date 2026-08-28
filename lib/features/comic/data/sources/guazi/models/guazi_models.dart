import 'package:freezed_annotation/freezed_annotation.dart';

part 'guazi_models.freezed.dart';
part 'guazi_models.g.dart';

@freezed
abstract class GuaziComicDetail with _$GuaziComicDetail {
  const factory GuaziComicDetail({
    required dynamic id, // Could be int or string
    required String name,
    String? author,
    @JsonKey(name: 'pic_thumb') String? picThumb,
    String? pic,
    String? serialize,
    String? content,
    @JsonKey(name: 'category_name') String? categoryName,
  }) = _GuaziComicDetail;

  factory GuaziComicDetail.fromJson(Map<String, dynamic> json) => _$GuaziComicDetailFromJson(json);
}

@freezed
abstract class GuaziChapterItem with _$GuaziChapterItem {
  const factory GuaziChapterItem({
    required dynamic id,
    required String name,
    dynamic xid,
    dynamic addtime,
  }) = _GuaziChapterItem;

  factory GuaziChapterItem.fromJson(Map<String, dynamic> json) => _$GuaziChapterItemFromJson(json);
}

@freezed
abstract class GuaziImageList with _$GuaziImageList {
  const factory GuaziImageList({
    @Default([]) List<GuaziImageItem> images,
  }) = _GuaziImageList;

  factory GuaziImageList.fromJson(Map<String, dynamic> json) => _$GuaziImageListFromJson(json);
}

@freezed
abstract class GuaziImageItem with _$GuaziImageItem {
  const factory GuaziImageItem({
    required dynamic id,
    String? img,
  }) = _GuaziImageItem;

  factory GuaziImageItem.fromJson(Map<String, dynamic> json) => _$GuaziImageItemFromJson(json);
}

@freezed
abstract class GuaziComicList with _$GuaziComicList {
  const factory GuaziComicList({
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'page_size') int? pageSize,
    @Default([]) List<GuaziComicItem> list,
  }) = _GuaziComicList;

  factory GuaziComicList.fromJson(Map<String, dynamic> json) => _$GuaziComicListFromJson(json);
}

@freezed
abstract class GuaziComicItem with _$GuaziComicItem {
  const factory GuaziComicItem({
    required dynamic id,
    required String name,
    String? author,
    String? pic,
    @JsonKey(name: 'pic_thumb') String? picThumb,
    String? serialize,
    String? content,
    @JsonKey(name: 'category_name') String? categoryName,
  }) = _GuaziComicItem;

  factory GuaziComicItem.fromJson(Map<String, dynamic> json) => _$GuaziComicItemFromJson(json);
}
