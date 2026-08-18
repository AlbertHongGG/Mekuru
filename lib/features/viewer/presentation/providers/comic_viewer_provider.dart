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
  final int initialAnchorIndex;
  final double initialAnchorOffset;

  ComicViewerState({
    this.isLoading = true,
    this.pages = const [],
    this.error,
    this.initialAnchorIndex = 0,
    this.initialAnchorOffset = 0.0,
  });

  ComicViewerState copyWith({
    bool? isLoading,
    List<ComicPage>? pages,
    String? error,
    int? initialAnchorIndex,
    double? initialAnchorOffset,
  }) {
    return ComicViewerState(
      isLoading: isLoading ?? this.isLoading,
      pages: pages ?? this.pages,
      error: error ?? this.error,
      initialAnchorIndex: initialAnchorIndex ?? this.initialAnchorIndex,
      initialAnchorOffset: initialAnchorOffset ?? this.initialAnchorOffset,
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

      int initAnchorIndex = 0;
      double initAnchorOffset = 0.0;
      try {
        final interaction = await interactionRepo.getInteraction(arg.providerId, arg.comicId);
        if (interaction != null && interaction.lastReadChapterId == arg.chapterId) {
          int packed = interaction.lastReadPageIndex ?? 0;
          initAnchorIndex = packed ~/ 1000000;
          initAnchorOffset = (packed % 1000000).toDouble();
        }
      } catch (_) {}

      state = state.copyWith(
        isLoading: false,
        pages: pages,
        initialAnchorIndex: initAnchorIndex,
        initialAnchorOffset: initAnchorOffset,
      );

      if (comic != null) {
        int packed = (initAnchorIndex * 1000000) + initAnchorOffset.toInt();
        interactionRepo.markRead(
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: comic,
          chapterId: arg.chapterId,
          chapterTitle: chapter.title,
          pageIndex: packed, 
        );
      }
      
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      ref.read(notificationProvider.notifier).showError('讀取章節失敗: $e');
    }
  }

  Future<void> updateProgress(int anchorIndex, double anchorOffset) async {
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final detailsState = ref.read(comicDetailsProvider((providerId: arg.providerId, comicId: arg.comicId)));
      final comic = detailsState.comic;
      final chapter = detailsState.chapters.firstWhere((c) => c.id == arg.chapterId);
      if (comic != null) {
        int packed = (anchorIndex * 1000000) + anchorOffset.toInt();
        interactionRepo.markRead(
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: comic,
          chapterId: arg.chapterId,
          chapterTitle: chapter.title,
          pageIndex: packed,
        );
      }
    } catch (_) {}
  }
}

final comicViewerProvider = NotifierProvider.autoDispose.family<ComicViewerNotifier, ComicViewerState, ({String providerId, String comicId, String chapterId})>(() {
  return ComicViewerNotifier();
});
