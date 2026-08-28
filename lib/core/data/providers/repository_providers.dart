import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/comic/domain/repositories/i_comic_repository.dart';
import 'package:mekuru/features/comic/data/repositories/comic_source_repository.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';

final comicRepositoryProvider = Provider<IComicRepository>((ref) {
  final registry = ref.watch(providerRegistryProvider);
  return ComicSourceRepository(registry);
});
