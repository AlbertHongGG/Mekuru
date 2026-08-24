import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mekuru/core/models/enums/data_source_mode.dart';

part 'comic_metadata_entity.freezed.dart';
part 'comic_metadata_entity.g.dart';

@freezed
abstract class ComicMetadataEntity with _$ComicMetadataEntity {
  const factory ComicMetadataEntity({
    required String id, // 唯一識別碼
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
    required String title,
    required String coverUrl,
    required DateTime updatedAt, // 快取更新時間
  }) = _ComicMetadataEntity;

  factory ComicMetadataEntity.fromJson(Map<String, dynamic> json) => 
      _$ComicMetadataEntityFromJson(json);
}
