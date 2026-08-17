import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_comics.dart';

abstract class IComicRepository {
  Future<PaginatedComics> explore({String? providerId, int page = 1});
  Future<PaginatedComics> search(String keyword, {String? providerId, int page = 1});
  Future<Comic> getComic(String providerId, String comicId);
  Future<List<Chapter>> getChapters(String providerId, String comicId);
  Future<List<ComicPage>> getChapterImages(String providerId, String comicId, String chapterId);
}
