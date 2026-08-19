import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/domain/models/local_comic_record.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';

class UserInteractionRepository {
  final Box<LocalComicRecord> _box;

  UserInteractionRepository(this._box);

  String _genId(String dataSourceMode, String providerId, String comicId) {
    return '${dataSourceMode}_${providerId}_$comicId';
  }

  Future<List<LocalComicRecord>> getFavorites({
    required String dataSourceMode,
    String? providerId,
  }) async {
    return _box.values
        .where((r) => r.dataSourceMode == dataSourceMode && 
                     r.isFavorite && 
                     (providerId == null || r.providerId == providerId))
        .toList()
      ..sort((a, b) => (b.favoriteAt ?? b.updatedAt).compareTo(a.favoriteAt ?? a.updatedAt));
  }
  
  Future<List<LocalComicRecord>> getHistory({
    required String dataSourceMode,
    String? providerId,
  }) async {
    return _box.values
        .where((r) => r.dataSourceMode == dataSourceMode &&
                     (providerId == null || r.providerId == providerId))
        .toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  Future<void> markRead({
    required String dataSourceMode,
    required String providerId,
    required String comicId,
    required Comic comic,
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
            comicId: comic.comicId ?? '',
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
    required String dataSourceMode,
    required String providerId,
    required String comicId,
  }) async {
    final id = _genId(dataSourceMode, providerId, comicId);
    return _box.get(id);
  }

  Stream<LocalComicRecord?> watchInteraction({
    required String dataSourceMode,
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
    required String dataSourceMode,
    required String providerId,
    required String comicId,
    required Comic comic,
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
            comicId: comic.comicId ?? '',
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
