import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/data/providers/repository_providers.dart';
import 'package:mekuru/domain/models/comic.dart';

class ExploreState {
  final bool isLoading;
  final List<Comic> comics;
  final String? error;
  final int page;
  final bool hasNext;
  final String searchQuery;
  final Set<String> knownTags;
  final Set<String> activeTags;
  final bool isExcludeMode;

  ExploreState({
    this.isLoading = false,
    this.comics = const [],
    this.error,
    this.page = 1,
    this.hasNext = false,
    this.searchQuery = '',
    this.knownTags = const {},
    this.activeTags = const {},
    this.isExcludeMode = false,
  });

  ExploreState copyWith({
    bool? isLoading,
    List<Comic>? comics,
    String? error,
    int? page,
    bool? hasNext,
    String? searchQuery,
    Set<String>? knownTags,
    Set<String>? activeTags,
    bool? isExcludeMode,
  }) {
    return ExploreState(
      isLoading: isLoading ?? this.isLoading,
      comics: comics ?? this.comics,
      error: error,
      page: page ?? this.page,
      hasNext: hasNext ?? this.hasNext,
      searchQuery: searchQuery ?? this.searchQuery,
      knownTags: knownTags ?? this.knownTags,
      activeTags: activeTags ?? this.activeTags,
      isExcludeMode: isExcludeMode ?? this.isExcludeMode,
    );
  }
}

class ExploreNotifier extends Notifier<ExploreState> {
  static const String _providerId = 'comicwifi';
  late Box _tagsBox;

  @override
  ExploreState build() {
    _tagsBox = Hive.box('tags');
    
    final List<String> loadedKnownTags = _tagsBox.get('knownTags', defaultValue: <String>[])?.cast<String>();
    final List<String> loadedActiveTags = _tagsBox.get('activeTags', defaultValue: <String>[])?.cast<String>();
    final bool loadedExcludeMode = _tagsBox.get('isExcludeMode', defaultValue: false);

    Future.microtask(() => loadExplore());
    return ExploreState(
      knownTags: loadedKnownTags.toSet(),
      activeTags: loadedActiveTags.toSet(),
      isExcludeMode: loadedExcludeMode,
    );
  }

  void _extractTags(List<Comic> fetchedComics) {
    final currentKnown = Set<String>.from(state.knownTags);
    bool addedNew = false;
    
    for (final comic in fetchedComics) {
      if (comic.tags != null) {
        for (final tag in comic.tags!) {
          if (!currentKnown.contains(tag)) {
            currentKnown.add(tag);
            addedNew = true;
          }
        }
      }
    }
    
    if (addedNew) {
      state = state.copyWith(knownTags: currentKnown);
      _tagsBox.put('knownTags', currentKnown.toList());
    }
  }

  void toggleTag(String tag) {
    final currentActive = Set<String>.from(state.activeTags);
    if (currentActive.contains(tag)) {
      currentActive.remove(tag);
    } else {
      currentActive.add(tag);
    }
    state = state.copyWith(activeTags: currentActive);
    _tagsBox.put('activeTags', currentActive.toList());
  }

  void toggleExcludeMode() {
    final newValue = !state.isExcludeMode;
    state = state.copyWith(isExcludeMode: newValue);
    _tagsBox.put('isExcludeMode', newValue);
  }

  void clearTags() {
    state = state.copyWith(activeTags: {});
    _tagsBox.put('activeTags', <String>[]);
  }

  Future<void> loadExplore({bool loadMore = false}) async {
    if (state.isLoading || (!state.hasNext && loadMore)) return;

    final repo = ref.read(comicRepositoryProvider);
    final nextPage = loadMore ? state.page + 1 : 1;

    if (!loadMore) {
      state = state.copyWith(isLoading: true, comics: [], error: null, page: 1, searchQuery: '');
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final result = await repo.explore(providerId: _providerId, page: nextPage);
      
      _extractTags(result.comics);

      state = state.copyWith(
        isLoading: false,
        comics: loadMore ? [...state.comics, ...result.comics] : result.comics,
        page: result.page,
        hasNext: result.hasNext,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      return loadExplore();
    }

    final repo = ref.read(comicRepositoryProvider);
    
    state = state.copyWith(isLoading: true, comics: [], error: null, searchQuery: query, page: 1, hasNext: false);

    try {
      final result = await repo.search(query, providerId: _providerId);
      
      _extractTags(result.comics);

      state = state.copyWith(
        isLoading: false,
        comics: result.comics,
        page: result.page,
        hasNext: result.hasNext,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final exploreProvider = NotifierProvider<ExploreNotifier, ExploreState>(() {
  return ExploreNotifier();
});
