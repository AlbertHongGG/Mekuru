import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mekuru/domain/models/comic.dart';

part 'user_interaction.freezed.dart';
part 'user_interaction.g.dart';

@freezed
abstract class UserFavorite with _$UserFavorite {
  const factory UserFavorite({
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'comic_id') required String comicId,
    Comic? comic,
    @JsonKey(name: 'added_at') required String addedAt,
    @JsonKey(name: 'last_read_at') String? lastReadAt,
    @JsonKey(name: 'is_archived') bool? isArchived,
  }) = _UserFavorite;

  factory UserFavorite.fromJson(Map<String, dynamic> json) => _$UserFavoriteFromJson(json);
}

@freezed
abstract class UserInteraction with _$UserInteraction {
  const factory UserInteraction({
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'comic_id') required String comicId,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'last_read_chapter') String? lastReadChapter,
    @JsonKey(name: 'last_read_page') int? lastReadPage,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _UserInteraction;

  factory UserInteraction.fromJson(Map<String, dynamic> json) => _$UserInteractionFromJson(json);
}
