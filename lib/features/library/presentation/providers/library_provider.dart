import 'package:mekuru/core/models/enums/library_sort_mode.dart';
import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:mekuru/core/models/comic_record.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/core/models/comic_card_data.dart';
import 'package:mekuru/core/data/sources/provider_registry.dart';

class LibraryState {
  final bool isLoading;
  final List<ComicRecord> rawFavorites;
  final List<ComicCardData> displayItems;
  final List<String> availableProviders;
  final String? activeProviderFilter;
  final String searchQuery;
  final LibrarySortMode sortMode;
  final String? error;

  LibraryState({
    this.isLoading = false,
    this.rawFavorites = const [],
    this.displayItems = const [],
    this.availableProviders = const [],
    this.activeProviderFilter,
    this.searchQuery = '',
    required this.sortMode,
    this.error,
  });

  LibraryState copyWith({
    bool? isLoading,
    List<ComicRecord>? rawFavorites,
    List<ComicCardData>? displayItems,
    List<String>? availableProviders,
    String? activeProviderFilter,
    bool clearProviderFilter = false,
    String? searchQuery,
    LibrarySortMode? sortMode,
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
    final sortMode = ref.read(settingsProvider).librarySortMode;
    ref.watch(settingsProvider.select((s) => s.dataSourceMode));
    
    // Subscribe to DB changes so Library auto-updates when progress is saved or favorites are toggled
    final subscription = ref.watch(userInteractionRepositoryProvider).watchGlobalChanges().listen((_) {
      loadLibrary();
    });
    
    ref.onDispose(() {
      subscription.cancel();
    });
    
    Future.microtask(() => loadLibrary());
    return LibraryState(sortMode: sortMode);
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

  void setSortMode(LibrarySortMode sortMode) {
    state = state.copyWith(sortMode: sortMode);
    ref.read(settingsProvider.notifier).updateLibrarySortMode(sortMode);
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
    
    result.sort((a, b) => state.sortMode.strategy.compare(a, b));

    final registry = ref.read(providerRegistryProvider);
    final displayItems = result.map((r) {
      String providerName = r.providerId;
      try {
        providerName = registry.getProvider(r.providerId).providerName;
      } catch (_) {}
      
      String? progressLabel;
      if (r.totalChapters != null && r.totalChapters! > 0) {
        String readLabel = '0';
        if (r.lastReadChapterIndex != null) {
          readLabel = r.lastReadChapterIndex.toString();
        }
        progressLabel = '$readLabel/${r.totalChapters}';
      }
      
      return ComicCardData.fromComic(r, overrideTags: [providerName], progressLabel: progressLabel);
    }).toList();

    state = state.copyWith(displayItems: displayItems);
  }
}

final libraryProvider = NotifierProvider<LibraryNotifier, LibraryState>(() {
  return LibraryNotifier();
});
