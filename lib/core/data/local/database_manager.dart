import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/hive_adapters.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/data/local/models/favorite_entity.dart';
import 'package:mekuru/core/data/local/models/history_entity.dart';
import 'package:mekuru/features/logger/domain/models/log_entry.dart';

class DatabaseManager {
  static const String boxSettings = 'box_settings';
  static const String boxTags = 'box_tags';
  static const String boxComicMetadata = 'box_comic_metadata';
  static const String boxUserFavorites = 'box_user_favorites';
  static const String boxReadingHistory = 'box_reading_history';
  static const String boxSystemLogs = 'box_system_logs';
  static const String boxApiLogs = 'box_api_logs';

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register all manual adapters
    HiveAdapters.registerAll();

    // Safely open all required boxes
    await _safeOpenBox<dynamic>(boxSettings);
    await _safeOpenBox<dynamic>(boxTags);
    await _safeOpenBox<ComicMetadataEntity>(boxComicMetadata);
    await _safeOpenBox<FavoriteEntity>(boxUserFavorites);
    await _safeOpenBox<HistoryEntity>(boxReadingHistory);
    await _safeOpenBox<LogEntry>(boxSystemLogs);
    await _safeOpenBox<LogEntry>(boxApiLogs);
    await _runProviderRenameMigration();
  }

  static Future<void> _runProviderRenameMigration() async {
    final metaBox = Hive.box<ComicMetadataEntity>(boxComicMetadata);
    final histBox = Hive.box<HistoryEntity>(boxReadingHistory);
    final favBox = Hive.box<FavoriteEntity>(boxUserFavorites);

    for (final key in metaBox.keys.toList()) {
      final strKey = key.toString();
      if (strKey.contains('_comicwifi_') || strKey.contains('_copymanga_')) {
        final newKey = strKey.replaceAll('_comicwifi_', '_comicwf_').replaceAll('_copymanga_', '_copymg_');
        final val = metaBox.get(key);
        if (val != null) {
          final newVal = val.copyWith(
            id: val.id.replaceAll('_comicwifi_', '_comicwf_').replaceAll('_copymanga_', '_copymg_'),
            providerId: val.providerId.replaceAll('comicwifi', 'comicwf').replaceAll('copymanga', 'copymg'),
          );
          await metaBox.put(newKey, newVal);
          await metaBox.delete(key);
        }
      }
    }

    for (final key in histBox.keys.toList()) {
      final strKey = key.toString();
      if (strKey.contains('_comicwifi_') || strKey.contains('_copymanga_')) {
        final newKey = strKey.replaceAll('_comicwifi_', '_comicwf_').replaceAll('_copymanga_', '_copymg_');
        final val = histBox.get(key);
        if (val != null) {
          await histBox.put(newKey, val);
          await histBox.delete(key);
        }
      }
    }

    for (final key in favBox.keys.toList()) {
      final strKey = key.toString();
      if (strKey.contains('_comicwifi_') || strKey.contains('_copymanga_')) {
        final newKey = strKey.replaceAll('_comicwifi_', '_comicwf_').replaceAll('_copymanga_', '_copymg_');
        final val = favBox.get(key);
        if (val != null) {
          await favBox.put(newKey, val);
          await favBox.delete(key);
        }
      }
    }
  }

  static Future<void> _safeOpenBox<T>(String boxName) async {
    try {
      await Hive.openBox<T>(boxName);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to open box $boxName, deleting to start fresh: $e');
      }
      await Hive.deleteBoxFromDisk(boxName);
      await Hive.openBox<T>(boxName);
    }
  }

  static Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(boxSettings);
    await Hive.deleteBoxFromDisk(boxTags);
    await Hive.deleteBoxFromDisk(boxComicMetadata);
    await Hive.deleteBoxFromDisk(boxUserFavorites);
    await Hive.deleteBoxFromDisk(boxReadingHistory);
    await Hive.deleteBoxFromDisk(boxSystemLogs);
    await Hive.deleteBoxFromDisk(boxApiLogs);
  }
}
