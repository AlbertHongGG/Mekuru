import 'dart:io';
import 'dart:typed_data';

/// Interface for comic image caching on disk/storage.
abstract class IComicCacheManager {
  /// Check if the image for [providerId] and [url] is already cached and valid.
  Future<bool> isCached(String providerId, String url);

  /// Get the cached [File] if it exists and is valid (non-empty), or null.
  Future<File?> getCachedFile(String providerId, String url);

  /// Get the cached bytes if available.
  Future<Uint8List?> getCachedBytes(String providerId, String url);

  /// Atomically write [bytes] into cache for [providerId] and [url].
  Future<File> putBytes(String providerId, String url, Uint8List bytes);

  /// Remove a specific cached image.
  Future<void> remove(String providerId, String url);

  /// Clear all cached comic images.
  Future<void> clearAll();

  /// Generate a unique cache key based on [providerId] and [url].
  String getCacheKey(String providerId, String url);
}
