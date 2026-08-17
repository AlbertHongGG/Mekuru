import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_comics.dart';
import 'package:mekuru/data/repositories/i_comic_repository.dart';

class ComicLibraryRepository implements IComicRepository {
  final Dio _dio;

  ComicLibraryRepository(this._dio);

  @override
  Future<PaginatedComics> explore({String? providerId, int page = 1}) async {
    final response = await _dio.get('/api/v1/library/explore');
    final data = response.data as List;
    final comics = data.map((json) => Comic.fromJson(json)).toList();
    
    return PaginatedComics(
      comics: comics,
      page: 1,
      hasNext: false,
    );
  }

  @override
  Future<PaginatedComics> search(String keyword, {String? providerId, int page = 1}) async {
    final response = await _dio.get('/api/v1/library/search', queryParameters: {
      'keyword': keyword,
    });
    
    final data = response.data as List;
    final comics = data.map((json) => Comic.fromJson(json)).toList();
    
    return PaginatedComics(
      comics: comics,
      page: 1,
      hasNext: false,
    );
  }

  @override
  Future<Comic> getComic(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId');
    return Comic.fromJson(response.data);
  }

  @override
  Future<List<Chapter>> getChapters(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters');
    final data = response.data as List;
    return data.map((json) => Chapter.fromJson(json)).toList();
  }

  @override
  Future<List<ComicPage>> getChapterImages(String providerId, String comicId, String chapterId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters/$chapterId/images');
    final data = response.data as List;
    return data.map((json) => ComicPage.fromJson(json)).toList();
  }
}

final comicLibraryRepositoryProvider = Provider<ComicLibraryRepository>((ref) {
  return ComicLibraryRepository(ref.watch(dioProvider));
});
