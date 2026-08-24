import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';
import 'package:mekuru/features/backup/domain/models/backup_archive.dart';

class BackupRepository {
  final ILocalStorage<ComicMetadataEntity> _metadataBox;
  final ILocalStorage<FavoriteEntity> _favoritesBox;
  final ILocalStorage<HistoryEntity> _historyBox;

  BackupRepository(this._metadataBox, this._favoritesBox, this._historyBox);

  Future<BackupArchive> createSnapshot() async {
    final favoritesMap = <String, FavoriteEntity>{};
    for (final key in _favoritesBox.keys) {
      final value = _favoritesBox.get(key);
      if (value != null) favoritesMap[key] = value;
    }

    final historyMap = <String, HistoryEntity>{};
    for (final key in _historyBox.keys) {
      final value = _historyBox.get(key);
      if (value != null) historyMap[key] = value;
    }

    return BackupArchive(
      version: 1,
      exportedAt: DateTime.now(),
      metadataList: _metadataBox.getAll(),
      favoritesMap: favoritesMap,
      historyMap: historyMap,
    );
  }

  Future<void> restoreSnapshot(BackupArchive archive) async {
    // 1. Clear existing data
    await _metadataBox.clear();
    await _favoritesBox.clear();
    await _historyBox.clear();

    // 2. Restore new data
    for (final item in archive.metadataList) {
      await _metadataBox.put(item.id, item);
    }
    
    for (final entry in archive.favoritesMap.entries) {
      await _favoritesBox.put(entry.key, entry.value);
    }
    
    for (final entry in archive.historyMap.entries) {
      await _historyBox.put(entry.key, entry.value);
    }
  }
}

final backupRepositoryProvider = Provider<BackupRepository>((ref) {
  return BackupRepository(
    ref.watch(comicMetadataBoxProvider),
    ref.watch(userFavoritesBoxProvider),
    ref.watch(readingHistoryBoxProvider),
  );
});
