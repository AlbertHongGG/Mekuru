// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicPage _$ComicPageFromJson(Map<String, dynamic> json) => _ComicPage(
  index: (json['order'] as num).toInt(),
  imageUrl: json['url'] as String,
);

Map<String, dynamic> _$ComicPageToJson(_ComicPage instance) =>
    <String, dynamic>{'order': instance.index, 'url': instance.imageUrl};
