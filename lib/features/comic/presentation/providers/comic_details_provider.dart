import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/providers/repository_providers.dart';
import 'package:mekuru/core/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/core/models/comic_models.dart';
import 'package:mekuru/core/models/chapter.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/core/models/local_comic_record.dart';
import 'package:mekuru/core/models/paginated_result.dart';
import 'package:mekuru/features/library/presentation/providers/library_provider.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';


class ComicDetailsState {
  final bool isLoading;
  final ComicDetail? comic;
  final List<Chapter> chapters;
  final LocalComicRecord? interaction;
  final String? error;
  final bool isChapterSortDescending;

  ComicDetailsState({
    this.isLoading = true,
    this.comic,
    this.chapters = const [],
    this.interaction,
    this.error,
    this.isChapterSortDescending = true,
  });

  ComicDetailsState copyWith({
    bool? isLoading,
    ComicDetail? comic,
    List<Chapter>? chapters,
    LocalComicRecord? interaction,
    String? error,
    bool? isChapterSortDescending,
  }) {
    return ComicDetailsState(
      isLoading: isLoading ?? this.isLoading,
      comic: comic ?? this.comic,
      chapters: chapters ?? this.chapters,
      interaction: interaction ?? this.interaction,
      error: error ?? this.error,
      isChapterSortDescending: isChapterSortDescending ?? this.isChapterSortDescending,
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

      final comicResult = await sourceRepo.getComic(arg.providerId, arg.comicId);
      final chapterResult = await sourceRepo.getChapters(arg.providerId, arg.comicId, isDescending: state.isChapterSortDescending);

      final comic = comicResult.getOrThrow();
      final chapters = chapterResult.getOrThrow();

      final settings = ref.read(settingsProvider);
      final mode = settings.dataSourceMode;

      // Start watching the interaction stream
      final sub = interactionRepo.watchInteraction(
        dataSourceMode: mode, 
        providerId: arg.providerId, 
        comicId: arg.comicId
      ).listen((record) {
        state = state.copyWith(interaction: record);
      });
      ref.onDispose(() => sub.cancel());

      state = state.copyWith(
        isLoading: false,
        comic: comic,
        chapters: chapters,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      ref.read(notificationProvider.notifier).showError('載入漫畫詳情失敗: $e');
    }
  }

  void toggleChapterSort() {
    state = state.copyWith(
      isChapterSortDescending: !state.isChapterSortDescending,
      chapters: state.chapters.reversed.toList(),
    );
  }

  Future<void> toggleFavorite() async {
    final interactionRepo = ref.read(userInteractionRepositoryProvider);
    final settings = ref.read(settingsProvider);
    final mode = settings.dataSourceMode;
    final isFavorite = state.interaction?.isFavorite ?? false;
    final newFavoriteStatus = !isFavorite;
    final comic = state.comic;
    if (comic == null) return;

    try {
      await interactionRepo.toggleFavorite(
        dataSourceMode: mode,
        providerId: arg.providerId, 
        comicId: arg.comicId,
        comic: comic, 
        isFavorite: newFavoriteStatus
      );
      // Re-fetch interaction
      final interaction = await interactionRepo.getInteraction(
        dataSourceMode: mode,
        providerId: arg.providerId, 
        comicId: arg.comicId
      );
      state = state.copyWith(interaction: interaction);
      ref.invalidate(libraryProvider);
      
      final notif = ref.read(notificationProvider.notifier);
      if (newFavoriteStatus) {
        notif.showSuccess('已加入書庫');
      } else {
        notif.showInfo('已從書庫移除');
      }
    } catch (e) {
      ref.read(notificationProvider.notifier).showError('操作失敗: $e');
    }
  }

}

final comicDetailsProvider = NotifierProvider.autoDispose.family<ComicDetailsNotifier, ComicDetailsState, ({String providerId, String comicId})>(() {
  return ComicDetailsNotifier();
});
