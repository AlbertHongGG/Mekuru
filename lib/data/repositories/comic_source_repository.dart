import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/domain/models/paginated_comics.dart';
import 'package:mekuru/data/repositories/i_comic_repository.dart';
import 'package:mekuru/data/sources/provider_registry.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';

class ComicSourceRepository implements IComicRepository {
  final ProviderRegistry _registry;

  ComicSourceRepository(this._registry);

  @override
  Future<PaginatedComics> explore({String? providerId, int page = 1}) async {
    final pid = providerId ?? 'comicwifi';
    return _registry.getProvider(pid).exploreComics(page);
  }

  @override
  Future<PaginatedComics> search(String keyword, {String? providerId, int page = 1}) async {
    final pid = providerId ?? 'comicwifi';
    return _registry.getProvider(pid).searchComics(keyword, page);
  }

  @override
  Future<Comic> getComic(String providerId, String comicId) async {
    return _registry.getProvider(providerId).getComicDetail(comicId);
  }

  @override
  Future<List<Chapter>> getChapters(String providerId, String comicId) async {
    return _registry.getProvider(providerId).getChapterList(comicId);
  }

  @override
  Future<List<ComicPage>> getChapterImages(String providerId, String comicId, String chapterId) async {
    return _registry.getProvider(providerId).getChapterImages(comicId, chapterId);
  }
}

final comicSourceRepositoryProvider = Provider<ComicSourceRepository>((ref) {
  return ComicSourceRepository(ref.watch(providerRegistryProvider));
});
