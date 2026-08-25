// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guazi_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GuaziComicDetail _$GuaziComicDetailFromJson(Map<String, dynamic> json) =>
    _GuaziComicDetail(
      id: json['id'],
      name: json['name'] as String,
      author: json['author'] as String?,
      picThumb: json['pic_thumb'] as String?,
      pic: json['pic'] as String?,
      serialize: json['serialize'] as String?,
      content: json['content'] as String?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$GuaziComicDetailToJson(_GuaziComicDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'pic_thumb': instance.picThumb,
      'pic': instance.pic,
      'serialize': instance.serialize,
      'content': instance.content,
      'category_name': instance.categoryName,
    };

_GuaziChapterItem _$GuaziChapterItemFromJson(Map<String, dynamic> json) =>
    _GuaziChapterItem(
      id: json['id'],
      name: json['name'] as String,
      xid: json['xid'],
      addtime: json['addtime'],
    );

Map<String, dynamic> _$GuaziChapterItemToJson(_GuaziChapterItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'xid': instance.xid,
      'addtime': instance.addtime,
    };

_GuaziImageList _$GuaziImageListFromJson(Map<String, dynamic> json) =>
    _GuaziImageList(
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => GuaziImageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GuaziImageListToJson(_GuaziImageList instance) =>
    <String, dynamic>{'images': instance.images};

_GuaziImageItem _$GuaziImageItemFromJson(Map<String, dynamic> json) =>
    _GuaziImageItem(id: json['id'], img: json['img'] as String?);

Map<String, dynamic> _$GuaziImageItemToJson(_GuaziImageItem instance) =>
    <String, dynamic>{'id': instance.id, 'img': instance.img};

_GuaziComicList _$GuaziComicListFromJson(Map<String, dynamic> json) =>
    _GuaziComicList(
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => GuaziComicItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GuaziComicListToJson(_GuaziComicList instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'list': instance.list,
    };

_GuaziComicItem _$GuaziComicItemFromJson(Map<String, dynamic> json) =>
    _GuaziComicItem(
      id: json['id'],
      name: json['name'] as String,
      author: json['author'] as String?,
      pic: json['pic'] as String?,
      picThumb: json['pic_thumb'] as String?,
      serialize: json['serialize'] as String?,
      content: json['content'] as String?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$GuaziComicItemToJson(_GuaziComicItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'pic': instance.pic,
      'pic_thumb': instance.picThumb,
      'serialize': instance.serialize,
      'content': instance.content,
      'category_name': instance.categoryName,
    };
