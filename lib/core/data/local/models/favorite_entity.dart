import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_entity.freezed.dart';
part 'favorite_entity.g.dart';

@freezed
abstract class FavoriteEntity with _$FavoriteEntity {
  const factory FavoriteEntity({
    required String comicId, // 關聯的 metadata ID
    required DateTime favoriteAt, // 收藏時間
  }) = _FavoriteEntity;

  factory FavoriteEntity.fromJson(Map<String, dynamic> json) => 
      _$FavoriteEntityFromJson(json);
}
