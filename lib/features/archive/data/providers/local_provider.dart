import 'dart:io';
import 'dart:typed_data';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';
import 'package:mekuru/features/comic/domain/models/comic_models.dart';
import 'package:mekuru/features/comic/domain/models/paginated_result.dart';
import 'package:mekuru/features/comic/domain/models/chapter.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/features/archive/data/sources/archive_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mekuru/features/archive/domain/managers/i_local_library_manager.dart';

class LocalProvider implements IComicProvider {
  final ILocalLibraryManager _libraryManager;
  final IMediaStorage _mediaStorage;

  LocalProvider(this._libraryManager, this._mediaStorage);

  @override
  String get providerId => 'local';

  @override
  List<String> get aliases => [];

  @override
  String get providerName => 'local';

  @override
  Future<Uint8List> fetchImageBytes(String url) async {
    final bytes = await _mediaStorage.readImage(url);
    if (bytes == null) {
      throw Exception('Image not found: $url');
    }
    return bytes;
  }

  @override
  Future<Result<ComicDetail, Failure>> getComicDetail(String comicId) async {
    try {
      final comic = await _libraryManager.getComic(comicId);
      if (comic == null) {
        return Error(ProviderFailure('Comic not found in local library'));
      }
      return Success(ComicDetail(
        providerId: 'local',
        comicId: comic.comicId,
        title: comic.title,
        coverUrl: comic.coverUrl,
        author: comic.author,
        tags: comic.tags,
        description: comic.description,
      ));
    } catch (e) {
      return Error(ProviderFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<Chapter>, Failure>> getChapterList(String comicId, {bool isDescending = true}) async {
    try {
      final comic = await _libraryManager.getComic(comicId);
      if (comic == null) {
        return Error(ProviderFailure('Comic not found'));
      }
      final chapters = comic.chapterIds.map((id) => Chapter(id: id, title: 'Chapter $id')).toList();
      return Success(isDescending ? chapters.reversed.toList() : chapters);
    } catch (e) {
      return Error(ProviderFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<ComicPage>, Failure>> getChapterImages(String comicId, String chapterId) async {
    try {
      final comic = await _libraryManager.getComic(comicId);
      if (comic == null) return Error(ProviderFailure('Comic not found'));
      
      final base = await getApplicationDocumentsDirectory();
      final dir = Directory('${base.path}/archives/${comic.providerId}/$comicId/$chapterId');
      
      if (!await dir.exists()) {
        return Error(ProviderFailure('Chapter not downloaded completely or missing'));
      }
      
      final files = dir.listSync().whereType<File>().toList();
      files.sort((a, b) {
        final aName = a.uri.pathSegments.last.split('.').first;
        final bName = b.uri.pathSegments.last.split('.').first;
        return (int.tryParse(aName) ?? 0).compareTo((int.tryParse(bName) ?? 0));
      });
      
      final pages = files.map((f) {
        final index = int.tryParse(f.uri.pathSegments.last.split('.').first) ?? 0;
        final relPath = '${comic.providerId}/$comicId/$chapterId/${f.uri.pathSegments.last}';
        return ComicPage(index: index, imageUrl: relPath); 
      }).toList();
      
      return Success(pages);
    } catch (e) {
      return Error(ProviderFailure(e.toString()));
    }
  }

  @override
  Future<Result<PaginatedResult<ComicSearchResult>, Failure>> searchComics(String keyword, int page) async {
    return Error(ProviderFailure('Local search not supported via provider directly'));
  }

  @override
  Future<Result<PaginatedResult<ComicExploreResult>, Failure>> exploreComics(int page) async {
    try {
      final comics = await _libraryManager.getAllComics();
      // Optionally sort by archivedAt or keep natural order
      final results = comics.map((c) => ComicExploreResult(
        providerId: 'local',
        comicId: c.comicId,
        title: c.title,
        coverUrl: c.coverUrl,
      )).toList();
      
      return Success(PaginatedResult(items: results, hasNext: false, page: 1));
    } catch (e) {
      return Error(ProviderFailure(e.toString()));
    }
  }

}
