import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/sources/i_comic_provider.dart';
import 'package:mekuru/core/data/sources/comicwifi/comicwifi_provider.dart';
import 'package:mekuru/core/data/sources/webtoon/webtoon_provider.dart';
import 'package:mekuru/core/data/sources/copymanga/copymanga_provider.dart';

class ProviderRegistry {
  final Map<String, IComicProvider> _providers = {};

  void register(IComicProvider provider) {
    _providers[provider.providerId] = provider;
  }

  IComicProvider getProvider(String providerId) {
    final provider = _providers[providerId];
    if (provider == null) {
      throw Exception('Provider with id $providerId not found in registry');
    }
    return provider;
  }

  List<IComicProvider> getAllProviders() {
    return _providers.values.toList();
  }
}

// Global instance to hold the registry
final providerRegistry = ProviderRegistry()
  ..register(ComicWifiProvider())
  ..register(WebtoonProvider())
  ..register(CopymangaProvider());

// Riverpod provider for the registry
final providerRegistryProvider = Provider<ProviderRegistry>((ref) {
  return providerRegistry;
});
