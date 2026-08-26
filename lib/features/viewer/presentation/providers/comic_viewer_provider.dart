import 'package:mekuru/core/models/enums/data_source_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/data/providers/repository_providers.dart';
import 'package:mekuru/core/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/core/models/page.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';

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
  UserInteractionRepository? _interactionRepo;
  DataSourceMode? _mode;
  dynamic _comic;
  String? _chapterTitle;

  int? _chronologicalIndex;

  int _calculateChronologicalIndex(List<dynamic> chapters, String targetChapterId) {
    if (chapters.isEmpty) return 1;
    final index = chapters.indexWhere((c) => c.id == targetChapterId);
    if (index == -1) return 1;

    bool isDescending = false;
    if (chapters.length > 1) {
      final chaptersWithNumbers = chapters.where((c) => RegExp(r'\d+').hasMatch(c.title)).toList();
      if (chaptersWithNumbers.length > 1) {
        final int1 = int.parse(RegExp(r'\d+').firstMatch(chaptersWithNumbers.first.title)!.group(0)!);
        final int2 = int.parse(RegExp(r'\d+').firstMatch(chaptersWithNumbers.last.title)!.group(0)!);
        if (int1 > int2) {
          isDescending = true;
        }
      }
    }

    if (isDescending) {
      return chapters.length - index;
    } else {
      return index + 1;
    }
  }

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
      final chapter = detailsState.chapters.firstWhere((c) => c.id == arg.chapterId);

      final settings = ref.read(settingsProvider);
      final mode = settings.dataSourceMode;
      
      _interactionRepo = interactionRepo;
      _mode = mode;
      _comic = comic;
      _chapterTitle = chapter.title;
      _chronologicalIndex = _calculateChronologicalIndex(detailsState.chapters, arg.chapterId);

      int initAnchorIndex = 0;
      double initAnchorOffset = 0.0;
      try {
        final interaction = await interactionRepo.getInteraction(
          dataSourceMode: mode,
          providerId: arg.providerId, 
          comicId: arg.comicId
        );
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
          dataSourceMode: mode,
          providerId: arg.providerId,
          comicId: arg.comicId,
          comic: comic,
          chapterId: arg.chapterId,
          chapterTitle: chapter.title,
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
      if (_interactionRepo != null && _comic != null && _mode != null && _chapterTitle != null) {
        int packed = (anchorIndex * 1000000) + anchorOffset.toInt();
        _interactionRepo!.markRead(
          dataSourceMode: _mode!,
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
