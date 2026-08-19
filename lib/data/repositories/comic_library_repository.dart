import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_result.dart';
import 'package:mekuru/data/repositories/i_comic_repository.dart';

class ComicLibraryRepository implements IComicRepository {
  final Dio _dio;

  ComicLibraryRepository(this._dio);

  @override
  Future<PaginatedResult<ComicExploreResult>> exploreComics(String providerId, int page) async {
    final response = await _dio.get('/api/v1/library/explore');
    final data = response.data as List;
    final comics = data.map((json) => ComicExploreResult.fromJson(json)).toList();
    
    return PaginatedResult<ComicExploreResult>(
      items: comics,
      page: 1,
      hasNext: false,
    );
  }

  @override
  Future<PaginatedResult<ComicSearchResult>> searchComics(String providerId, String keyword, int page) async {
    final response = await _dio.get('/api/v1/library/search', queryParameters: {
      'keyword': keyword,
    });
    
    final data = response.data as List;
    final comics = data.map((json) => ComicSearchResult.fromJson(json)).toList();
    
    return PaginatedResult<ComicSearchResult>(
      items: comics,
      page: 1,
      hasNext: false,
    );
  }

  @override
  Future<ComicDetail> getComic(String providerId, String comicId) async {
    final response = await _dio.get('/api/v1/library/$providerId/$comicId');
    return ComicDetail.fromJson(response.data);
  }

  @override
  Future<PaginatedResult<Chapter>> getChapters(String providerId, String comicId, int page, {bool isDescending = true}) async {
    // Note: The Python library server currently returns all chapters at once
    final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters');
    final data = response.data as List;
    var chapters = data.map((json) => Chapter.fromJson(json)).toList();
    
    // Sort appropriately since it returns everything
    if (isDescending) {
      // Assuming they are normally ascending, we can just reverse if needed, or sort by ID/date.
      // For simplicity, we just return them. The caller can handle it, or we reverse here.
      chapters = chapters.reversed.toList();
    }

    return PaginatedResult<Chapter>(
      items: chapters,
      page: 1,
      hasNext: false,
    );
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
