import 'package:dio/dio.dart';
import 'package:mekuru/data/sources/i_comic_provider.dart';
import 'package:mekuru/data/sources/comicwifi/comicwifi_api_client.dart';
import 'package:mekuru/data/sources/comicwifi/comicwifi_auth_interceptor.dart';
import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_result.dart';

class ComicWifiProvider implements IComicProvider {
  static const String _id = 'comicwifi';
  static const String _name = 'ComicWifi Official';
  
  late final ComicWifiApiClient _apiClient;

  ComicWifiProvider() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.comicwifi.com',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          "accept": "application/json",
          "accept-charset": "UTF-8",
          "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
          "user-agent": "ktor-client",
          "deviceid": "2c9b9cb61659a16b",
          "language": "zh",
          "device_language": "zh",
          "time-zone": "GMT+08:00",
          "lower-flow": "No",
          "appversion": "1.1.1",
          "appversioncode": "111",
          "channelno": "3",
          "appchannel": "3",
          "appid": "6",
          "imei": "",
          "osv": "13",
          "model": "SM-A326BR",
          "brand": "samsung",
          "make": "samsung",
          "mac": "",
          "sw": "720",
          "sh": "1445",
          "os": "1",
          "net-work": "0",
          "oaid": "",
          "userid": "-1",
          "token": "",
          "isvpn": "",
          "languagecode": "",
          "accept-encoding": "gzip",
        },
      ),
    );
    dio.interceptors.add(ComicWifiAuthInterceptor());
    // Error handling interceptor can be added here if needed to parse their custom logic errors
    
    _apiClient = ComicWifiApiClient(dio);
  }

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  @override
  Map<String, String>? get imageHeaders => null;

  @override
  Future<ComicDetail> getComicDetail(String comicId) async {
    final rawDetail = await _apiClient.getComicDetail(comicId);
    return ComicDetail(
      comicId: rawDetail.id,
      providerId: _id,
      title: rawDetail.name ?? 'Unknown Title',
      coverUrl: rawDetail.cover ?? '',
      description: rawDetail.desc ?? '',
      tags: rawDetail.tags ?? [],
      status: rawDetail.trace ?? '',
    );
  }

  @override
  Future<List<Chapter>> getChapterList(String comicId, {bool isDescending = true}) async {
    final pageSize = 999999;
    final rawList = await _apiClient.getChapterList(
      comicId, 
      1, 
      pageSize: pageSize, 
      order: isDescending ? 'desc' : 'asc'
    );
    final List<Chapter> chapters = [];
    for (int i = 0; i < rawList.chapters.length; i++) {
      final ch = rawList.chapters[i];
      chapters.add(Chapter(
        id: ch.chapterId.toString(),
        title: ch.chapterName ?? 'Chapter ${i + 1}',
        publishedAt: ch.createTime ?? '',
      ));
    }
    return chapters;
  }

  @override
  Future<List<ComicPage>> getChapterImages(String comicId, String chapterId) async {
    final rawImages = await _apiClient.getChapterImages(comicId, chapterId);
    final List<ComicPage> pages = [];
    for (int i = 0; i < rawImages.imgs.length; i++) {
      final img = rawImages.imgs[i];
      pages.add(ComicPage(
        imageUrl: img.url,
        index: i,
      ));
    }
    return pages;
  }

  @override
  Future<PaginatedResult<ComicSearchResult>> searchComics(String keyword, int page) async {
    final items = await _apiClient.searchComics(keyword, page);
    final comics = items.map((e) => ComicSearchResult(
      comicId: e.moduleItem.id,
      providerId: _id,
      title: e.moduleItem.name,
      coverUrl: e.moduleItem.cover,
      tags: e.moduleItem.tags,
    )).toList();
    
    return PaginatedResult<ComicSearchResult>(
      items: comics,
      page: page,
      hasNext: comics.length == 30,
    );
  }

  @override
  Future<PaginatedResult<ComicExploreResult>> exploreComics(int page) async {
    final items = await _apiClient.exploreComics(page);
    final comics = items.map((e) => ComicExploreResult(
      comicId: e.moduleItem.id,
      providerId: _id,
      title: e.moduleItem.name,
      coverUrl: e.moduleItem.cover,
      tags: e.moduleItem.tags,
    )).toList();

    return PaginatedResult<ComicExploreResult>(
      items: comics,
      page: page,
      hasNext: comics.length == 30,
    );
  }
}
