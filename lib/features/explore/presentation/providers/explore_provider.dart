import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mekuru/data/providers/repository_providers.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/domain/models/comic_base.dart';
import 'package:mekuru/domain/models/comic_models.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';

class ExploreState {
  final bool isLoading;
  final List<IComicItem> comics;
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
    List<IComicItem>? comics,
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

class ExploreNotifier extends AutoDisposeFamilyNotifier<ExploreState, String> {
  late Box _tagsBox;

  String get _knownTagsKey => '${arg}_knownTags';
  String get _activeTagsKey => '${arg}_activeTags';
  String get _isExcludeModeKey => '${arg}_isExcludeMode';

  @override
  ExploreState build(String arg) {
    _tagsBox = Hive.box('tags');
    
    final List<String> loadedKnownTags = _tagsBox.get(_knownTagsKey, defaultValue: <String>[])?.cast<String>();
    final List<String> loadedActiveTags = _tagsBox.get(_activeTagsKey, defaultValue: <String>[])?.cast<String>();
    final bool loadedExcludeMode = _tagsBox.get(_isExcludeModeKey, defaultValue: false);

    Future.microtask(() => loadExplore());
    return ExploreState(
      knownTags: loadedKnownTags.toSet(),
      activeTags: loadedActiveTags.toSet(),
      isExcludeMode: loadedExcludeMode,
    );
  }

  void _extractTags(List<IComicItem> fetchedComics) {
    final currentKnown = Set<String>.from(state.knownTags);
    bool addedNew = false;
    
    for (final comic in fetchedComics) {
      List<String> tags = [];
      if (comic is ComicExploreResult) tags = comic.tags;
      else if (comic is ComicSearchResult) tags = comic.tags;
      else if (comic is ComicDetail) tags = comic.tags;

      for (final tag in tags) {
        if (!currentKnown.contains(tag)) {
          currentKnown.add(tag);
          addedNew = true;
        }
      }
    }
    
    if (addedNew) {
      state = state.copyWith(knownTags: currentKnown);
      _tagsBox.put(_knownTagsKey, currentKnown.toList());
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
    _tagsBox.put(_activeTagsKey, currentActive.toList());
  }

  void toggleExcludeMode() {
    final newValue = !state.isExcludeMode;
    state = state.copyWith(isExcludeMode: newValue);
    _tagsBox.put(_isExcludeModeKey, newValue);
  }

  void clearTags() {
    state = state.copyWith(activeTags: {});
    _tagsBox.put(_activeTagsKey, <String>[]);
    ref.read(notificationProvider.notifier).showInfo('已重置標籤過濾');
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

    final result = await repo.exploreComics(arg, nextPage);
    
    result.fold(
      (paginated) {
        _extractTags(paginated.items);
        state = state.copyWith(
          isLoading: false,
          comics: loadMore ? [...state.comics, ...paginated.items] : paginated.items,
          page: paginated.page,
          hasNext: paginated.hasNext,
        );
      },
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
        ref.read(notificationProvider.notifier).showError('探索加載失敗: ${failure.message}');
      },
    );
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      return loadExplore();
    }

    final repo = ref.read(comicRepositoryProvider);
    
    state = state.copyWith(isLoading: true, comics: [], error: null, searchQuery: query, page: 1, hasNext: false);

    final result = await repo.searchComics(arg, query, 1);
    
    result.fold(
      (paginated) {
        _extractTags(paginated.items);
        state = state.copyWith(
          isLoading: false,
          comics: paginated.items,
          page: paginated.page,
          hasNext: paginated.hasNext,
        );
      },
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
        ref.read(notificationProvider.notifier).showError('搜尋失敗: ${failure.message}');
      },
    );
  }
}

final exploreProvider = NotifierProvider.autoDispose.family<ExploreNotifier, ExploreState, String>(() {
  return ExploreNotifier();
});
