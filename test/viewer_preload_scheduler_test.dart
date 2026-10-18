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
import 'package:mekuru/features/viewer/domain/services/viewer_preload_scheduler.dart';
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
  final List<String> requestedUrls = [];
  final Map<String, CancelToken?> cancelTokens = {};

  @override
  String get providerId => 'mock_provider';
  @override
  List<String> get aliases => [];
  @override
  String get providerName => 'Mock';

  @override
  Future<Uint8List> fetchImageBytes(String url, {CancelToken? cancelToken}) async {
    requestedUrls.add(url);
    cancelTokens[url] = cancelToken;
    await Future.delayed(const Duration(milliseconds: 50));
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
  late ViewerPreloadScheduler scheduler;
  late List<ComicPage> samplePages;

  setUp(() {
    mockCache = MockCacheManager();
    mockProvider = MockComicProvider();
    pipeline = ComicImagePipeline(cacheManager: mockCache);
    scheduler = ViewerPreloadScheduler(
      pipeline: pipeline,
      maxConcurrent: 6,
      maxSpeculativeConcurrent: 3,
      aheadCount: 15,
      behindCount: 2,
      graceDistance: 4,
    );
    samplePages = List.generate(
      20,
      (i) => ComicPage(imageUrl: 'https://example.com/p_$i.jpg', index: i),
    );
  });

  tearDown(() {
    scheduler.dispose();
  });

  test('ViewerPreloadScheduler preloads upcoming pages with 6 concurrent connections', () async {
    scheduler.start(
      provider: mockProvider,
      pages: samplePages,
      initialIndex: 0,
    );

    // Yield to let the event loop start async pipeline execution
    await Future.delayed(const Duration(milliseconds: 10));

    // Initial pump should request 6 upcoming pages (p_1..p_6: immediate + high) in parallel
    expect(mockProvider.requestedUrls, contains('https://example.com/p_1.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_2.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_3.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_4.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_5.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_6.jpg'));
  });

  test('Soft-cancellation does NOT cancel in-flight tasks within graceDistance', () async {
    scheduler.start(
      provider: mockProvider,
      pages: samplePages,
      initialIndex: 0,
    );

    await Future.delayed(const Duration(milliseconds: 10));

    final token1 = mockProvider.cancelTokens['https://example.com/p_1.jpg'];
    final token2 = mockProvider.cancelTokens['https://example.com/p_2.jpg'];
    expect(token1, isNotNull);
    expect(token2, isNotNull);

    // User scrolls forward to index 3
    scheduler.updateWindow(currentIndex: 3);

    // In-flight tasks within graceDistance (4) must NOT be cancelled
    expect(token1!.isCancelled, isFalse);
    expect(token2!.isCancelled, isFalse);
  });

  test('Speculative downloads respect maxSpeculativeConcurrent quota', () async {
    // Pre-mark pages 1..6 as already cached so that immediate/high tasks resolve immediately
    for (int i = 1; i <= 6; i++) {
      mockCache.memoryStorage['mock_provider:https://example.com/p_$i.jpg'] = Uint8List.fromList(List.filled(200, 1));
    }

    scheduler.start(
      provider: mockProvider,
      pages: samplePages,
      initialIndex: 0,
    );

    await Future.delayed(const Duration(milliseconds: 15));

    // Pages 1..6 were cached, so scheduler should pump speculative pages (p_7, p_8, p_9)
    expect(mockProvider.requestedUrls, contains('https://example.com/p_7.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_8.jpg'));
    expect(mockProvider.requestedUrls, contains('https://example.com/p_9.jpg'));

    // Because maxSpeculativeConcurrent is 3, p_10 must NOT be executing concurrently yet!
    expect(mockProvider.requestedUrls, isNot(contains('https://example.com/p_10.jpg')));
  });
}
