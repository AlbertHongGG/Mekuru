import 'package:dio/dio.dart';
import 'package:mekuru/data/sources/comicwifi/models/comicwifi_models.dart';

class ComicWifiApiClient {
  final Dio _dio;

  ComicWifiApiClient(this._dio);

  Future<CwComicDetail> getComicDetail(String comicId) async {
    final response = await _dio.post(
      '/api/comic/detail_page',
      data: {'comicId': comicId},
    );
    return CwComicDetail.fromJson(response.data['data']);
  }

  Future<CwChapterList> getChapterList(String comicId, int page, {int pageSize = 100, String order = 'asc'}) async {
    final response = await _dio.post(
      '/api/comic/chapter_list',
      data: {
        'comicId': comicId,
        'order': order,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return CwChapterList.fromJson(response.data['data']);
  }

  Future<CwChapterReadData> getChapterImages(String comicId, String chapterId) async {
    final response = await _dio.post(
      '/api/comic/read',
      data: {
        'comicId': comicId,
        'chapterId': chapterId,
      },
    );
    return CwChapterReadData.fromJson(response.data['data']);
  }

  Future<List<CwSearchResultItem>> searchComics(String keyword, int page) async {
    final response = await _dio.post(
      '/api/comic/search',
      data: {
        'key': keyword,
        'page': page,
        'pageSize': 30,
      },
    );
    final dataList = response.data['data'] as List;
    return dataList.map((e) => CwSearchResultItem.fromJson(e)).toList();
  }

  Future<List<CwSearchResultItem>> exploreComics(int page) async {
    final response = await _dio.post(
      '/api/comic/classify_list',
      data: {
        'page': page,
        'pageSize': 30,
        'labelName': '全部,人氣',
        'orderType': '',
        'label': '',
      },
    );
    final dataList = response.data['data'] as List;
    return dataList.map((e) => CwSearchResultItem.fromJson(e)).toList();
  }
}
