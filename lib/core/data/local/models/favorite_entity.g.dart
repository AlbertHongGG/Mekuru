// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteEntity _$FavoriteEntityFromJson(Map<String, dynamic> json) =>
    _FavoriteEntity(
      comicId: json['comicId'] as String,
      favoriteAt: DateTime.parse(json['favoriteAt'] as String),
    );

Map<String, dynamic> _$FavoriteEntityToJson(_FavoriteEntity instance) =>
    <String, dynamic>{
      'comicId': instance.comicId,
      'favoriteAt': instance.favoriteAt.toIso8601String(),
    };
