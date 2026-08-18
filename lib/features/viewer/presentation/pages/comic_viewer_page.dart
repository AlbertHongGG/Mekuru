import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/viewer/presentation/providers/comic_viewer_provider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  bool _hasAutoShownUIAtBottom = false;

  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  
  int _lastReportedPage = 0;
  bool _initializedIndex = false;

  @override
  void initState() {
    super.initState();
    _itemPositionsListener.itemPositions.addListener(_onScroll);
  }

  @override
  void dispose() {
    _itemPositionsListener.itemPositions.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    final state = ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)));
    if (state.pages.isEmpty) return;

    int minIndex = positions.first.index;
    for (final pos in positions) {
      if (pos.itemLeadingEdge < 0.5 && pos.index > minIndex) {
         // rough heuristic to find the prominent item
         minIndex = pos.index;
      }
    }
    
    // Auto-show UI at bottom
    final lastPos = positions.where((p) => p.index == state.pages.length - 1).firstOrNull;
    if (lastPos != null && lastPos.itemTrailingEdge <= 1.05) {
      if (!_hasAutoShownUIAtBottom && !_showUI) {
        setState(() {
          _showUI = true;
          _hasAutoShownUIAtBottom = true;
        });
      }
    } else {
      _hasAutoShownUIAtBottom = false;
    }
    
    if (minIndex != _lastReportedPage) {
      _lastReportedPage = minIndex;
      ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)).notifier)
          .updateReadPage(minIndex);
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
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            final chapters = detailsState.chapters;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('章節列表', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: chapters.length,
                    itemBuilder: (context, index) {
                      final chapter = chapters[index];
                      final isCurrent = chapter.id == widget.chapterId;
                      return ListTile(
                        title: Text(
                          chapter.title,
                          style: TextStyle(
                            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                            color: isCurrent ? AppColors.primary : null,
                          ),
                        ),
                        trailing: isCurrent ? const Icon(Icons.check_circle_rounded, color: AppColors.primary) : null,
                        onTap: () {
                          Navigator.pop(context);
                          if (!isCurrent) {
                            _navigateToChapter(chapter.id);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _navigateToChapter(String chapterId) {
    context.pushReplacement('/viewer/${widget.providerId}/${widget.comicId}/$chapterId');
  }

  @override
  Widget build(BuildContext context) {
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.watch(comicViewerProvider(arg));
    
    final detailsArg = (providerId: widget.providerId, comicId: widget.comicId);
    final detailsState = ref.watch(comicDetailsProvider(detailsArg));

    String chapterTitle = '載入中...';
    String comicTitle = detailsState.comic?.title ?? '';
    String? prevChapterId;
    String? nextChapterId;

    if (detailsState.chapters.isNotEmpty) {
      final index = detailsState.chapters.indexWhere((c) => c.id == widget.chapterId);
      if (index != -1) {
        chapterTitle = detailsState.chapters[index].title;
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

    if (!_initializedIndex && state.pages.isNotEmpty && state.initialPageIndex > 0) {
       _lastReportedPage = state.initialPageIndex;
       _initializedIndex = true;
    } else if (!_initializedIndex && state.pages.isNotEmpty) {
       _initializedIndex = true;
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
                        child: ScrollablePositionedList.builder(
                          itemScrollController: _itemScrollController,
                          itemPositionsListener: _itemPositionsListener,
                          initialScrollIndex: state.initialPageIndex < state.pages.length ? state.initialPageIndex : 0,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: prevChapterId != null ? () => _navigateToChapter(prevChapterId!) : null,
                            icon: const Icon(Icons.skip_previous_rounded),
                            label: const Text('上一話'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.white30,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: state.pages.isNotEmpty
                              ? Text(
                                  '${_lastReportedPage + 1} / ${state.pages.length}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Outfit',
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                              onPressed: nextChapterId != null ? () => _navigateToChapter(nextChapterId!) : null,
                              label: const Text('下一話'),
                              icon: const Icon(Icons.skip_next_rounded),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                disabledForegroundColor: Colors.white30,
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                              ),
                            ),
                          ),
                        ),
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
