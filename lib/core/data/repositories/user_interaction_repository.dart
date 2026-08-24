import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/models/local_comic_record.dart';
import 'package:mekuru/core/models/comic_base.dart';
import 'package:mekuru/core/models/chapter.dart';

class UserInteractionRepository {
  final Box<LocalComicRecord> _box;

  UserInteractionRepository(this._box);

  String _genId(DataSourceMode dataSourceMode, String providerId, String comicId) {
    return '${dataSourceMode}_${providerId}_$comicId';
  }

  Future<List<LocalComicRecord>> getAllFavorites(DataSourceMode dataSourceMode) async {
    return _box.values
        .where((r) => r.dataSourceMode == dataSourceMode && r.isFavorite)
        .toList()
      ..sort((a, b) => (b.favoriteAt ?? b.updatedAt).compareTo(a.favoriteAt ?? a.updatedAt));
  }

  Future<List<LocalComicRecord>> getFavoritesByProvider(DataSourceMode dataSourceMode, String providerId) async {
    return _box.values
        .where((r) => r.dataSourceMode == dataSourceMode && r.isFavorite && r.providerId == providerId)
        .toList()
      ..sort((a, b) => (b.favoriteAt ?? b.updatedAt).compareTo(a.favoriteAt ?? a.updatedAt));
  }
  
  Future<List<LocalComicRecord>> getAllHistory(DataSourceMode dataSourceMode) async {
    return _box.values
        .where((r) => r.dataSourceMode == dataSourceMode)
        .toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  Future<List<LocalComicRecord>> getHistoryByProvider(DataSourceMode dataSourceMode, String providerId) async {
    return _box.values
        .where((r) => r.dataSourceMode == dataSourceMode && r.providerId == providerId)
        .toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
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
    
    final existing = _box.get(id);
    final now = DateTime.now();

    final record = existing != null
        ? existing.copyWith(
            title: comic.title ?? '',
            coverUrl: comic.coverUrl ?? '',
            lastReadChapterId: chapterId,
            lastReadChapterTitle: chapterTitle,
            lastReadPageIndex: pageIndex ?? existing.lastReadPageIndex,
            updatedAt: now,
          )
        : LocalComicRecord(
            id: id,
            dataSourceMode: dataSourceMode,
            providerId: providerId,
            comicId: comic.comicId,
            title: comic.title ?? '',
            coverUrl: comic.coverUrl ?? '',
            lastReadChapterId: chapterId,
            lastReadChapterTitle: chapterTitle,
            lastReadPageIndex: pageIndex,
            updatedAt: now,
            isFavorite: false,
          );

    await _box.put(id, record);
  }

  Future<LocalComicRecord?> getInteraction({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
  }) async {
    final id = _genId(dataSourceMode, providerId, comicId);
    return _box.get(id);
  }

  Stream<LocalComicRecord?> watchInteraction({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
  }) async* {
    final id = _genId(dataSourceMode, providerId, comicId);
    yield _box.get(id);
    await for (final event in _box.watch(key: id)) {
      yield event.value as LocalComicRecord?;
    }
  }

  Future<void> toggleFavorite({
    required DataSourceMode dataSourceMode,
    required String providerId,
    required String comicId,
    required IComicItem comic,
    required bool isFavorite,
  }) async {
    final id = _genId(dataSourceMode, providerId, comicId);
    final existing = _box.get(id);
    final now = DateTime.now();

    final record = existing != null
        ? existing.copyWith(
            isFavorite: isFavorite,
            favoriteAt: isFavorite ? now : null,
            title: comic.title ?? '',
            coverUrl: comic.coverUrl ?? '',
            updatedAt: now,
          )
        : LocalComicRecord(
            id: id,
            dataSourceMode: dataSourceMode,
            providerId: providerId,
            comicId: comic.comicId,
            title: comic.title ?? '',
            coverUrl: comic.coverUrl ?? '',
            isFavorite: isFavorite,
            favoriteAt: isFavorite ? now : null,
            updatedAt: now,
          );

    await _box.put(id, record);
  }
}

final userInteractionRepositoryProvider = Provider<UserInteractionRepository>((ref) {
  final box = Hive.box<LocalComicRecord>('comic_records');
  return UserInteractionRepository(box);
});
