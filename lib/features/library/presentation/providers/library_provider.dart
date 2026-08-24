import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/domain/models/local_comic_record.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/core/models/comic_card_data.dart';
import 'package:mekuru/data/sources/provider_registry.dart';

class LibraryState {
  final bool isLoading;
  final List<LocalComicRecord> rawFavorites;
  final List<ComicCardData> displayItems;
  final List<String> availableProviders;
  final String? activeProviderFilter;
  final String searchQuery;
  final String sortMode;
  final String? error;

  LibraryState({
    this.isLoading = false,
    this.rawFavorites = const [],
    this.displayItems = const [],
    this.availableProviders = const [],
    this.activeProviderFilter,
    this.searchQuery = '',
    this.sortMode = 'added',
    this.error,
  });

  LibraryState copyWith({
    bool? isLoading,
    List<LocalComicRecord>? rawFavorites,
    List<ComicCardData>? displayItems,
    List<String>? availableProviders,
    String? activeProviderFilter,
    bool clearProviderFilter = false,
    String? searchQuery,
    String? sortMode,
    String? error,
  }) {
    return LibraryState(
      isLoading: isLoading ?? this.isLoading,
      rawFavorites: rawFavorites ?? this.rawFavorites,
      displayItems: displayItems ?? this.displayItems,
      availableProviders: availableProviders ?? this.availableProviders,
      activeProviderFilter: clearProviderFilter ? null : (activeProviderFilter ?? this.activeProviderFilter),
      searchQuery: searchQuery ?? this.searchQuery,
      sortMode: sortMode ?? this.sortMode,
      error: error,
    );
  }
}

class LibraryNotifier extends Notifier<LibraryState> {
  @override
  LibraryState build() {
    ref.watch(settingsProvider.select((s) => s.dataSourceMode));
    Future.microtask(() => loadLibrary());
    return LibraryState();
  }

  void setProviderFilter(String? providerId) {
    state = state.copyWith(
      activeProviderFilter: providerId,
      clearProviderFilter: providerId == null,
    );
    _updateDisplayItems();
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    _updateDisplayItems();
  }

  void setSortMode(String sortMode) {
    state = state.copyWith(sortMode: sortMode);
    _updateDisplayItems();
  }

  Future<void> loadLibrary() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final settings = ref.read(settingsProvider);
      
      final records = await interactionRepo.getAllFavorites(settings.dataSourceMode);

      final availableProviders = records.map((r) => r.providerId).toSet().toList();

      state = state.copyWith(
        isLoading: false,
        rawFavorites: records,
        availableProviders: availableProviders,
      );
      _updateDisplayItems();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void _updateDisplayItems() {
    var result = state.rawFavorites.toList();
    
    if (state.activeProviderFilter != null) {
      result = result.where((f) => f.providerId == state.activeProviderFilter).toList();
    }
    
    if (state.searchQuery.isNotEmpty) {
      final q = state.searchQuery.toLowerCase();
      result = result.where((f) => (f.title).toLowerCase().contains(q)).toList();
    }
    
    result.sort((a, b) {
      if (state.sortMode == 'added') {
        final timeA = a.favoriteAt ?? a.updatedAt;
        final timeB = b.favoriteAt ?? b.updatedAt;
        return timeB.compareTo(timeA);
      } else if (state.sortMode == 'read' || state.sortMode == 'updated') {
        final timeA = a.updatedAt;
        final timeB = b.updatedAt;
        return timeB.compareTo(timeA);
      }
      return 0;
    });

    final registry = ref.read(providerRegistryProvider);
    final displayItems = result.map((r) {
      String providerName = r.providerId;
      try {
        providerName = registry.getProvider(r.providerId).providerName;
      } catch (_) {}
      return ComicCardData.fromComic(r, overrideTags: [providerName]);
    }).toList();

    state = state.copyWith(displayItems: displayItems);
  }
}

final libraryProvider = NotifierProvider<LibraryNotifier, LibraryState>(() {
  return LibraryNotifier();
});
