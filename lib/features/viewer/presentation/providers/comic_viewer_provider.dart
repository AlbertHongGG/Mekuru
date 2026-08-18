import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/providers/repository_providers.dart';
import 'package:mekuru/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/domain/models/page.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';

class ComicViewerState {
  final bool isLoading;
  final List<ComicPage> pages;
  final String? error;
  final int initialPageIndex;

  ComicViewerState({
    this.isLoading = true,
    this.pages = const [],
    this.error,
    this.initialPageIndex = 0,
  });

  ComicViewerState copyWith({
    bool? isLoading,
    List<ComicPage>? pages,
    String? error,
    int? initialPageIndex,
  }) {
    return ComicViewerState(
      isLoading: isLoading ?? this.isLoading,
      pages: pages ?? this.pages,
      error: error,
      initialPageIndex: initialPageIndex ?? this.initialPageIndex,
    );
  }
}

class ComicViewerNotifier extends AutoDisposeFamilyNotifier<ComicViewerState, ({String providerId, String comicId, String chapterId})> {
  @override
  ComicViewerState build(({String providerId, String comicId, String chapterId}) arg) {
    Future.microtask(() => loadPages());
    return ComicViewerState();
  }

  Future<void> loadPages() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(comicRepositoryProvider);
      final pages = await repo.getChapterImages(arg.providerId, arg.comicId, arg.chapterId);

      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final detailsState = ref.read(comicDetailsProvider((providerId: arg.providerId, comicId: arg.comicId)));
      final comic = detailsState.comic;
      final chapter = detailsState.chapters.firstWhere((c) => c.id == arg.chapterId);

      int initPage = 0;
      try {
        final interaction = await interactionRepo.getInteraction(arg.providerId, arg.comicId);
        if (interaction != null && interaction.lastReadChapterId == arg.chapterId) {
          initPage = interaction.lastReadPageIndex ?? 0;
        }
      } catch (_) {}

      state = state.copyWith(
        isLoading: false,
        pages: pages,
        initialPageIndex: initPage,
      );
      
      if (comic != null) {
        interactionRepo.markRead(
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: comic,
          chapterId: arg.chapterId,
          chapterTitle: chapter.title,
          pageIndex: initPage, // Mark read right away with the initial page
        );
      }
      
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      ref.read(notificationProvider.notifier).showError('讀取章節失敗: $e');
    }
  }

  Future<void> updateReadPage(int pageIndex) async {
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final detailsState = ref.read(comicDetailsProvider((providerId: arg.providerId, comicId: arg.comicId)));
      final comic = detailsState.comic;
      final chapter = detailsState.chapters.firstWhere((c) => c.id == arg.chapterId);
      if (comic != null) {
        interactionRepo.markRead(
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: comic,
          chapterId: arg.chapterId,
          chapterTitle: chapter.title,
          pageIndex: pageIndex,
        );
      }
    } catch (_) {}
  }
}

final comicViewerProvider = NotifierProvider.autoDispose.family<ComicViewerNotifier, ComicViewerState, ({String providerId, String comicId, String chapterId})>(() {
  return ComicViewerNotifier();
});
