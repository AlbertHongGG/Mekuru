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
