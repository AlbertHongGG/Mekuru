import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_comics.dart';

/// The standard contract that ALL comic providers must implement.
abstract class IComicProvider {
  /// A unique identifier for this provider (e.g., 'comicwifi', 'webtoon').
  String get providerId;

  /// A human-readable name for this provider (e.g., 'ComicWifi Official').
  String get providerName;

  /// Headers required to fetch images from this provider (e.g., Referer).
  Map<String, String>? get imageHeaders => null;

  /// Fetch basic details and metadata for a specific comic.
  Future<Comic> getComicDetail(String comicId);

  /// Fetch the list of all available chapters for a comic.
  Future<List<Chapter>> getChapterList(String comicId);

  /// Fetch the actual image pages for a specific chapter.
  Future<List<ComicPage>> getChapterImages(String comicId, String chapterId);

  /// Search for comics matching a keyword.
  Future<PaginatedComics> searchComics(String keyword, int page);

  /// Explore/discover comics from the provider.
  Future<PaginatedComics> exploreComics(int page);
}
