import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/paginated_result.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/core/error/result.dart';

abstract class IComicRepository {
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(String providerId, int page);
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String providerId, String keyword, int page);
  Future<Result<ComicDetail, Failure>> getComic(String providerId, String comicId);
  Future<Result<List<Chapter>, Failure>> getChapters(String providerId, String comicId, {bool isDescending = true});
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String providerId, String comicId, String chapterId);
}
