import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_comic_entity.freezed.dart';
part 'local_comic_entity.g.dart';

@freezed
abstract class LocalComicEntity with _$LocalComicEntity {
  const factory LocalComicEntity({
    required String providerId,
    required String comicId,
    required String title,
    required String coverUrl,
    @Default([]) List<String> tags,
    @Default('') String author,
    @Default('') String description,
    @Default([]) List<String> chapterIds,
    required DateTime archivedAt,
  }) = _LocalComicEntity;

  factory LocalComicEntity.fromJson(Map<String, dynamic> json) => 
      _$LocalComicEntityFromJson(json);
}
