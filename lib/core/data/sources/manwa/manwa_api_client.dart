import 'package:dio/dio.dart';
import 'package:mekuru/core/data/sources/base_comic_provider.dart';
import 'models/manwa_models.dart';

class ManwaApiClient {
  final Dio _dio;

  ManwaApiClient(this._dio);

  void _checkResponse(Map<String, dynamic> data) {
    if (data['code'] != 1) {
      throw ServerException(data['msg'] ?? '未知錯誤');
    }
  }

  Future<MwResponse<MwExploreResult>> getExploreComics({
    int page = 1,
  }) async {
    final response = await _dio.get(
      '/api/classes/index',
      queryParameters: {
        'gender': 2,
        'tag': '',
        'area': 0,
        'end': 0,
        'has_full': 0,
        'level': 0,
        'st': 0,
        'page': page,
        'orderBy': 0,
      },
      options: Options(extra: {'actionType': 'Explore'}),
    );
    _checkResponse(response.data);
    return MwResponse<MwExploreResult>.fromJson(
      response.data,
      (json) => MwExploreResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<MwResponse<MwDetailResult>> getComicDetail(String id) async {
    final response = await _dio.get(
      '/api/detail/index',
      queryParameters: {'id': id},
      options: Options(extra: {'actionType': 'Detail'}),
    );
    _checkResponse(response.data);
    return MwResponse<MwDetailResult>.fromJson(
      response.data,
      (json) => MwDetailResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<MwResponse<MwChapterImageResult>> getChapterImages(String chapterId) async {
    final response = await _dio.get(
      '/api/chapters/index',
      queryParameters: {'id': chapterId, 'img_host': 0},
      options: Options(extra: {'actionType': 'Images'}),
    );
    _checkResponse(response.data);
    return MwResponse<MwChapterImageResult>.fromJson(
      response.data,
      (json) => MwChapterImageResult.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<MwResponse<MwExploreResult>> searchComics(String keyword, {int page = 1}) async {
    final response = await _dio.get(
      '/api/search/index',
      queryParameters: {'k': keyword, 'page': page},
      options: Options(extra: {'actionType': 'Search'}),
    );
    _checkResponse(response.data);
    return MwResponse<MwExploreResult>.fromJson(
      response.data,
      (json) => MwExploreResult.fromJson(json as Map<String, dynamic>),
    );
  }
}
