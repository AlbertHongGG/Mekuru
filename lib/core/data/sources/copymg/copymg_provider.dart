import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/models/update_check_result.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/core/data/sources/base_comic_provider.dart';
import 'package:mekuru/core/data/sources/copymg/copymg_api_client.dart';
import 'package:mekuru/core/data/sources/copymg/copymg_auth_interceptor.dart';
import 'package:mekuru/core/data/sources/copymg/copymg_signer.dart';
import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/models/paginated_result.dart';

import 'package:dio/dio.dart';
import 'package:mekuru/core/network/api_client.dart';

class CopyMGProvider extends BaseComicProvider {
  static const String _id = 'copymg';
  static const String _name = 'CopyMG';
  
  late final CopyMGApiClient _apiClient;
  final CopyMGSigner _signer;

  late final Dio _apiDio;
  late final Dio _imageDio;

  CopyMGProvider(ApiClient apiClient) : _signer = CopyMGSigner() {
    _apiDio = apiClient.createProviderDio('https://api.copy202601.com/api/v3', providerId: _id);
    _apiDio.options.headers['User-Agent'] = 'COPY/3.0.9';
    _apiDio.interceptors.add(CopyMGAuthInterceptor(_signer));
    
    _apiClient = CopyMGApiClient(_apiDio);

    _imageDio = apiClient.createProviderDio('', providerId: _id);
    _imageDio.options.headers['User-Agent'] = 'COPY/3.0.9';
  }

  @override
  Dio get imageDio => _imageDio;

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  @override
  List<String> get aliases => ['copymanga'];

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    return handleApiCall(() async {
      final response = await _apiClient.getComicDetail(comicId);
      if (response.results?.comic == null) {
        throw ServerException('Comic detail not found for $comicId');
      }
      
      final comic = response.results!.comic;
      
      final authors = comic.author.map((a) => a.name).toList();
      final authorStr = authors.isNotEmpty ? authors.join(', ') : '未知作者';
      final tags = comic.theme.map((t) => t.name).toList();
      
      String statusStr = '';
      if (comic.status is Map && (comic.status as Map).containsKey('display')) {
        statusStr = (comic.status as Map)['display'].toString();
      } else if (comic.status == 0) {
        statusStr = '連載中';
      } else if (comic.status == 1) {
        statusStr = '已完結';
      }

      return ComicDetail(
        comicId: comicId,
        providerId: _id,
        title: comic.name,
        coverUrl: comic.cover,
        author: authorStr,
        description: comic.brief ?? '',
        tags: tags,
        status: statusStr,
      );
    });
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true}) async {
    return handleApiCall(() async {
      final List<Chapter> chapters = [];
      int offset = 0;
      const int limit = 100;
      
      while (true) {
        final response = await _apiClient.getChapterList(comicId, limit: limit, offset: offset);
        if (response.results == null || response.results!.list.isEmpty) {
          break;
        }
        
        for (final item in response.results!.list) {
          chapters.add(Chapter(
            id: item.uuid,
            title: item.name,
            publishedAt: item.datetimeCreated ?? '',
          ));
        }
        
        if (chapters.length >= response.results!.total) {
          break;
        }
        offset += limit;
      }
      
      // CopyMG default is ascending. Reverse it if descending is requested.
      if (isDescending) {
        return chapters.reversed.toList();
      }
      return chapters;
    });
  }

  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String comicId, String chapterId) async {
    return handleApiCall(() async {
      final response = await _apiClient.getChapterImages(comicId, chapterId);
      if (response.results?.chapter?.contents == null) {
        return [];
      }
      
      final images = response.results!.chapter!.contents;
      final List<ComicPage> pages = [];
      for (int i = 0; i < images.length; i++) {
        pages.add(ComicPage(
          imageUrl: images[i].url,
          index: i,
        ));
      }
      return pages;
    });
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page) async {
    return handleApiCall(() async {
      const pageSize = 18;
      final offset = (page - 1) * pageSize;
      
      final response = await _apiClient.searchComics(keyword, limit: pageSize, offset: offset);
      if (response.results == null) {
        return PaginatedResult<ComicSearchResult>(items: [], page: page, hasNext: false);
      }
      
      final comics = response.results!.list.map((item) => ComicSearchResult(
        comicId: item.pathWord,
        providerId: _id,
        title: item.name,
        coverUrl: item.cover,
        tags: [],
      )).toList();
      
      final total = response.results!.total;
      final hasNext = offset + comics.length < total;
      
      return PaginatedResult<ComicSearchResult>(
        items: comics,
        page: page,
        hasNext: hasNext,
      );
    });
  }

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page) async {
    return handleApiCall(() async {
      const pageSize = 18;
      final offset = (page - 1) * pageSize;
      
      final response = await _apiClient.getExploreComics(limit: pageSize, offset: offset);
      if (response.results == null) {
        return PaginatedResult<ComicExploreResult>(items: [], page: page, hasNext: false);
      }
      
      final comics = response.results!.list.map((item) => ComicExploreResult(
        comicId: item.pathWord,
        providerId: _id,
        title: item.name,
        coverUrl: item.cover,
        tags: [],
      )).toList();
      
      final total = response.results!.total;
      final hasNext = offset + comics.length < total;
      
      return PaginatedResult<ComicExploreResult>(
        items: comics,
        page: page,
        hasNext: hasNext,
      );
    });
  }

  @override
  Future<Result<UpdateCheckResult, Failure>> checkForUpdates(String comicId, ComicMetadataEntity currentMeta) async {
    return handleApiCall(() async {
      final currentTotal = currentMeta.totalChapters ?? 0;
      final offset = currentTotal > 0 ? currentTotal - 1 : 0;
      final rawList = await _apiClient.getChapterList(
        comicId,
        limit: 10,
        offset: offset,
      );
      
      final int newTotal = rawList.results?.total ?? 0;
      final bool hasNew = newTotal > currentTotal;
      
      String? latestTitle;
      DateTime? latestTime;
      
      if (rawList.results != null && rawList.results!.list.isNotEmpty) {
        final ch = rawList.results!.list.last;
        latestTitle = ch.name;
        if (ch.datetimeCreated != null && ch.datetimeCreated!.isNotEmpty) {
          latestTime = DateTime.tryParse(ch.datetimeCreated!);
        }
      }
      
      return UpdateCheckResult(
        hasNew: hasNew,
        newTotal: newTotal > 0 ? newTotal : currentTotal,
        newSourceUpdatedAt: latestTime,
        newLatestTitle: latestTitle,
      );
    });
  }

}
