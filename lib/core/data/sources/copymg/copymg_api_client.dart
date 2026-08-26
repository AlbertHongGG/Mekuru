import 'package:dio/dio.dart';
import 'package:mekuru/core/data/sources/copymg/models/copymg_models.dart';
import 'package:mekuru/core/data/sources/base_comic_provider.dart';

class CopyMGApiClient {
  final Dio _dio;

  CopyMGApiClient(this._dio);

  void _checkResponse(Map<String, dynamic> data) {
    if (data['code'] != 200) {
      throw ServerException(data['message'] ?? '未知錯誤');
    }
  }

  Future<CopyMGResponse<CmExploreResult>> getExploreComics({
    int limit = 18,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      '/comics',
      queryParameters: {
        'limit': limit,
        'offset': offset,
        'free_type': 1,
        'ordering': '-datetime_updated',
        'theme': '',
        'top': '',
      },
      options: Options(extra: {'actionType': 'Explore'}),
    );
    _checkResponse(response.data);
    return CopyMGResponse<CmExploreResult>.fromJson(
      response.data,
      (json) => CmExploreResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopyMGResponse<CmDetailResult>> getComicDetail(String pathWord) async {
    final response = await _dio.get(
      '/comic2/$pathWord',
      options: Options(extra: {'actionType': 'Detail'}),
    );
    _checkResponse(response.data);
    return CopyMGResponse<CmDetailResult>.fromJson(
      response.data,
      (json) => CmDetailResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopyMGResponse<CmChapterListResult>> getChapterList(
    String pathWord, {
    int limit = 100,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      '/comic/$pathWord/group/default/chapters',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
      options: Options(extra: {'actionType': 'Chapters'}),
    );
    _checkResponse(response.data);
    return CopyMGResponse<CmChapterListResult>.fromJson(
      response.data,
      (json) => CmChapterListResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopyMGResponse<CmChapterImageResult>> getChapterImages(
    String pathWord,
    String chapterUuid,
  ) async {
    final response = await _dio.get(
      '/comic/$pathWord/chapter2/$chapterUuid',
      options: Options(extra: {'actionType': 'Images'}),
    );
    _checkResponse(response.data);
    return CopyMGResponse<CmChapterImageResult>.fromJson(
      response.data,
      (json) => CmChapterImageResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopyMGResponse<CmSearchResult>> searchComics(
    String keyword, {
    int limit = 18,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      '/search/comic',
      queryParameters: {
        'limit': limit,
        'offset': offset,
        'q_type': '',
        'q': keyword,
      },
      options: Options(extra: {'actionType': 'Search'}),
    );
    _checkResponse(response.data);
    return CopyMGResponse<CmSearchResult>.fromJson(
      response.data,
      (json) => CmSearchResult.fromJson(json as Map<String, dynamic>),
    );
  }
}
