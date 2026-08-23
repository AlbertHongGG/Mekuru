import 'package:dio/dio.dart';
import 'package:mekuru/data/sources/copymanga/models/copymanga_models.dart';
import 'package:mekuru/data/sources/base_comic_provider.dart';

class CopymangaApiClient {
  final Dio _dio;

  CopymangaApiClient(this._dio);

  void _checkResponse(Map<String, dynamic> data) {
    if (data['code'] != 200) {
      throw ServerException(data['message'] ?? '未知錯誤');
    }
  }

  Future<CopymangaResponse<CmExploreResult>> getExploreComics({
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
    );
    _checkResponse(response.data);
    return CopymangaResponse<CmExploreResult>.fromJson(
      response.data,
      (json) => CmExploreResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopymangaResponse<CmDetailResult>> getComicDetail(String pathWord) async {
    final response = await _dio.get('/comic2/$pathWord');
    _checkResponse(response.data);
    return CopymangaResponse<CmDetailResult>.fromJson(
      response.data,
      (json) => CmDetailResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopymangaResponse<CmChapterListResult>> getChapterList(
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
    );
    _checkResponse(response.data);
    return CopymangaResponse<CmChapterListResult>.fromJson(
      response.data,
      (json) => CmChapterListResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopymangaResponse<CmChapterImageResult>> getChapterImages(
    String pathWord,
    String chapterUuid,
  ) async {
    final response = await _dio.get('/comic/$pathWord/chapter2/$chapterUuid');
    _checkResponse(response.data);
    return CopymangaResponse<CmChapterImageResult>.fromJson(
      response.data,
      (json) => CmChapterImageResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CopymangaResponse<CmSearchResult>> searchComics(
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
    );
    _checkResponse(response.data);
    return CopymangaResponse<CmSearchResult>.fromJson(
      response.data,
      (json) => CmSearchResult.fromJson(json as Map<String, dynamic>),
    );
  }
}
