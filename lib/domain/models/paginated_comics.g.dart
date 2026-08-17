// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_comics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedComics _$PaginatedComicsFromJson(Map<String, dynamic> json) =>
    _PaginatedComics(
      comics:
          (json['comics'] as List<dynamic>?)
              ?.map((e) => Comic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 1,
      hasNext: json['hasNext'] as bool? ?? false,
    );

Map<String, dynamic> _$PaginatedComicsToJson(_PaginatedComics instance) =>
    <String, dynamic>{
      'comics': instance.comics,
      'page': instance.page,
      'hasNext': instance.hasNext,
    };
