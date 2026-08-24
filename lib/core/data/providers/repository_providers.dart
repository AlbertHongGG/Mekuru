import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/core/data/repositories/i_comic_repository.dart';
import 'package:mekuru/core/data/repositories/comic_source_repository.dart';
import 'package:mekuru/core/data/repositories/comic_library_repository.dart';
import 'package:mekuru/core/data/sources/provider_registry.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';

final comicRepositoryProvider = Provider<IComicRepository>((ref) {
  final settings = ref.watch(settingsProvider);
  final apiClient = ref.read(apiClientProvider);

  if (settings.dataSourceMode == DataSourceMode.db) {
    return ComicLibraryRepository(apiClient.dio);
  } else {
    final registry = ref.watch(providerRegistryProvider);
    return ComicSourceRepository(registry);
  }
});
