import 'dart:typed_data';

import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/paginated_result.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/models/update_check_result.dart';
import 'package:mekuru/core/data/local/models/comic_metadata_entity.dart';

/// The standard contract that ALL comic providers must implement.
abstract class IComicProvider {
  /// A unique identifier for this provider (e.g., 'comicwf', 'webtoon').
  String get providerId;

  /// A list of alternate identifiers that should resolve to this provider.
  List<String> get aliases;

  /// A human-readable name for this provider (e.g., 'ComicWF').
  String get providerName;

  /// Fetch the image bytes for a specific url using the provider's internal client.
  Future<Uint8List> fetchImageBytes(String url);

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

  /// Check for updates efficiently.
  /// Implementations should make the minimal API requests needed (e.g. only fetching the first/last page).
  Future<Result<UpdateCheckResult, Failure>> checkForUpdates(String comicId, ComicMetadataEntity currentMeta);
}
