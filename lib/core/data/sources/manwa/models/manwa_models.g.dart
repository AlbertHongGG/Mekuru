// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manwa_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MwResponse<T> _$MwResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _MwResponse<T>(
  code: (json['code'] as num).toInt(),
  data: fromJsonT(json['data']),
  msg: json['msg'] as String?,
);

Map<String, dynamic> _$MwResponseToJson<T>(
  _MwResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'code': instance.code,
  'data': toJsonT(instance.data),
  'msg': instance.msg,
};

_MwExploreResult _$MwExploreResultFromJson(Map<String, dynamic> json) =>
    _MwExploreResult(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => MwComicItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nums: (json['nums'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MwExploreResultToJson(_MwExploreResult instance) =>
    <String, dynamic>{
      'list': instance.list,
      'nums': instance.nums,
      'size': instance.size,
    };

_MwComicItem _$MwComicItemFromJson(Map<String, dynamic> json) => _MwComicItem(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  picx: json['picx'] as String?,
  pic: json['pic'] as String?,
  text: json['text'] as String?,
  serialize: json['serialize'] as String? ?? '',
);

Map<String, dynamic> _$MwComicItemToJson(_MwComicItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picx': instance.picx,
      'pic': instance.pic,
      'text': instance.text,
      'serialize': instance.serialize,
    };

_MwDetailResult _$MwDetailResultFromJson(Map<String, dynamic> json) =>
    _MwDetailResult(
      id: json['id'],
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      picx: json['picx'] as String?,
      author:
          (json['author'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      state: json['state'] as String?,
      text: json['text'] as String?,
      chapterList:
          (json['chapter_list'] as List<dynamic>?)
              ?.map((e) => MwChapterItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MwDetailResultToJson(_MwDetailResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'picx': instance.picx,
      'author': instance.author,
      'state': instance.state,
      'text': instance.text,
      'chapter_list': instance.chapterList,
    };

_MwChapterItem _$MwChapterItemFromJson(Map<String, dynamic> json) =>
    _MwChapterItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      addtime: json['addtime'] as String?,
    );

Map<String, dynamic> _$MwChapterItemToJson(_MwChapterItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'addtime': instance.addtime,
    };

_MwChapterImageResult _$MwChapterImageResultFromJson(
  Map<String, dynamic> json,
) => _MwChapterImageResult(
  piclist:
      (json['piclist'] as List<dynamic>?)
          ?.map((e) => MwImageItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MwChapterImageResultToJson(
  _MwChapterImageResult instance,
) => <String, dynamic>{'piclist': instance.piclist};

_MwImageItem _$MwImageItemFromJson(Map<String, dynamic> json) =>
    _MwImageItem(pic: json['pic'] as String);

Map<String, dynamic> _$MwImageItemToJson(_MwImageItem instance) =>
    <String, dynamic>{'pic': instance.pic};
