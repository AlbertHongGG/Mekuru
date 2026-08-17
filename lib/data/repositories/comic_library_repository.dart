import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_comics.dart';

class ComicLibraryRepository {
  final Dio _dio;

  ComicLibraryRepository(this._dio);

  Future<PaginatedComics> explore() async {
    final response = await _dio.get('/api/v1/library/explore');
    final data = response.data as List;
    final comics = data.map((json) => Comic.fromJson(json)).toList();
    
    return PaginatedComics(
      comics: comics,
      page: 1,
      hasNext: false,
    );
  }

  Future<PaginatedComics> search(String keyword) async {
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

  Future<Comic> getComic(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId');
    return Comic.fromJson(response.data);
  }

  Future<List<Chapter>> getChapters(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters');
    final data = response.data as List;
    return data.map((json) => Chapter.fromJson(json)).toList();
  }

  Future<List<ComicPage>> getChapterImages(String providerId, String comicId, String chapterId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters/$chapterId/images');
    final data = response.data as List;
    return data.map((json) => ComicPage.fromJson(json)).toList();
  }
}

final comicLibraryRepositoryProvider = Provider<ComicLibraryRepository>((ref) {
  return ComicLibraryRepository(ref.watch(dioProvider));
});
