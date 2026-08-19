import 'package:dio/dio.dart';
import 'package:mekuru/data/sources/i_comic_provider.dart';
import 'package:mekuru/data/sources/webtoon/webtoon_api_client.dart';
import 'package:mekuru/data/sources/webtoon/webtoon_auth_interceptor.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_comics.dart';

class WebtoonProvider implements IComicProvider {
  static const String _id = 'webtoon';
  static const String _name = 'Webtoon';

  late final WebtoonApiClient _apiClient;

  WebtoonProvider() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://global.apis.naver.com',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(WebtoonAuthInterceptor());
    _apiClient = WebtoonApiClient(dio);
  }

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  String _getFullImageUrl(String? uri) {
    if (uri == null || uri.isEmpty) return '';
    if (uri.startsWith('http')) return uri;
    return 'https://webtoon-phinf.pstatic.net$uri';
  }

  @override
  Future<Comic> getComicDetail(String comicId) async {
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
    
    return Comic(
      comicId: comicId,
      providerId: _id,
      title: dto.title.title,
      coverUrl: _getFullImageUrl(dto.title.posterThumbnailUrl),
      author: authorStr,
      description: dto.title.synopsis,
      tags: tags,
      status: status,
    );
  }

  @override
  Future<List<Chapter>> getChapterList(String comicId) async {
    final titleNo = int.parse(comicId);
    // Get all episodes. In real app, we might need pagination if there are many. 
    // The python code uses offset 0, page_size 30 for simplicity, we do the same or fetch more.
    final dto = await _apiClient.titleHomeEpisodeListV3(titleNo, offset: 0, pageSize: 9999);
    
    final List<Chapter> chapters = [];
    for (final ep in dto.episodeList) {
      String pubTime = '';
      if (ep.exposureYmdt != null) {
        pubTime = DateTime.fromMillisecondsSinceEpoch(ep.exposureYmdt!).toString();
      }
      
      chapters.add(Chapter(
        id: ep.episodeNo.toString(),
        title: ep.episodeTitle,
        publishTime: pubTime,
        // Webtoon thumbnails are small, so leaving blank or use specific logic
      ));
    }
    return chapters;
  }

  @override
  Future<List<ComicPage>> getChapterImages(String comicId, String chapterId) async {
    final titleNo = int.parse(comicId);
    final epNo = int.parse(chapterId);
    
    final dto = await _apiClient.episodeInfoWithLogin(titleNo, epNo);
    
    final List<ComicPage> pages = [];
    for (int i = 0; i < dto.episodeInfo.imageInfo.length; i++) {
      pages.add(ComicPage(
        imageUrl: _getFullImageUrl(dto.episodeInfo.imageInfo[i].url),
        index: i,
        headers: {
          'Referer': 'https://www.webtoons.com/',
          'User-Agent': 'nApps (Android 9; 22081212C; linewebtoon; 3.9.9)',
        },
      ));
    }
    return pages;
  }

  @override
  Future<PaginatedComics> searchComics(String keyword, int page) async {
    final pageSize = 30;
    final startIndex = (page - 1) * pageSize + 1;
    final dto = await _apiClient.searchAllV2(keyword, startIndex: startIndex, pageSize: pageSize);
    
    final comics = dto.webtoonSearch.titleList.map((e) => Comic(
      comicId: e.titleNo.toString(),
      providerId: _id,
      title: 'Comic ${e.titleNo}', // The search API might not return titles in standard form, but we can try to fetch them later or use whatever is provided
      coverUrl: _getFullImageUrl(e.thumbnailUrl),
    )).toList();
    
    return PaginatedComics(
      comics: comics,
      page: page,
      hasNext: dto.webtoonSearch.hasMore,
    );
  }

  @override
  Future<PaginatedComics> exploreComics(int page) async {
    final pageSize = 20;
    final startIndex = (page - 1) * pageSize; // 0-based for this endpoint
    final dto = await _apiClient.challengeGenreTitleListV1(startIndex: startIndex, pageSize: pageSize);
    
    final comics = dto.challengeTitleList.map((e) => Comic(
      comicId: e.titleNo.toString(),
      providerId: _id,
      title: e.readingTitle,
      coverUrl: _getFullImageUrl(e.thumbnailImageUrl),
      tags: e.representGenre != null ? [e.representGenre!.displayName] : [],
    )).toList();
    
    return PaginatedComics(
      comics: comics,
      page: page,
      hasNext: comics.length == pageSize, // Simplified logic
    );
  }
}
