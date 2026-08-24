import 'package:async/async.dart';
import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/core/models/comic_record.dart';
import 'package:mekuru/core/models/comic_base.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';

class UserInteractionRepository {
  final ILocalStorage<ComicMetadataEntity> _metadataBox;
  final ILocalStorage<FavoriteEntity> _favoritesBox;
  final ILocalStorage<HistoryEntity> _historyBox;

  UserInteractionRepository(this._metadataBox, this._favoritesBox, this._historyBox);

  String _genId(DataSourceMode dataSourceMode, String providerId, String comicId) {
    return '${dataSourceMode}_${providerId}_$comicId';
  }

  ComicRecord? _buildRecord(String id) {
    final metadata = _metadataBox.get(id);
    if (metadata == null) return null;
    final favorite = _favoritesBox.get(id);
    final history = _historyBox.get(id);

    return ComicRecord(
      id: id,
      dataSourceMode: metadata.dataSourceMode,
      providerId: metadata.providerId,
      comicId: metadata.comicId,
      title: metadata.title,
      coverUrl: metadata.coverUrl,
      updatedAt: metadata.updatedAt,
      isFavorite: favorite != null,
      favoriteAt: favorite?.favoriteAt,
      lastReadChapterId: history?.lastReadChapterId,
      lastReadChapterTitle: history?.lastReadChapterTitle,
      lastReadPageIndex: history?.lastReadPageIndex,
    );
  }

  Future<List<ComicRecord>> getAllFavorites(DataSourceMode dataSourceMode) async {
    final records = <ComicRecord>[];
    for (final id in _favoritesBox.keys) {
      final record = _buildRecord(id);
      if (record != null && record.dataSourceMode == dataSourceMode) {
        records.add(record);
      }
    }
    records.sort((a, b) => (b.favoriteAt ?? b.updatedAt).compareTo(a.favoriteAt ?? a.updatedAt));
    return records;
  }

  Future<List<ComicRecord>> getFavoritesByProvider(DataSourceMode dataSourceMode, String providerId) async {
    final records = await getAllFavorites(dataSourceMode);
    return records.where((r) => r.providerId == providerId).toList();
  }
  
  Future<List<ComicRecord>> getAllHistory(DataSourceMode dataSourceMode) async {
    final records = <ComicRecord>[];
    for (final id in _historyBox.keys) {
      final record = _buildRecord(id);
      if (record != null && record.dataSourceMode == dataSourceMode) {
        records.add(record);
      }
    }
    records.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return records;
  }

  Future<List<ComicRecord>> getHistoryByProvider(DataSourceMode dataSourceMode, String providerId) async {
    final records = await getAllHistory(dataSourceMode);
    return records.where((r) => r.providerId == providerId).toList();
  }

  Future<void> _updateMetadata(String id, DataSourceMode dataSourceMode, String providerId, IComicItem comic) async {
    final now = DateTime.now();
    final existing = _metadataBox.get(id);
    
    // Only update metadata if cover or title actually changed, or if it doesn't exist
    if (existing == null || existing.coverUrl != comic.coverUrl || existing.title != comic.title) {
      await _metadataBox.put(id, ComicMetadataEntity(
        id: id,
        dataSourceMode: dataSourceMode,
        providerId: providerId,
        comicId: comic.comicId,
        title: comic.title ?? existing?.title ?? '',
        coverUrl: comic.coverUrl ?? existing?.coverUrl ?? '',
        updatedAt: now,
      ));
    }
  }

  Future<void> markRead({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
    required IComicItem comic,
    required String chapterId,
    required String chapterTitle,
    int? pageIndex,
  }) async {
    final id = _genId(dataSourceMode, providerId, comicId);
    
    await _updateMetadata(id, dataSourceMode, providerId, comic);
    
    final existingHistory = _historyBox.get(id);
    await _historyBox.put(id, HistoryEntity(
      comicId: comicId,
      lastReadChapterId: chapterId,
      lastReadChapterTitle: chapterTitle,
      lastReadPageIndex: pageIndex ?? existingHistory?.lastReadPageIndex ?? 0,
      updatedAt: DateTime.now(),
    ));
  }

  Future<ComicRecord?> getInteraction({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
  }) async {
    final id = _genId(dataSourceMode, providerId, comicId);
    return _buildRecord(id);
  }

  Stream<ComicRecord?> watchInteraction({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
  }) async* {
    final id = _genId(dataSourceMode, providerId, comicId);
    yield _buildRecord(id);
    
    // Watch all boxes for changes to this ID
    // Note: StreamGroup could be used here, but for simplicity we watch the metadata box which updates often
    // Actually, watching all 3 is safer but tricky. I will yield when any changes.
    // Riverpod is better suited for this, but to keep the Stream interface:
    yield* StreamGroup.merge([
      _metadataBox.watch(id),
      _favoritesBox.watch(id),
      _historyBox.watch(id),
    ]).map((_) => _buildRecord(id));
  }

  Future<void> toggleFavorite({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
    required IComicItem comic,
    required bool isFavorite,
  }) async {
    final id = _genId(dataSourceMode, providerId, comicId);
    
    await _updateMetadata(id, dataSourceMode, providerId, comic);
    
    if (isFavorite) {
      await _favoritesBox.put(id, FavoriteEntity(
        comicId: comicId,
        favoriteAt: DateTime.now(),
      ));
    } else {
      await _favoritesBox.delete(id);
    }
  }
}

final userInteractionRepositoryProvider = Provider<UserInteractionRepository>((ref) {
  return UserInteractionRepository(
    ref.watch(comicMetadataBoxProvider),
    ref.watch(userFavoritesBoxProvider),
    ref.watch(readingHistoryBoxProvider),
  );
});
