import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/providers/repository_providers.dart';
import 'package:mekuru/features/library/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/features/comic/domain/models/page.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/domain/models/chapter_sequence.dart';

class ComicViewerState {
  final bool isLoading;
  final List<ComicPage> pages;
  final String? error;
  final int initialAnchorIndex;
  final double initialAnchorOffset;
  final String comicTitle;
  final String chapterTitle;
  final String? prevChapterId;
  final String? nextChapterId;

  ComicViewerState({
    this.isLoading = true,
    this.pages = const [],
    this.error,
    this.initialAnchorIndex = 0,
    this.initialAnchorOffset = 0.0,
    this.comicTitle = '',
    this.chapterTitle = '載入中...',
    this.prevChapterId,
    this.nextChapterId,
  });

  ComicViewerState copyWith({
    bool? isLoading,
    List<ComicPage>? pages,
    String? error,
    int? initialAnchorIndex,
    double? initialAnchorOffset,
    String? comicTitle,
    String? chapterTitle,
    String? prevChapterId,
    String? nextChapterId,
  }) {
    return ComicViewerState(
      isLoading: isLoading ?? this.isLoading,
      pages: pages ?? this.pages,
      error: error ?? this.error,
      initialAnchorIndex: initialAnchorIndex ?? this.initialAnchorIndex,
      initialAnchorOffset: initialAnchorOffset ?? this.initialAnchorOffset,
      comicTitle: comicTitle ?? this.comicTitle,
      chapterTitle: chapterTitle ?? this.chapterTitle,
      prevChapterId: prevChapterId ?? this.prevChapterId,
      nextChapterId: nextChapterId ?? this.nextChapterId,
    );
  }
}

class ComicViewerNotifier extends AutoDisposeFamilyNotifier<ComicViewerState, ({String providerId, String comicId, String chapterId})> {
  UserInteractionRepository? _interactionRepo;
  dynamic _comic;
  String? _chapterTitle;

  int? _chronologicalIndex;

  @override
  ComicViewerState build(({String providerId, String comicId, String chapterId}) arg) {
    Future.microtask(() => loadPages());
    return ComicViewerState();
  }

  Future<void> loadPages() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(comicRepositoryProvider);
      final result = await repo.getChapterImages(arg.providerId, arg.comicId, arg.chapterId);
      final pages = result.getOrThrow();

      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      final detailsState = ref.read(comicDetailsProvider((providerId: arg.providerId, comicId: arg.comicId)));
      final comic = detailsState.comic;

      final sequence = ChapterSequence(detailsState.chapters);
      final currentChapter = sequence.findById(arg.chapterId);
      final chapterTitle = currentChapter?.title ?? '載入中...';

      _interactionRepo = interactionRepo;
      _comic = comic;
      _chapterTitle = chapterTitle;
      _chronologicalIndex = sequence.getChronologicalIndex(arg.chapterId);

      int initAnchorIndex = 0;
      double initAnchorOffset = 0.0;
      try {
        final interaction = await interactionRepo.getInteraction(
          providerId: arg.providerId, 
          comicId: arg.comicId
        );
        if (interaction != null && interaction.lastReadChapterId == arg.chapterId) {
          int packed = interaction.lastReadPageIndex ?? 0;
          initAnchorIndex = packed ~/ 1000000;
          initAnchorOffset = (packed % 1000000).toDouble();
        }
      } catch (_) {}

      final prevChapter = sequence.getPrevious(arg.chapterId);
      final nextChapter = sequence.getNext(arg.chapterId);

      state = state.copyWith(
        isLoading: false,
        pages: pages,
        initialAnchorIndex: initAnchorIndex,
        initialAnchorOffset: initAnchorOffset,
        comicTitle: comic?.title ?? '',
        chapterTitle: chapterTitle,
        prevChapterId: prevChapter?.id,
        nextChapterId: nextChapter?.id,
      );

      if (comic != null) {
        int packed = (initAnchorIndex * 1000000) + initAnchorOffset.toInt();
        interactionRepo.markRead(
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: comic,
          chapterId: arg.chapterId,
          chapterTitle: chapterTitle,
          pageIndex: packed, 
          chapterIndex: _chronologicalIndex,
        );
      }
      
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      ref.read(notificationProvider.notifier).showError('讀取章節失敗: $e');
    }
  }

  Future<void> updateProgress(int anchorIndex, double anchorOffset) async {
    try {
      if (_interactionRepo != null && _comic != null && _chapterTitle != null) {
        int packed = (anchorIndex * 1000000) + anchorOffset.toInt();
        _interactionRepo!.markRead(
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: _comic,
          chapterId: arg.chapterId,
          chapterTitle: _chapterTitle!,
          pageIndex: packed,
          chapterIndex: _chronologicalIndex,
        );
      }
    } catch (_) {}
  }
}

final comicViewerProvider = NotifierProvider.autoDispose.family<ComicViewerNotifier, ComicViewerState, ({String providerId, String comicId, String chapterId})>(() {
  return ComicViewerNotifier();
});
