import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/domain/models/local_comic_record.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';

class LibraryState {
  final bool isLoading;
  final List<LocalComicRecord> favorites;
  final String? error;

  LibraryState({
    this.isLoading = false,
    this.favorites = const [],
    this.error,
  });

  LibraryState copyWith({
    bool? isLoading,
    List<LocalComicRecord>? favorites,
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
    // Watch settings to auto-refresh library when mode changes
    ref.watch(settingsProvider);
    
    Future.microtask(() => loadLibrary());
    return LibraryState();
  }

  Future<void> loadLibrary() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);

      // Instantly load from local DB.
      // Thanks to the Local DB architecture, we don't need to fetch comic details from API.
      // And the interactionRepo automatically filters by the current dataSourceMode.
      final records = await interactionRepo.getFavorites();

      state = state.copyWith(
        isLoading: false,
        favorites: records,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final libraryProvider = NotifierProvider<LibraryNotifier, LibraryState>(() {
  return LibraryNotifier();
});
