import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extended_image/extended_image.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/viewer/presentation/providers/comic_viewer_provider.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';

class ComicViewerPage extends ConsumerStatefulWidget {
  final String providerId;
  final String comicId;
  final String chapterId;

  const ComicViewerPage({
    super.key,
    required this.providerId,
    required this.comicId,
    required this.chapterId,
  });

  @override
  ConsumerState<ComicViewerPage> createState() => _ComicViewerPageState();
}

class _ComicViewerPageState extends ConsumerState<ComicViewerPage> {
  bool _showUI = false;

  final ScrollController _scrollController = ScrollController();
  int _lastReportedPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Basic tracking of current page based on scroll position
    // Since images have different heights, this is a rough estimate.
    final position = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final state = ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)));
    
    if (state.pages.isEmpty || maxScroll <= 0) return;
    
    final progress = position / maxScroll;
    final currentPage = (progress * state.pages.length).clamp(0, state.pages.length - 1).floor();
    
    if (currentPage != _lastReportedPage) {
      _lastReportedPage = currentPage;
      // Debounce or send interaction update
      ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)).notifier)
          .updateReadPage(currentPage);
      setState(() {});
    }
  }

  void _toggleUI() {
    setState(() {
      _showUI = !_showUI;
    });
  }

  void _showChapterDrawer(ComicDetailsState detailsState) {
    if (detailsState.chapters.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Consumer(
          builder: (context, ref, _) {
            final currentState = ref.watch(comicDetailsProvider((providerId: widget.providerId, comicId: widget.comicId)));
            final notifier = ref.read(comicDetailsProvider((providerId: widget.providerId, comicId: widget.comicId)).notifier);

            return FractionallySizedBox(
              heightFactor: 0.75,
              child: ChapterListBottomSheet(
                providerId: widget.providerId,
                comicId: widget.comicId,
                chapters: currentState.chapters,
                lastReadChapterId: widget.chapterId,
                isSortDescending: currentState.isChapterSortDescending,
                onToggleSort: () => notifier.toggleChapterSort(),
              ),
            );
          },
        );
      },
    );
  }

  void _navigateToChapter(String chapterId) {
    // Replace current route with new chapter
    context.pushReplacement('/viewer/${widget.providerId}/${widget.comicId}/$chapterId');
  }

  @override
  Widget build(BuildContext context) {
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.watch(comicViewerProvider(arg));
    
    final detailsArg = (providerId: widget.providerId, comicId: widget.comicId);
    final detailsState = ref.watch(comicDetailsProvider(detailsArg));

    // Determine current, prev, next chapter
    String chapterTitle = '載入中...';
    String comicTitle = detailsState.comic?.title ?? '';
    String? prevChapterId;
    String? nextChapterId;

    if (detailsState.chapters.isNotEmpty) {
      // Find current chapter index (assume chapters is chronologically ascending for standard logic)
      // Usually API returns descending, but let's just find index
      final index = detailsState.chapters.indexWhere((c) => c.id == widget.chapterId);
      if (index != -1) {
        chapterTitle = detailsState.chapters[index].title;
        // Logic for prev/next depends on how the list is ordered. 
        // If index 0 is oldest (ascending), prev is index-1.
        // If index 0 is newest (descending), prev is index+1.
        // We'll rely on the original chronological order assuming the standard is newest first in detailsState.chapters.
        final isDesc = detailsState.isChapterSortDescending;
        
        final chronologicallyPrevIndex = isDesc ? index + 1 : index - 1;
        final chronologicallyNextIndex = isDesc ? index - 1 : index + 1;

        if (chronologicallyPrevIndex >= 0 && chronologicallyPrevIndex < detailsState.chapters.length) {
          prevChapterId = detailsState.chapters[chronologicallyPrevIndex].id;
        }
        if (chronologicallyNextIndex >= 0 && chronologicallyNextIndex < detailsState.chapters.length) {
          nextChapterId = detailsState.chapters[chronologicallyNextIndex].id;
        }
      }
    }

    

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Image Viewer Layer
          GestureDetector(
            onTap: _toggleUI,
            child: state.isLoading && state.pages.isEmpty
                ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                : state.error != null
                    ? Center(child: Text('錯誤: ${state.error}', style: const TextStyle(color: Colors.white)))
                    : InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 3.0,
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          itemCount: state.pages.length,
                          itemBuilder: (context, index) {
                            final page = state.pages[index];
                            return ExtendedImage.network(
                              page.imageUrl,
                              fit: BoxFit.contain,
                              cache: true,
                              clearMemoryCacheIfFailed: true,
                              loadStateChanged: (ExtendedImageState imgState) {
                                switch (imgState.extendedImageLoadState) {
                                  case LoadState.loading:
                                    return const SizedBox(
                                      height: 300,
                                      child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
                                    );
                                  case LoadState.completed:
                                    return null;
                                  case LoadState.failed:
                                    return SizedBox(
                                      height: 300,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.broken_image, color: Colors.white54, size: 48),
                                            const SizedBox(height: 8),
                                            TextButton(
                                              onPressed: () => imgState.reLoadImage(),
                                              child: const Text('重新載入', style: TextStyle(color: Colors.white)),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                }
                              },
                            );
                          },
                        ),
                      ),
          ),

          // 2. Top Bar
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            top: _showUI ? 0 : -100,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withValues(alpha: 0.8),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Row(
                    children: [
                      // Title Info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                comicTitle,
                                style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                chapterTitle,
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Action Buttons
                      IconButton(
                        icon: const Icon(Icons.info_outline_rounded, color: Colors.white),
                        onPressed: () => context.pop(),
                        tooltip: '返回簡介',
                      ),
                      IconButton(
                        icon: const Icon(Icons.home_rounded, color: Colors.white),
                        onPressed: () => context.go('/explore'),
                        tooltip: '回首頁',
                      ),
                      IconButton(
                        icon: const Icon(Icons.format_list_bulleted_rounded, color: Colors.white),
                        onPressed: () => _showChapterDrawer(detailsState),
                        tooltip: '章節列表',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 3. Bottom Bar
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            bottom: _showUI ? 0 : -120,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withValues(alpha: 0.8),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Page Indicator
                      if (state.pages.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${_lastReportedPage + 1} / ${state.pages.length}',
                            style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      // Navigation Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: prevChapterId != null ? () => _navigateToChapter(prevChapterId!) : null,
                            icon: const Icon(Icons.skip_previous_rounded),
                            label: const Text('上一話'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.white30,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: nextChapterId != null ? () => _navigateToChapter(nextChapterId!) : null,
                            label: const Text('下一話'),
                            icon: const Icon(Icons.skip_next_rounded),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
