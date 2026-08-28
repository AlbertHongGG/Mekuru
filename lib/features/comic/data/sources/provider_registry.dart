import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/network/api_client.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';
import 'package:mekuru/features/comic/data/sources/comicwf/comicwf_provider.dart';
import 'package:mekuru/features/comic/data/sources/webtoon/webtoon_provider.dart';
import 'package:mekuru/features/comic/data/sources/copymg/copymg_provider.dart';
import 'package:mekuru/features/comic/data/sources/manwa/manwa_provider.dart';
import 'package:mekuru/features/comic/data/sources/guazi/guazi_provider.dart';
import 'package:mekuru/core/data/local/local_storage_providers.dart';
import 'package:mekuru/features/archive/domain/managers/local_library_manager.dart';
import 'package:mekuru/features/archive/data/providers/local_provider.dart';

class ProviderRegistry {
  final Map<String, IComicProvider> _providers = {};

  void register(IComicProvider provider) {
    _providers[provider.providerId] = provider;
    for (final alias in provider.aliases) {
      _providers[alias] = provider;
    }
  }

  IComicProvider getProvider(String providerId) {
    final provider = _providers[providerId];
    if (provider == null) {
      throw Exception('Provider with id $providerId not found in registry');
    }
    return provider;
  }

  List<IComicProvider> getAllProviders() {
    return _providers.values.toSet().toList();
  }
}

// Riverpod provider for the registry
final providerRegistryProvider = Provider<ProviderRegistry>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final libManager = ref.watch(localLibraryManagerProvider);
  final mediaStorage = ref.watch(mediaStorageProvider);
  
  return ProviderRegistry()
    ..register(ComicWFProvider(apiClient))
    ..register(WebtoonProvider(apiClient))
    ..register(CopyMGProvider(apiClient))
    ..register(ManwaProvider(apiClient))
    ..register(GuaziProvider(apiClient))
    ..register(LocalProvider(libManager, mediaStorage));
});
