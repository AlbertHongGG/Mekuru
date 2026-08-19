import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/paginated_result.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';

abstract class IComicRepository {
  Future<PaginatedResult<ComicExploreResult>> exploreComics(String providerId, int page);
  Future<PaginatedResult<ComicSearchResult>> searchComics(String providerId, String keyword, int page);
  Future<ComicDetail> getComic(String providerId, String comicId);
  Future<List<Chapter>> getChapters(String providerId, String comicId, {bool isDescending = true});
  Future<List<ComicPage>> getChapterImages(String providerId, String comicId, String chapterId);
}
