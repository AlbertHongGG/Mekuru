import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/providers/repository_providers.dart';
import 'package:mekuru/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/domain/models/user_interaction.dart';

class LibraryState {
  final bool isLoading;
  final List<UserFavorite> favorites;
  final String? error;

  LibraryState({
    this.isLoading = false,
    this.favorites = const [],
    this.error,
  });

  LibraryState copyWith({
    bool? isLoading,
    List<UserFavorite>? favorites,
    String? error,
  }) {
    return LibraryState(
      isLoading: isLoading ?? this.isLoading,
      favorites: favorites ?? this.favorites,
      error: error,
    );
  }
}

class LibraryNotifier extends Notifier<LibraryState> {
  @override
  LibraryState build() {
    Future.microtask(() => loadLibrary());
    return LibraryState();
  }

  Future<void> loadLibrary() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final sourceRepo = ref.read(comicRepositoryProvider);

      // Fetch raw interactions
      final rawFavorites = await interactionRepo.getFavorites();

      // Fetch full comic data concurrently
      final futures = rawFavorites.map((fav) async {
        try {
          if (fav.providerId == null || fav.comicId == null) return null;
          final comic = await sourceRepo.getComic(fav.providerId!, fav.comicId!);
          return fav.copyWith(comic: comic);
        } catch (e) {
          return null; // Ignore errors for individual comics
        }
      });

      final results = await Future.wait(futures);
      final validFavorites = results.whereType<UserFavorite>().toList();

      state = state.copyWith(
        isLoading: false,
        favorites: validFavorites,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final libraryProvider = NotifierProvider<LibraryNotifier, LibraryState>(() {
  return LibraryNotifier();
});
