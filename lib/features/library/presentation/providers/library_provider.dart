import 'package:mekuru/features/library/domain/models/library_sort_mode.dart';
import 'package:mekuru/features/library/domain/models/comic_record.dart';
import 'package:mekuru/features/library/domain/models/library_filter_criteria.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/features/library/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';
import 'package:mekuru/features/comic/domain/models/comic_card_data.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';

class LibraryState {
  final bool isLoading;
  final List<ComicRecord> rawFavorites;
  final List<ComicCardData> displayItems;
  final List<String> availableProviders;
  final LibraryFilterCriteria criteria;
  final String? error;

  LibraryState({
    this.isLoading = false,
    this.rawFavorites = const [],
    this.displayItems = const [],
    this.availableProviders = const [],
    this.criteria = const LibraryFilterCriteria(),
    this.error,
  });

  // Convenient domain-aware getters
  String? get activeProviderFilter => criteria.providerId;
  String get searchQuery => criteria.searchQuery;
  LibrarySortMode get sortMode => criteria.sortMode;

  LibraryState copyWith({
    bool? isLoading,
    List<ComicRecord>? rawFavorites,
    List<ComicCardData>? displayItems,
    List<String>? availableProviders,
    LibraryFilterCriteria? criteria,
    String? error,
  }) {
    return LibraryState(
      isLoading: isLoading ?? this.isLoading,
      rawFavorites: rawFavorites ?? this.rawFavorites,
      displayItems: displayItems ?? this.displayItems,
      availableProviders: availableProviders ?? this.availableProviders,
      criteria: criteria ?? this.criteria,
      error: error,
    );
  }
}

class LibraryNotifier extends Notifier<LibraryState> {
  @override
  LibraryState build() {
    final initialSortMode = ref.read(settingsProvider).librarySortMode;
        
    // Subscribe to DB changes so Library auto-updates when progress is saved or favorites are toggled
    final subscription = ref.watch(userInteractionRepositoryProvider).watchGlobalChanges().listen((_) {
      loadLibrary();
    });
    
    ref.onDispose(() {
      subscription.cancel();
    });
    
    Future.microtask(() => loadLibrary());
    return LibraryState(
      criteria: LibraryFilterCriteria(sortMode: initialSortMode),
    );
  }

  void setProviderFilter(String? providerId) {
    state = state.copyWith(
      criteria: state.criteria.copyWith(
        providerId: providerId,
        clearProviderFilter: providerId == null,
      ),
    );
    _updateDisplayItems();
  }

  void setSearchQuery(String query) {
    state = state.copyWith(
      criteria: state.criteria.copyWith(searchQuery: query),
    );
    _updateDisplayItems();
  }

  void setSortMode(LibrarySortMode sortMode) {
    state = state.copyWith(
      criteria: state.criteria.copyWith(sortMode: sortMode),
    );
    ref.read(settingsProvider.notifier).updateLibrarySortMode(sortMode);
    _updateDisplayItems();
  }

  Future<bool> removeFavorite(String providerId, String comicId) async {
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final target = state.rawFavorites.where(
        (r) => r.providerId == providerId && r.comicId == comicId,
      ).firstOrNull;

      if (target != null) {
        await interactionRepo.toggleFavorite(
          providerId: providerId,
          comicId: comicId,
          comic: target,
          isFavorite: false,
        );
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<void> loadLibrary() async {
    // Only set loading indicator when there are no items displayed yet,
    // avoiding UI unmounting or empty flickering during background updates.
    if (state.displayItems.isEmpty) {
      state = state.copyWith(isLoading: true, error: null);
    }
    
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final records = await interactionRepo.getAllFavorites();

      final availableProviders = records.map((r) => r.providerId).toSet().toList();

      var criteria = state.criteria;
      if (criteria.providerId != null && !availableProviders.contains(criteria.providerId)) {
        criteria = criteria.copyWith(clearProviderFilter: true);
      }

      state = state.copyWith(
        isLoading: false,
        rawFavorites: records,
        availableProviders: availableProviders,
        criteria: criteria,
      );
      _updateDisplayItems();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void _updateDisplayItems() {
    final filtered = state.criteria.apply(state.rawFavorites);
    final registry = ref.read(providerRegistryProvider);

    final displayItems = filtered.map((r) {
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
      
      final tags = [providerName];
      if (r.sourceUpdatedAt != null) {
        final d = r.sourceUpdatedAt!;
        tags.add('${d.month}/${d.day}');
      } else {
        tags.add('No Date');
      }
      
      return ComicCardData.fromComic(r, overrideTags: tags, progressLabel: progressLabel);
    }).toList();

    state = state.copyWith(displayItems: displayItems);
  }
}

final libraryProvider = NotifierProvider<LibraryNotifier, LibraryState>(() {
  return LibraryNotifier();
});