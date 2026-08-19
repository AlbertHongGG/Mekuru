import 'package:dio/dio.dart';
import 'package:mekuru/data/sources/webtoon/models/webtoon_models.dart';

class WebtoonApiClient {
  final Dio _dio;

  WebtoonApiClient(this._dio);

  Map<String, dynamic> _extractResult(Response response) {
    final Map<String, dynamic> rawJson = response.data is String 
        ? {} // handle parsing if needed, but Dio should return map
        : response.data as Map<String, dynamic>;
        
    final message = rawJson['message'] as Map<String, dynamic>? ?? {};
    final code = message['code'];
    
    if (code != null && code != 200 && code != '0' && code != 0) {
      final errMsg = message['message'] ?? 'Unknown Webtoon API Error';
      throw Exception('Webtoon API Error: $errMsg (Code: $code)');
    }
    
    final result = message['result'];
    if (result == null) {
      return message;
    }
    return result as Map<String, dynamic>;
  }

  Future<WtSearchResult> searchAllV2(String query, {int startIndex = 1, int pageSize = 30}) async {
    final response = await _dio.get('/lineWebtoon/webtoon/searchAllV2', queryParameters: {
      'query': query,
      'startIndex': startIndex,
      'pageSize': pageSize,
      'v': '1',
    });
    return WtSearchResult.fromJson(_extractResult(response));
  }

  Future<WtTrendingChartResult> trendingChartTitles({int size = 30}) async {
    final response = await _dio.get('/lineWebtoon/webtoon/trendingChartTitles.json', queryParameters: {
      'size': size,
      'v': '1',
    });
    return WtTrendingChartResult.fromJson(_extractResult(response));
  }

  Future<WtTitleHomeResult> titleHomeMainV3(int titleNo) async {
    final response = await _dio.get('/lineWebtoon/webtoon/titleHomeMainV3', queryParameters: {
      'titleNo': titleNo,
      'v': '1',
    });
    return WtTitleHomeResult.fromJson(_extractResult(response));
  }

  Future<WtEpisodeListResult> titleHomeEpisodeListV3(int titleNo, {int offset = 0, int pageSize = 30, String ordering = 'OLDEST'}) async {
    final response = await _dio.get('/lineWebtoon/webtoon/titleHomeEpisodeListV3', queryParameters: {
      'titleNo': titleNo,
      'offset': offset,
      'pageSize': pageSize,
      'ordering': ordering,
      'v': '1',
    });
    return WtEpisodeListResult.fromJson(_extractResult(response));
  }

  Future<WtEpisodeInfoResult> episodeInfoWithLogin(int titleNo, int episodeNo) async {
    final response = await _dio.get('/lineWebtoon/webtoon/episodeInfoWithLogin.json', queryParameters: {
      'titleNo': titleNo,
      'episodeNo': episodeNo,
      'priorityViewingType': 'IMAGE',
      'v': '4',
    });
    return WtEpisodeInfoResult.fromJson(_extractResult(response));
  }
}
