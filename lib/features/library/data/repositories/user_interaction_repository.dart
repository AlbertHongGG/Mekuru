import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/features/library/domain/models/comic_record.dart';
import 'package:mekuru/features/comic/domain/models/comic_base.dart';
import 'package:mekuru/features/comic/domain/models/chapter.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';

class UserInteractionRepository {
  final ILocalStorage<ComicMetadataEntity> _metadataBox;
  final ILocalStorage<FavoriteEntity> _favoritesBox;
  final ILocalStorage<HistoryEntity> _historyBox;

  UserInteractionRepository(this._metadataBox, this._favoritesBox, this._historyBox);

  String _genId(String providerId, String comicId) {
    return '${providerId}_$comicId';
  }

  ComicRecord? _buildRecord(String id) {
    final metadata = _metadataBox.get(id);
    if (metadata == null) return null;
    
    final favorite = _favoritesBox.get(id);
    final history = _historyBox.get(id);

    return ComicRecord(
      id: id,
      providerId: metadata.providerId,
      comicId: metadata.comicId,
      title: metadata.title,
      coverUrl: metadata.coverUrl,
      updatedAt: metadata.updatedAt,
      sourceUpdatedAt: metadata.sourceUpdatedAt,
      totalChapters: metadata.totalChapters,
      latestChapterTitle: metadata.latestChapterTitle,
      isFavorite: favorite != null,
      favoriteAt: favorite?.favoriteAt,
      lastReadChapterId: history?.lastReadChapterId,
      lastReadChapterTitle: history?.lastReadChapterTitle,
      lastReadPageIndex: history?.lastReadPageIndex,
      lastReadChapterIndex: history?.lastReadChapterIndex,
      readAt: history?.updatedAt,
      readChapterIds: history?.readChapterIds ?? [],
    );
  }

  Future<List<ComicRecord>> getAllFavorites() async {
    final records = <ComicRecord>[];
    for (final id in _favoritesBox.keys) {
      final record = _buildRecord(id);
      if (record != null) {
        records.add(record);
      }
    }
    records.sort((a, b) => (b.favoriteAt ?? b.updatedAt).compareTo(a.favoriteAt ?? a.updatedAt));
    return records;
  }

  Future<List<ComicRecord>> getFavoritesByProvider(String providerId) async {
    final records = await getAllFavorites();
    return records.where((r) => r.providerId == providerId).toList();
  }
  
  Future<List<ComicRecord>> getAllHistory() async {
    final records = <ComicRecord>[];
    for (final id in _historyBox.keys) {
      final record = _buildRecord(id);
      if (record != null) {
        records.add(record);
      }
    }
    records.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return records;
  }

  Future<List<ComicRecord>> getHistoryByProvider(String providerId) async {
    final records = await getAllHistory();
    return records.where((r) => r.providerId == providerId).toList();
  }


  Future<ComicMetadataEntity?> getMetadata(String providerId, String comicId) async {
    final id = _genId(providerId, comicId);
    return _metadataBox.get(id);
  }

  Future<void> updateMetadataFields(
    String providerId,
    String comicId, {
    int? totalChapters,
    DateTime? sourceUpdatedAt,
    String? latestChapterTitle,
  }) async {
    final id = _genId(providerId, comicId);
    final existing = _metadataBox.get(id);
    if (existing != null) {
      final updated = existing.copyWith(
        totalChapters: totalChapters ?? existing.totalChapters,
        sourceUpdatedAt: sourceUpdatedAt ?? existing.sourceUpdatedAt,
        latestChapterTitle: latestChapterTitle ?? existing.latestChapterTitle,
      );
      await _metadataBox.put(id, updated);
    }
  }

  
  Future<void> updateChaptersOnly(String providerId, String comicId, List<Chapter> chapters, {bool isChaptersDescending = false}) async {
    final id = _genId(providerId, comicId);
    final existing = _metadataBox.get(id);
    if (existing == null) return;

    DateTime? sourceUpdatedAt = existing.sourceUpdatedAt;
    int? totalChapters = existing.totalChapters;
    String? latestChapterTitle = existing.latestChapterTitle;
    bool chaptersUpdated = false;

    if (chapters.isNotEmpty) {
      DateTime? newestTime;
      Chapter? latestChap = chapters.first;
      for (final chap in chapters) {
        if (chap.publishedAt != null) {
          String dateStr = chap.publishedAt!.replaceAll('.', '-').replaceAll('/', '-');
          final spaceParts = dateStr.split(' ');
          final dateParts = spaceParts[0].split('-');
          if (dateParts.length == 3) {
            final y = dateParts[0];
            final m = dateParts[1].padLeft(2, '0');
            final d = dateParts[2].padLeft(2, '0');
            String cleanDate = '$y-$m-$d';
            if (spaceParts.length > 1) {
              cleanDate += ' ' + spaceParts[1];
            }
            dateStr = cleanDate;
          }
          final time = DateTime.tryParse(dateStr);
          if (time != null) {
            if (newestTime == null || time.isAfter(newestTime)) {
              newestTime = time;
              latestChap = chap;
            }
          }
        }
      }
      
      if (newestTime != null && (sourceUpdatedAt == null || newestTime.isAfter(sourceUpdatedAt))) {
        sourceUpdatedAt = newestTime;
        chaptersUpdated = true;
      }
      
      if (totalChapters != chapters.length || latestChapterTitle != latestChap?.title) {
        totalChapters = chapters.length;
        latestChapterTitle = latestChap?.title;
        chaptersUpdated = true;
      }
    }

    if (chaptersUpdated) {
      await _metadataBox.put(id, existing.copyWith(
        sourceUpdatedAt: sourceUpdatedAt,
        totalChapters: totalChapters,
        latestChapterTitle: latestChapterTitle,
        updatedAt: DateTime.now(),
      ));
    }

    if (chapters.isNotEmpty) {
      final existingHistory = _historyBox.get(id);
      if (existingHistory != null && existingHistory.lastReadChapterId.isNotEmpty) {
        final indexInList = chapters.indexWhere((c) => c.id == existingHistory.lastReadChapterId);
        if (indexInList != -1) {
          final int actualIndex = isChaptersDescending 
              ? chapters.length - indexInList 
              : indexInList + 1;
          
          if (existingHistory.lastReadChapterIndex != actualIndex) {
            await _historyBox.put(id, existingHistory.copyWith(
              lastReadChapterIndex: actualIndex,
            ));
          }
        }
      }
    }
  }

  Future<void> updateMetadata(String providerId, IComicItem comic, {List<Chapter>? chapters, bool isChaptersDescending = false}) async {
    final id = _genId(providerId, comic.comicId);
    final now = DateTime.now();
    final existing = _metadataBox.get(id);
    
    if (existing == null || existing.coverUrl != comic.coverUrl || existing.title != comic.title) {
      await _metadataBox.put(id, ComicMetadataEntity(
        id: id,
        providerId: providerId,
        comicId: comic.comicId,
        title: comic.title ?? existing?.title ?? '',
        coverUrl: comic.coverUrl ?? existing?.coverUrl ?? '',
        updatedAt: now,
        sourceUpdatedAt: existing?.sourceUpdatedAt,
        totalChapters: existing?.totalChapters,
        latestChapterTitle: existing?.latestChapterTitle,
      ));
    }

    if (chapters != null && chapters.isNotEmpty) {
      await updateChaptersOnly(providerId, comic.comicId, chapters, isChaptersDescending: isChaptersDescending);
    }
  }
  Future<void> markRead({
    required String providerId,
    required String comicId,
    required IComicItem comic,
    required String chapterId,
    required String chapterTitle,
    int? pageIndex,
    int? chapterIndex,
  }) async {
    final id = _genId(providerId, comicId);
    
    await updateMetadata(providerId, comic);
    
    final existingHistory = _historyBox.get(id);
    final readChapterIds = existingHistory?.readChapterIds.toList() ?? [];
    if (!readChapterIds.contains(chapterId)) {
      readChapterIds.add(chapterId);
    }
    
    await _historyBox.put(id, HistoryEntity(
      comicId: comicId,
      lastReadChapterId: chapterId,
      lastReadChapterTitle: chapterTitle,
      lastReadPageIndex: pageIndex ?? existingHistory?.lastReadPageIndex ?? 0,
      updatedAt: DateTime.now(),
      readChapterIds: readChapterIds,
      lastReadChapterIndex: chapterIndex ?? existingHistory?.lastReadChapterIndex,
    ));
  }

  Future<ComicRecord?> getInteraction({
    required String providerId,
    required String comicId,
  }) async {
    final id = _genId(providerId, comicId);
    return _buildRecord(id);
  }

  Stream<ComicRecord?> watchInteraction({
    required String providerId,
    required String comicId,
  }) async* {
    final id = _genId(providerId, comicId);
    yield _buildRecord(id);
    
    yield* StreamGroup.merge([
      _metadataBox.watch(id),
      _favoritesBox.watch(id),
      _historyBox.watch(id),
    ]).map((_) => _buildRecord(id));
  }

  Stream<void> watchGlobalChanges() {
    return StreamGroup.merge([
      _metadataBox.watchAll(),
      _favoritesBox.watchAll(),
      _historyBox.watchAll(),
    ]);
  }

  Future<void> toggleFavorite({
    required String providerId,
    required String comicId,
    required IComicItem comic,
    required bool isFavorite,
  }) async {
    final id = _genId(providerId, comicId);
    
    await updateMetadata(providerId, comic);
    
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
