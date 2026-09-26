import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mekuru/core/cache/i_comic_cache_manager.dart';

class ComicDiskCacheManager implements IComicCacheManager {
  static const String _subDirectory = 'mekuru_image_cache_v3';
  static ComicDiskCacheManager? _instance;

  static ComicDiskCacheManager get instance {
    _instance ??= ComicDiskCacheManager();
    return _instance!;
  }

  Directory? _cacheDir;

  Future<Directory> _getCacheDirectory() async {
    if (_cacheDir != null && await _cacheDir!.exists()) {
      return _cacheDir!;
    }
    final tempDir = await getTemporaryDirectory();
    final dir = Directory('${tempDir.path}/$_subDirectory');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    _cacheDir = dir;
    return dir;
  }

  @override
  String getCacheKey(String providerId, String url) {
    // Combine providerId and url to prevent hash collisions across providers
    return md5.convert(utf8.encode('$providerId:$url')).toString();
  }

  /// Legacy key generator for backwards compatibility with previous caches
  String _getLegacyCacheKey(String url) {
    return md5.convert(utf8.encode(url)).toString();
  }

  @override
  Future<bool> isCached(String providerId, String url) async {
    final file = await getCachedFile(providerId, url);
    return file != null;
  }

  @override
  Future<File?> getCachedFile(String providerId, String url) async {
    try {
      final dir = await _getCacheDirectory();
      final key = getCacheKey(providerId, url);
      final file = File('${dir.path}/$key');

      if (await file.exists()) {
        final len = await file.length();
        if (len >= 100) {
          return file;
        } else {
          // File corrupted or empty, clean up
          try {
            await file.delete();
          } catch (_) {}
        }
      }

      // Check legacy single-url cache key for backward compatibility
      final legacyKey = _getLegacyCacheKey(url);
      final legacyFile = File('${dir.path}/$legacyKey');
      if (await legacyFile.exists()) {
        final len = await legacyFile.length();
        if (len >= 100) {
          return legacyFile;
        } else {
          try {
            await legacyFile.delete();
          } catch (_) {}
        }
      }
    } catch (e) {
      debugPrint('[ComicDiskCacheManager] getCachedFile error: $e');
    }
    return null;
  }

  @override
  Future<Uint8List?> getCachedBytes(String providerId, String url) async {
    final file = await getCachedFile(providerId, url);
    if (file != null) {
      try {
        final bytes = await file.readAsBytes();
        if (bytes.length >= 100) {
          return bytes;
        }
      } catch (e) {
        debugPrint('[ComicDiskCacheManager] Read bytes error: $e');
      }
    }
    return null;
  }

  @override
  Future<File> putBytes(String providerId, String url, Uint8List bytes) async {
    final dir = await _getCacheDirectory();
    final key = getCacheKey(providerId, url);
    final targetFile = File('${dir.path}/$key');
    final tempFile = File('${dir.path}/$key.${DateTime.now().microsecondsSinceEpoch}.tmp');

    // Atomic write pattern: write to unique temp file then rename
    await tempFile.writeAsBytes(bytes, flush: true);
    if (await targetFile.exists()) {
      try {
        await targetFile.delete();
      } catch (_) {}
    }
    return await tempFile.rename(targetFile.path);
  }

  @override
  Future<void> remove(String providerId, String url) async {
    try {
      final dir = await _getCacheDirectory();
      final key = getCacheKey(providerId, url);
      final file = File('${dir.path}/$key');
      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {}
  }

  @override
  Future<void> clearAll() async {
    try {
      final dir = await _getCacheDirectory();
      if (await dir.exists()) {
        await dir.delete(recursive: true);
        _cacheDir = null;
      }
    } catch (e) {
      debugPrint('[ComicDiskCacheManager] clearAll error: $e');
    }
  }
}

final comicCacheManagerProvider = Provider<IComicCacheManager>((ref) {
  return ComicDiskCacheManager.instance;
});
