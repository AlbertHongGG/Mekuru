import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/models/paginated_result.dart';
import 'package:mekuru/core/data/repositories/i_comic_repository.dart';

class ComicLibraryRepository implements IComicRepository {
  final Dio _dio;

  ComicLibraryRepository(this._dio);

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(String providerId, int page) async {
    try {
      final response = await _dio.get('/api/v1/library/explore');
      final data = response.data as List;
      final comics = data.map((json) => ComicExploreResult.fromJson(json)).toList();
      
      return Success(PaginatedResult<ComicExploreResult>(
        items: comics,
        page: 1,
        hasNext: false,
      ));
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String providerId, String keyword, int page) async {
    try {
      final response = await _dio.get('/api/v1/library/search', queryParameters: {
        'keyword': keyword,
      });
      
      final data = response.data as List;
      final comics = data.map((json) => ComicSearchResult.fromJson(json)).toList();
      
      return Success(PaginatedResult<ComicSearchResult>(
        items: comics,
        page: 1,
        hasNext: false,
      ));
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<ComicDetail, Failure>> getComic(String providerId, String comicId) async {
    try {
      final response = await _dio.get('/api/v1/library/$providerId/$comicId');
      return Success(ComicDetail.fromJson(response.data));
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapters(String providerId, String comicId, {bool isDescending = true}) async {
    try {
      final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters');
      final data = response.data as List;
      var chapters = data.map((json) => Chapter.fromJson(json)).toList();
      
      if (isDescending) {
        chapters = chapters.reversed.toList();
      }
      
      return Success(chapters);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String providerId, String comicId, String chapterId) async {
    try {
      final response = await _dio.get('/api/v1/library/$providerId/$comicId/chapters/$chapterId/images');
      final data = response.data as List;
      return Success(data.map((json) => ComicPage.fromJson(json)).toList());
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}

final comicLibraryRepositoryProvider = Provider<ComicLibraryRepository>((ref) {
  return ComicLibraryRepository(ref.watch(dioProvider));
});
