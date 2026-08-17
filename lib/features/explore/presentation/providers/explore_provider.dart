import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/repositories/comic_source_repository.dart';
import 'package:mekuru/domain/models/comic.dart';

class ExploreState {
  final bool isLoading;
  final List<Comic> comics;
  final String? error;
  final int page;
  final bool hasNext;
  final String searchQuery;

  ExploreState({
    this.isLoading = false,
    this.comics = const [],
    this.error,
    this.page = 1,
    this.hasNext = false,
    this.searchQuery = '',
  });

  ExploreState copyWith({
    bool? isLoading,
    List<Comic>? comics,
    String? error,
    int? page,
    bool? hasNext,
    String? searchQuery,
  }) {
    return ExploreState(
      isLoading: isLoading ?? this.isLoading,
      comics: comics ?? this.comics,
      error: error, // Can be null to clear error
      page: page ?? this.page,
      hasNext: hasNext ?? this.hasNext,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class ExploreNotifier extends Notifier<ExploreState> {
  static const String _providerId = 'comicwifi';

  @override
  ExploreState build() {
    // Initial fetch
    Future.microtask(() => loadExplore());
    return ExploreState();
  }

  Future<void> loadExplore({bool loadMore = false}) async {
    if (state.isLoading || (!state.hasNext && loadMore)) return;

    final repo = ref.read(comicSourceRepositoryProvider);
    final nextPage = loadMore ? state.page + 1 : 1;

    if (!loadMore) {
      state = state.copyWith(isLoading: true, comics: [], error: null, page: 1, searchQuery: '');
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final result = await repo.explore(_providerId, page: nextPage);
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

    final repo = ref.read(comicSourceRepositoryProvider);
    
    state = state.copyWith(isLoading: true, comics: [], error: null, searchQuery: query, page: 1, hasNext: false);

    try {
      final result = await repo.search(query, _providerId);
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
