import 'package:dio/dio.dart';
import 'package:mekuru/features/comic/data/sources/guazi/models/guazi_models.dart';
import 'guazi_crypto.dart';

class GuaziApiClient {
  final Dio _dio;

  GuaziApiClient(this._dio);

  Future<GuaziComicDetail> getComicDetail(String comicId) async {
    final response = await _dio.get(
      '/index.php/api/v2/mcomic/detail',
      queryParameters: {'id': comicId},
      options: Options(extra: {'actionType': 'Detail'}),
    );
    return GuaziComicDetail.fromJson(response.data['data']);
  }

  Future<List<GuaziChapterItem>> getChapterList(String comicId, {String sort = 'asc'}) async {
    final response = await _dio.post(
      '/index.php/api/v2/mcomic/chapter',
      data: {
        'id': comicId,
        'sort': sort,
      },
      options: Options(extra: {'actionType': 'Chapters'}),
    );
    
    final data = response.data['data'];
    if (data is List) {
      return data.map((e) => GuaziChapterItem.fromJson(e)).toList();
    }
    return [];
  }

  Future<GuaziImageList> getChapterImages(String chapterId) async {
    final response = await _dio.get(
      '/index.php/api/v2/mcomic/pics',
      queryParameters: {'chapter_id': chapterId},
      options: Options(extra: {'actionType': 'Images'}),
    );
    return GuaziImageList.fromJson(response.data['data']);
  }

  Future<GuaziComicList> searchComics(String keyword, int page) async {
    final encKeyword = GuaziCrypto.encrypt(keyword);
    final response = await _dio.post(
      '/index.php/api/v2/mcomic/search',
      data: {
        'keyword': encKeyword,
        'page': page,
      },
      options: Options(extra: {'actionType': 'Search'}),
    );
    return GuaziComicList.fromJson(response.data['data']);
  }

  Future<GuaziComicList> exploreComics(int page, {int pageSize = 20}) async {
    final response = await _dio.get(
      '/index.php/api/v2/mcomic/index',
      queryParameters: {
        'page': page,
        'page_size': pageSize,
        'sort': 2,
      },
      options: Options(extra: {'actionType': 'Explore'}),
    );
    return GuaziComicList.fromJson(response.data['data']);
  }
}
