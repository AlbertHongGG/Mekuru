import 'package:dio/dio.dart';
import 'package:mekuru/features/comic/data/sources/comicwf/models/comicwf_models.dart';

class ComicWFApiClient {
  final Dio _dio;

  ComicWFApiClient(this._dio);

  Future<CwComicDetail> getComicDetail(String comicId) async {
    final response = await _dio.post(
      '/api/comic/detail_page',
      data: {'comicId': comicId},
      options: Options(extra: {'actionType': 'Detail'}),
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
      options: Options(extra: {'actionType': 'Chapters'}),
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
      options: Options(extra: {'actionType': 'Images'}),
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
      options: Options(extra: {'actionType': 'Search'}),
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
      options: Options(extra: {'actionType': 'Explore'}),
    );
    final dataList = response.data['data'] as List;
    return dataList.map((e) => CwSearchResultItem.fromJson(e)).toList();
  }
}
