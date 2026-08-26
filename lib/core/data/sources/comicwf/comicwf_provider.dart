import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';
import 'package:mekuru/core/models/update_check_result.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/core/data/sources/base_comic_provider.dart';
import 'package:mekuru/core/data/sources/comicwf/comicwf_api_client.dart';
import 'package:mekuru/core/data/sources/comicwf/comicwf_auth_interceptor.dart';
import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/models/paginated_result.dart';

import 'package:dio/dio.dart';
import 'package:mekuru/core/network/api_client.dart';

class ComicWFProvider extends BaseComicProvider {
  static const String _id = 'comicwf';
  static const String _name = 'ComicWF';
  
  late final ComicWFApiClient _apiClient;
  late final Dio _apiDio;
  late final Dio _imageDio;

  ComicWFProvider(ApiClient apiClient) {
    _apiDio = apiClient.createProviderDio('https://api.comicwifi.com', providerId: _id);
    _apiDio.options.headers.addAll({
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
        });
    _apiDio.interceptors.add(ComicWFAuthInterceptor());
    
    _apiClient = ComicWFApiClient(_apiDio);

    _imageDio = apiClient.createProviderDio('', providerId: _id);
    _imageDio.options.headers.addAll({
      'Referer': 'https://comicwf.com/',
    });
  }

  @override
  Dio get imageDio => _imageDio;

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    return handleApiCall(() async {
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
    });
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true}) async {
    return handleApiCall(() async {
      final pageSize = 999999;
      final rawList = await _apiClient.getChapterList(
        comicId, 
        1, 
        pageSize: pageSize, 
        order: 'asc', // ALWAYS fetch ascending first
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
      
      if (isDescending) {
        return chapters.reversed.toList();
      }
      return chapters;
    });
  }

  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String comicId, String chapterId) async {
    return handleApiCall(() async {
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
    });
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page) async {
    return handleApiCall(() async {
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
    });
  }

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page) async {
    return handleApiCall(() async {
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
    });
  }

  @override
  Future<Result<UpdateCheckResult, Failure>> checkForUpdates(String comicId, ComicMetadataEntity currentMeta) async {
    return handleApiCall(() async {
      final rawList = await _apiClient.getChapterList(
        comicId, 
        1, 
        pageSize: 1, 
        order: 'desc',
      );
      
      final int newTotal = rawList.total;
      final int currentTotal = currentMeta.totalChapters ?? 0;
      final bool hasNew = newTotal > currentTotal;
      
      String? latestTitle;
      DateTime? latestTime;
      
      if (rawList.chapters.isNotEmpty) {
        final ch = rawList.chapters.first;
        latestTitle = ch.chapterName;
        if (ch.createTime != null && ch.createTime!.isNotEmpty) {
          latestTime = DateTime.tryParse(ch.createTime!);
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
