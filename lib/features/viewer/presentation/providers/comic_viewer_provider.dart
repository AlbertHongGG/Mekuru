import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/data/repositories/comic_source_repository.dart';
import 'package:mekuru/data/repositories/user_interaction_repository.dart';
import 'package:mekuru/domain/models/page.dart';

class ComicViewerState {
  final bool isLoading;
  final List<ComicPage> pages;
  final String? error;

  ComicViewerState({
    this.isLoading = true,
    this.pages = const [],
    this.error,
  });

  ComicViewerState copyWith({
    bool? isLoading,
    List<ComicPage>? pages,
    String? error,
  }) {
    return ComicViewerState(
      isLoading: isLoading ?? this.isLoading,
      pages: pages ?? this.pages,
      error: error,
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
      final repo = ref.read(comicSourceRepositoryProvider);
      final pages = await repo.getChapterImages(arg.providerId, arg.comicId, arg.chapterId);

      state = state.copyWith(
        isLoading: false,
        pages: pages,
      );
      
      // Update read interaction
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      interactionRepo.markRead(arg.providerId, arg.comicId, chapterId: arg.chapterId);
      
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateReadPage(int pageIndex) async {
    try {
      final interactionRepo = ref.read(userInteractionRepositoryProvider);
      interactionRepo.markRead(arg.providerId, arg.comicId, chapterId: arg.chapterId, pageIndex: pageIndex);
    } catch (_) {}
  }
}

final comicViewerProvider = NotifierProvider.autoDispose.family<ComicViewerNotifier, ComicViewerState, ({String providerId, String comicId, String chapterId})>(() {
  return ComicViewerNotifier();
});
