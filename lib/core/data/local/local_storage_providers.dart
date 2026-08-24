import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/database_manager.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';

final settingsBoxProvider = Provider<Box<dynamic>>((ref) {
  return Hive.box<dynamic>(DatabaseManager.boxSettings);
});

final tagsBoxProvider = Provider<Box<dynamic>>((ref) {
  return Hive.box<dynamic>(DatabaseManager.boxTags);
});

final comicMetadataBoxProvider = Provider<Box<ComicMetadataEntity>>((ref) {
  return Hive.box<ComicMetadataEntity>(DatabaseManager.boxComicMetadata);
});

final userFavoritesBoxProvider = Provider<Box<FavoriteEntity>>((ref) {
  return Hive.box<FavoriteEntity>(DatabaseManager.boxUserFavorites);
});

final readingHistoryBoxProvider = Provider<Box<HistoryEntity>>((ref) {
  return Hive.box<HistoryEntity>(DatabaseManager.boxReadingHistory);
});

final systemLogsBoxProvider = Provider<Box<dynamic>>((ref) {
  return Hive.box<dynamic>(DatabaseManager.boxSystemLogs);
});

final apiLogsBoxProvider = Provider<Box<dynamic>>((ref) {
  return Hive.box<dynamic>(DatabaseManager.boxApiLogs);
});
