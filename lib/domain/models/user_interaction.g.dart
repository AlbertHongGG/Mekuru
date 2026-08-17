// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserFavorite _$UserFavoriteFromJson(Map<String, dynamic> json) =>
    _UserFavorite(
      providerId: json['provider_id'] as String,
      comicId: json['comic_id'] as String,
      comic: json['comic'] == null
          ? null
          : Comic.fromJson(json['comic'] as Map<String, dynamic>),
      addedAt: json['added_at'] as String,
      lastReadAt: json['last_read_at'] as String?,
      isArchived: json['is_archived'] as bool?,
    );

Map<String, dynamic> _$UserFavoriteToJson(_UserFavorite instance) =>
    <String, dynamic>{
      'provider_id': instance.providerId,
      'comic_id': instance.comicId,
      'comic': instance.comic,
      'added_at': instance.addedAt,
      'last_read_at': instance.lastReadAt,
      'is_archived': instance.isArchived,
    };

_UserInteraction _$UserInteractionFromJson(Map<String, dynamic> json) =>
    _UserInteraction(
      providerId: json['provider_id'] as String,
      comicId: json['comic_id'] as String,
      isFavorite: json['is_favorite'] as bool,
      lastReadChapter: json['last_read_chapter'] as String?,
      lastReadPage: (json['last_read_page'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserInteractionToJson(_UserInteraction instance) =>
    <String, dynamic>{
      'provider_id': instance.providerId,
      'comic_id': instance.comicId,
      'is_favorite': instance.isFavorite,
      'last_read_chapter': instance.lastReadChapter,
      'last_read_page': instance.lastReadPage,
      'updated_at': instance.updatedAt,
    };
