import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mekuru/core/cache/comic_image_pipeline.dart';
import 'package:mekuru/core/cache/i_comic_cache_manager.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';
import 'package:mekuru/features/comic/domain/models/chapter.dart';
import 'package:mekuru/features/comic/domain/models/comic_models.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';
import 'package:mekuru/features/comic/domain/models/paginated_result.dart';
import 'dart:io';

class MockCacheManager implements IComicCacheManager {
  final Map<String, Uint8List> memoryStorage = {};

  @override
  String getCacheKey(String providerId, String url) => '$providerId:$url';

  @override
  Future<bool> isCached(String providerId, String url) async {
    return memoryStorage.containsKey(getCacheKey(providerId, url));
  }

  @override
  Future<File?> getCachedFile(String providerId, String url) async => null;

  @override
  Future<Uint8List?> getCachedBytes(String providerId, String url) async {
    return memoryStorage[getCacheKey(providerId, url)];
  }

  @override
  Future<File> putBytes(String providerId, String url, Uint8List bytes) async {
    memoryStorage[getCacheKey(providerId, url)] = bytes;
    return File('');
  }

  @override
  Future<void> remove(String providerId, String url) async {
    memoryStorage.remove(getCacheKey(providerId, url));
  }

  @override
  Future<void> clearAll() async {
    memoryStorage.clear();
  }
}

class MockComicProvider implements IComicProvider {
  int fetchCallCount = 0;

  @override
  String get providerId => 'mock_provider';
  @override
  List<String> get aliases => [];
  @override
  String get providerName => 'Mock';

  @override
  Future<Uint8List> fetchImageBytes(String url, {CancelToken? cancelToken}) async {
    fetchCallCount++;
    for (int i = 0; i < 5; i++) {
      if (cancelToken != null && cancelToken.isCancelled) {
        throw DioException(
          requestOptions: RequestOptions(path: url),
          type: DioExceptionType.cancel,
          error: cancelToken.cancelError,
        );
      }
      await Future.delayed(const Duration(milliseconds: 10));
    }
    return Uint8List.fromList(List.filled(200, 1));
  }

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async => throw UnimplementedError();
  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true}) async => throw UnimplementedError();
  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String comicId, String chapterId) async => throw UnimplementedError();
  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page) async => throw UnimplementedError();
  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page) async => throw UnimplementedError();
}

void main() {
  late MockCacheManager mockCache;
  late MockComicProvider mockProvider;
  late ComicImagePipeline pipeline;

  setUp(() {
    mockCache = MockCacheManager();
    mockProvider = MockComicProvider();
    pipeline = ComicImagePipeline(cacheManager: mockCache);
  });

  test('ComicImagePipeline deduplicates concurrent in-flight requests for the same URL', () async {
    const testUrl = 'https://example.com/image_1.jpg';

    // Launch 5 simultaneous requests for the exact same URL
    final futures = List.generate(5, (_) => pipeline.getImageBytes(provider: mockProvider, url: testUrl));
    final results = await Future.wait(futures);

    // Verify all received valid bytes
    for (final res in results) {
      expect(res.length, 200);
    }

    // Verify network fetch was only called ONCE
    expect(mockProvider.fetchCallCount, 1);

    // Verify it was stored in disk cache
    expect(mockCache.memoryStorage.containsKey('mock_provider:$testUrl'), isTrue);
  });

  test('ComicImagePipeline serves directly from cache on subsequent calls without hitting provider', () async {
    const testUrl = 'https://example.com/image_cached.jpg';
    mockCache.memoryStorage['mock_provider:$testUrl'] = Uint8List.fromList(List.filled(150, 9));

    final bytes = await pipeline.getImageBytes(provider: mockProvider, url: testUrl);

    expect(bytes.length, 150);
    expect(mockProvider.fetchCallCount, 0); // zero network requests
  });

  test('Cancellation Shielding: cancelling a preloader subscriber does NOT cancel active UI subscribers', () async {
    const testUrl = 'https://example.com/image_shield.jpg';
    final preloaderToken = CancelToken();

    // 1. Preloader starts downloading image
    final preloaderFuture = pipeline.getImageBytes(
      provider: mockProvider,
      url: testUrl,
      cancelToken: preloaderToken,
    );

    // 2. UI starts awaiting the exact same image with NO cancelToken
    final uiFuture = pipeline.getImageBytes(
      provider: mockProvider,
      url: testUrl,
      cancelToken: null,
    );

    // 3. Preloader cancels its token mid-flight
    await Future.delayed(const Duration(milliseconds: 10));
    preloaderToken.cancel('Preloader moved away');

    // 4. Preloader future must fail with cancellation
    expect(preloaderFuture, throwsA(isA<DioException>()));

    // 5. UI future MUST succeed and receive valid bytes!
    final uiBytes = await uiFuture;
    expect(uiBytes.length, 200);

    // 6. Disk cache was successfully populated
    expect(mockCache.memoryStorage.containsKey('mock_provider:$testUrl'), isTrue);
  });

  test('purgeAndRefetch removes corrupted cache and fetches fresh bytes', () async {
    const testUrl = 'https://example.com/image_corrupt.jpg';
    // Seed corrupted bytes in cache
    mockCache.memoryStorage['mock_provider:$testUrl'] = Uint8List.fromList([1, 2, 3]);

    final freshBytes = await pipeline.purgeAndRefetch(provider: mockProvider, url: testUrl);

    expect(freshBytes.length, 200);
    expect(mockProvider.fetchCallCount, 1);
    expect(mockCache.memoryStorage['mock_provider:$testUrl']?.length, 200);
  });
}
