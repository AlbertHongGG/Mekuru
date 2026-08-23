import 'package:dio/dio.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/data/sources/base_comic_provider.dart';
import 'package:mekuru/data/sources/copymanga/copymanga_api_client.dart';
import 'package:mekuru/data/sources/copymanga/copymanga_auth_interceptor.dart';
import 'package:mekuru/data/sources/copymanga/copymanga_signer.dart';
import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_result.dart';

class CopymangaProvider extends BaseComicProvider {
  static const String _id = 'copymanga';
  static const String _name = 'Copymanga';
  
  late final CopymangaApiClient _apiClient;
  final CopymangaSigner _signer;

  CopymangaProvider() : _signer = CopymangaSigner() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.copy202601.com/api/v3',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(CopymangaAuthInterceptor(_signer));
    
    _apiClient = CopymangaApiClient(dio);
  }

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  @override
  Map<String, String>? get imageHeaders => {
    'User-Agent': 'COPY/3.0.9'
  };

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    return handleApiCall(() async {
      final response = await _apiClient.getComicDetail(comicId);
      if (response.results?.comic == null) {
        throw ServerException('Comic detail not found for $comicId');
      }
      
      final comic = response.results!.comic;
      
      final authors = comic.author.map((a) => a.name).toList();
      final authorStr = authors.isNotEmpty ? authors.join(', ') : '';
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
}
