import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';

part 'backup_archive.freezed.dart';
part 'backup_archive.g.dart';

@freezed
abstract class BackupArchive with _$BackupArchive {
  const factory BackupArchive({
    required int version,
    required DateTime exportedAt,
    @Default([]) List<ComicMetadataEntity> metadataList,
    @Default({}) Map<String, FavoriteEntity> favoritesMap,
    @Default({}) Map<String, HistoryEntity> historyMap,
  }) = _BackupArchive;

  factory BackupArchive.fromJson(Map<String, dynamic> json) => _$BackupArchiveFromJson(json);
}
