import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/database_manager.dart';
import 'package:mekuru/core/data/local/i_local_storage.dart';
import 'package:mekuru/core/data/local/hive_local_storage.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';

import 'package:mekuru/features/logger/domain/models/log_entry.dart';

final settingsBoxProvider = Provider<ILocalStorage<dynamic>>((ref) {
  return HiveLocalStorage<dynamic>(Hive.box<dynamic>(DatabaseManager.boxSettings));
});

final tagsBoxProvider = Provider<ILocalStorage<dynamic>>((ref) {
  return HiveLocalStorage<dynamic>(Hive.box<dynamic>(DatabaseManager.boxTags));
});

final comicMetadataBoxProvider = Provider<ILocalStorage<ComicMetadataEntity>>((ref) {
  return HiveLocalStorage<ComicMetadataEntity>(Hive.box<ComicMetadataEntity>(DatabaseManager.boxComicMetadata));
});

final userFavoritesBoxProvider = Provider<ILocalStorage<FavoriteEntity>>((ref) {
  return HiveLocalStorage<FavoriteEntity>(Hive.box<FavoriteEntity>(DatabaseManager.boxUserFavorites));
});

final readingHistoryBoxProvider = Provider<ILocalStorage<HistoryEntity>>((ref) {
  return HiveLocalStorage<HistoryEntity>(Hive.box<HistoryEntity>(DatabaseManager.boxReadingHistory));
});

final systemLogsBoxProvider = Provider<ILocalStorage<LogEntry>>((ref) {
  return HiveLocalStorage<LogEntry>(Hive.box<LogEntry>(DatabaseManager.boxSystemLogs));
});

final apiLogsBoxProvider = Provider<ILocalStorage<LogEntry>>((ref) {
  return HiveLocalStorage<LogEntry>(Hive.box<LogEntry>(DatabaseManager.boxApiLogs));
});

import 'package:mekuru/core/data/local/archive_storage.dart';

final localLibraryStorageProvider = Provider<ILocalLibraryStorage>((ref) {
  return HiveLocalLibraryStorage(Hive.box<dynamic>(DatabaseManager.boxArchiveComics));
});

final archiveTaskStorageProvider = Provider<IArchiveTaskStorage>((ref) {
  return HiveArchiveTaskStorage(Hive.box<dynamic>(DatabaseManager.boxArchiveTasks));
});

final mediaStorageProvider = Provider<IMediaStorage>((ref) {
  return FileSystemMediaStorage();
});
