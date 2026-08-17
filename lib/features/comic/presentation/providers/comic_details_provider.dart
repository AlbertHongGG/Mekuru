import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/providers/repository_providers.dart';
import 'package:mekuru/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/domain/models/chapter.dart';
import 'package:mekuru/domain/models/user_interaction.dart';

class ComicDetailsState {
  final bool isLoading;
  final Comic? comic;
  final List<Chapter> chapters;
  final UserInteraction? interaction;
  final String? error;

  ComicDetailsState({
    this.isLoading = true,
    this.comic,
    this.chapters = const [],
    this.interaction,
    this.error,
  });

  ComicDetailsState copyWith({
    bool? isLoading,
    Comic? comic,
    List<Chapter>? chapters,
    UserInteraction? interaction,
    String? error,
  }) {
    return ComicDetailsState(
      isLoading: isLoading ?? this.isLoading,
      comic: comic ?? this.comic,
      chapters: chapters ?? this.chapters,
      interaction: interaction ?? this.interaction,
      error: error,
    );
  }
}

class ComicDetailsNotifier extends AutoDisposeFamilyNotifier<ComicDetailsState, ({String providerId, String comicId})> {
  @override
  ComicDetailsState build(({String providerId, String comicId}) arg) {
    Future.microtask(() => loadDetails());
    return ComicDetailsState();
  }

  Future<void> loadDetails() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final sourceRepo = ref.read(comicRepositoryProvider);
      final interactionRepo = ref.read(userInteractionRepositoryProvider);

      final responses = await Future.wait([
        sourceRepo.getComic(arg.providerId, arg.comicId),
        sourceRepo.getChapters(arg.providerId, arg.comicId),
      ]);

      UserInteraction? interaction;
      try {
        interaction = await interactionRepo.getInteraction(arg.providerId, arg.comicId);
      } catch (_) {
        // Not favorited yet
      }

      state = state.copyWith(
        isLoading: false,
        comic: responses[0] as Comic,
        chapters: responses[1] as List<Chapter>,
        interaction: interaction,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> toggleFavorite() async {
    final interactionRepo = ref.read(userInteractionRepositoryProvider);
    final isFavorite = state.interaction?.isFavorite ?? false;
    final newFavoriteStatus = !isFavorite;

    try {
      await interactionRepo.toggleFavorite(arg.providerId, arg.comicId, newFavoriteStatus);
      // Re-fetch interaction
      final interaction = await interactionRepo.getInteraction(arg.providerId, arg.comicId);
      state = state.copyWith(interaction: interaction);
    } catch (e) {
      // Handle error gracefully
    }
  }
}

final comicDetailsProvider = NotifierProvider.autoDispose.family<ComicDetailsNotifier, ComicDetailsState, ({String providerId, String comicId})>(() {
  return ComicDetailsNotifier();
});
