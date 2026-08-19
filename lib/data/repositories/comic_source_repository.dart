import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_result.dart';
import 'package:mekuru/data/sources/provider_registry.dart';

import 'package:mekuru/data/repositories/i_comic_repository.dart';

class ComicSourceRepository implements IComicRepository {
  final ProviderRegistry _registry;

  ComicSourceRepository(this._registry);

  @override
  Future<PaginatedResult<ComicExploreResult>> exploreComics(String providerId, int page) async {
    final provider = _registry.getProvider(providerId);
    return provider.exploreComics(page);
  }

  @override
  Future<PaginatedResult<ComicSearchResult>> searchComics(String providerId, String keyword, int page) async {
    final provider = _registry.getProvider(providerId);
    return provider.searchComics(keyword, page);
  }

  @override
  Future<ComicDetail> getComic(String providerId, String comicId) async {
    final provider = _registry.getProvider(providerId);
    return provider.getComicDetail(comicId);
  }

  @override
  Future<PaginatedResult<Chapter>> getChapters(String providerId, String comicId, int page, {bool isDescending = true}) async {
    return _registry.getProvider(providerId).getChapterList(comicId, page, isDescending: isDescending);
  }

  @override
  Future<List<ComicPage>> getChapterImages(String providerId, String comicId, String chapterId) async {
    return _registry.getProvider(providerId).getChapterImages(comicId, chapterId);
  }
}

final comicSourceRepositoryProvider = Provider<ComicSourceRepository>((ref) {
  return ComicSourceRepository(ref.watch(providerRegistryProvider));
});
