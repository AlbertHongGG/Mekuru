import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/paginated_result.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/core/error/result.dart';

/// The standard contract that ALL comic providers must implement.
abstract class IComicProvider {
  /// A unique identifier for this provider (e.g., 'comicwifi', 'webtoon').
  String get providerId;

  /// A human-readable name for this provider (e.g., 'ComicWifi Official').
  String get providerName;

  /// Headers required to fetch images from this provider (e.g., Referer).
  Map<String, String>? get imageHeaders => null;

  /// Fetch basic details and metadata for a specific comic.
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId);

  /// Fetch a list of all chapters for a comic.
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true});

  /// Fetch the actual image pages for a specific chapter.
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String comicId, String chapterId);

  /// Search for comics matching a keyword.
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page);

  /// Explore/discover comics from the provider.
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page);
}
