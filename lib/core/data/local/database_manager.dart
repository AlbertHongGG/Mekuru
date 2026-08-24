import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/core/data/local/hive_adapters.dart';

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
    await _safeOpenBox<dynamic>(boxComicMetadata);
    await _safeOpenBox<dynamic>(boxUserFavorites);
    await _safeOpenBox<dynamic>(boxReadingHistory);
    await _safeOpenBox<dynamic>(boxSystemLogs);
    await _safeOpenBox<dynamic>(boxApiLogs);
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
