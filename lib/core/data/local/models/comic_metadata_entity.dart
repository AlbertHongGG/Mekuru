import 'package:freezed_annotation/freezed_annotation.dart';

part 'comic_metadata_entity.freezed.dart';
part 'comic_metadata_entity.g.dart';

@freezed
abstract class ComicMetadataEntity with _$ComicMetadataEntity {
  const factory ComicMetadataEntity({
    required String id, // 唯一識別碼
    required String providerId,
    required String comicId,
    required String title,
    required String coverUrl,
    required DateTime updatedAt, // 快取更新時間
    DateTime? sourceUpdatedAt, // 來源最新章節發布時間
    int? totalChapters, // 總章節數
    String? latestChapterTitle, // 最新章節名稱
  }) = _ComicMetadataEntity;

  factory ComicMetadataEntity.fromJson(Map<String, dynamic> json) => 
      _$ComicMetadataEntityFromJson(json);
}
