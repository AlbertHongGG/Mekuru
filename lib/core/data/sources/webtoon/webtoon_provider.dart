import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/core/data/sources/base_comic_provider.dart';
import 'package:mekuru/core/data/sources/webtoon/webtoon_api_client.dart';
import 'package:mekuru/core/data/sources/webtoon/webtoon_auth_interceptor.dart';
import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/models/paginated_result.dart';

import 'package:mekuru/core/network/api_client.dart';

class WebtoonProvider extends BaseComicProvider {
  static const String _id = 'webtoon';
  static const String _name = 'Webtoon';

  late final WebtoonApiClient _apiClient;

  WebtoonProvider(ApiClient apiClient) {
    final dio = apiClient.createProviderDio('https://global.apis.naver.com');
    dio.interceptors.add(WebtoonAuthInterceptor());
    _apiClient = WebtoonApiClient(dio);
  }

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  @override
  Map<String, String>? get imageHeaders => {
    'Referer': 'https://www.webtoons.com/',
    'User-Agent': 'nApps (Android 9; 22081212C; linewebtoon; 3.9.9)',
  };

  String _getFullImageUrl(String? uri) {
    if (uri == null || uri.isEmpty) return '';
    if (uri.startsWith('http')) return uri;
    return 'https://webtoon-phinf.pstatic.net$uri';
  }

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    return handleApiCall(() async {
      final titleNo = int.parse(comicId);
      final dto = await _apiClient.titleHomeMainV3(titleNo);
      
      final authors = dto.title.authorList.map((e) => e.authorName).toList();
      final authorStr = authors.isNotEmpty ? authors.join(', ') : null;
      
      final List<String> tags = [];
      String status = '';
      
      if (dto.tag != null && dto.tag!.tagList.isNotEmpty) {
        for (final tag in dto.tag!.tagList) {
          if (tag.type.toUpperCase().contains('STATUS')) {
            status = tag.text;
          } else {
            tags.add(tag.text);
          }
        }
      }
      
      return ComicDetail(
        comicId: comicId,
        providerId: _id,
        title: dto.title.title,
        coverUrl: _getFullImageUrl(dto.title.posterThumbnailUrl),
        author: authorStr,
        description: dto.title.synopsis,
        tags: tags,
        status: status,
      );
    });
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true}) async {
    return handleApiCall(() async {
      final titleNo = int.parse(comicId);
      final pageSize = 30;
      final ordering = isDescending ? 'LATEST' : 'OLDEST';
      
      final List<Chapter> allChapters = [];
      int offset = 0;
      bool hasMore = true;

      while (hasMore) {
        final dto = await _apiClient.titleHomeEpisodeListV3(
          titleNo, 
          offset: offset, 
          pageSize: pageSize, 
          ordering: ordering,
        );
        
        for (final ep in dto.episodeList) {
          String? pubTime;
          if (ep.exposureYmdt != null) {
            pubTime = DateTime.fromMillisecondsSinceEpoch(ep.exposureYmdt!).toString().split(' ')[0];
          }
          
          allChapters.add(Chapter(
            id: ep.episodeNo.toString(),
            title: ep.episodeTitle,
            publishedAt: pubTime,
          ));
        }

        hasMore = dto.episodeList.length == pageSize;
        offset += pageSize;
      }
      
      return allChapters;
    });
  }

  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String comicId, String chapterId) async {
    return handleApiCall(() async {
      final titleNo = int.parse(comicId);
      final epNo = int.parse(chapterId);
      
      final dto = await _apiClient.episodeInfoWithLogin(titleNo, epNo);
      
      final List<ComicPage> pages = [];
      for (int i = 0; i < dto.episodeInfo.imageInfo.length; i++) {
        pages.add(ComicPage(
          imageUrl: _getFullImageUrl(dto.episodeInfo.imageInfo[i].url),
          index: i,
        ));
      }
      return pages;
    });
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page) async {
    return handleApiCall(() async {
      final pageSize = 30;
      final startIndex = (page - 1) * pageSize + 1;
      final dto = await _apiClient.searchAllV2(keyword, startIndex: startIndex, pageSize: pageSize);
      
      final comics = dto.webtoonSearch.titleList.map((e) => ComicSearchResult(
        comicId: e.titleNo.toString(),
        providerId: _id,
        title: null,
        coverUrl: _getFullImageUrl(e.thumbnailUrl),
      )).toList();
      
      return PaginatedResult<ComicSearchResult>(
        items: comics,
        page: page,
        hasNext: dto.webtoonSearch.hasMore,
      );
    });
  }

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page) async {
    return handleApiCall(() async {
      if (page > 1) {
        return PaginatedResult<ComicExploreResult>(
          items: [],
          page: page,
          hasNext: false,
        );
      }

      final dto = await _apiClient.trendingChartTitles(size: 30);
      
      final comics = dto.titleList.map((e) => ComicExploreResult(
        comicId: e.titleNo.toString(),
        providerId: _id,
        title: e.title,
        coverUrl: _getFullImageUrl(e.posterThumbnail),
        tags: e.genreDisplayName != null ? [e.genreDisplayName!] : [],
      )).toList();
      
      return PaginatedResult<ComicExploreResult>(
        items: comics,
        page: page,
        hasNext: false,
      );
    });
  }
}
