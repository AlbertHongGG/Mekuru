import 'package:dio/dio.dart';
import 'package:mekuru/features/comic/data/sources/base_comic_provider.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/features/comic/domain/models/comic_models.dart';
import 'package:mekuru/features/comic/domain/models/chapter.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';
import 'package:mekuru/features/comic/domain/models/paginated_result.dart';

import 'guazi_constants.dart';
import 'guazi_interceptor.dart';
import 'guazi_api_client.dart';

class GuaziProvider extends BaseComicProvider {
  static const String _id = 'guazi';
  static const String _name = 'Guazi';

  late final GuaziApiClient _apiClient;
  late final Dio _apiDio;
  late final Dio _imageDio;

  GuaziProvider(ApiClient apiClient) {
    _apiDio = apiClient.createProviderDio(GuaziConstants.baseUrl, providerId: _id);
    _apiDio.options.headers.addAll({
      "devicetype": "android",
      "token": GuaziConstants.token,
      "user-agent": "okhttp/4.7.2",
      "accept-encoding": "gzip",
      "content-type": "application/x-www-form-urlencoded",
    });
    _apiDio.interceptors.add(GuaziInterceptor());

    _apiClient = GuaziApiClient(_apiDio);

    _imageDio = apiClient.createProviderDio('', providerId: _id);
    _imageDio.options.headers.addAll({
      "user-agent": "okhttp/4.7.2",
      "referer": "https://api.guaziapp.com",
    });
  }

  @override
  Dio get imageDio => _imageDio;

  @override
  String get providerId => _id;

  @override
  String get providerName => _name;

  String _convertTimestamp(dynamic ts) {
    if (ts == null) return '';
    try {
      int parsedTs = ts is int ? ts : int.parse(ts.toString());
      final dt = DateTime.fromMillisecondsSinceEpoch(parsedTs * 1000);
      return dt.toIso8601String();
    } catch (e) {
      return ts.toString();
    }
  }

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    return handleApiCall(() async {
      final detail = await _apiClient.getComicDetail(comicId);
      return ComicDetail(
        comicId: detail.id.toString(),
        providerId: _id,
        title: detail.name,
        coverUrl: detail.pic ?? detail.picThumb ?? '',
        author: detail.author != null && detail.author!.isNotEmpty ? detail.author! : '未知作者',
        description: detail.content ?? '',
        status: detail.serialize ?? '',
        tags: detail.categoryName != null && detail.categoryName!.isNotEmpty
            ? detail.categoryName!.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).toList()
            : [],
      );
    });
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true}) async {
    return handleApiCall(() async {
      final rawList = await _apiClient.getChapterList(comicId, sort: 'asc');
      final List<Chapter> chapters = [];
      for (final ch in rawList) {
        chapters.add(Chapter(
          id: ch.id.toString(),
          title: ch.name,
          publishedAt: _convertTimestamp(ch.addtime),
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
      final rawList = await _apiClient.getChapterImages(chapterId);
      final List<ComicPage> pages = [];
      int index = 0;
      for (final img in rawList.images) {
        if (img.img != null && img.img!.isNotEmpty) {
          pages.add(ComicPage(
            imageUrl: img.img!,
            index: index,
          ));
          index++;
        }
      }
      return pages;
    });
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page) async {
    return handleApiCall(() async {
      final result = await _apiClient.searchComics(keyword, page);
      final comics = result.list.map((e) => ComicSearchResult(
        comicId: e.id.toString(),
        providerId: _id,
        title: e.name,
        coverUrl: e.pic ?? e.picThumb ?? '',
        tags: e.categoryName != null && e.categoryName!.isNotEmpty ? e.categoryName!.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toList() : [],
      )).toList();
      
      return PaginatedResult<ComicSearchResult>(
        items: comics,
        page: page,
        hasNext: comics.length >= (result.pageSize ?? 20),
      );
    });
  }

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page) async {
    return handleApiCall(() async {
      final result = await _apiClient.exploreComics(page);
      final comics = result.list.map((e) => ComicExploreResult(
        comicId: e.id.toString(),
        providerId: _id,
        title: e.name,
        coverUrl: e.pic ?? e.picThumb ?? '',
        tags: e.categoryName != null && e.categoryName!.isNotEmpty ? e.categoryName!.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toList() : [],
      )).toList();
      
      return PaginatedResult<ComicExploreResult>(
        items: comics,
        page: page,
        hasNext: comics.length >= (result.pageSize ?? 20),
      );
    });
  }

}
