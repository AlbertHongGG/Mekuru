import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';
import 'package:mekuru/features/viewer/presentation/providers/comic_viewer_provider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:mekuru/features/viewer/presentation/widgets/webtoon_image_placeholder.dart';
import 'package:mekuru/core/widgets/comic_image.dart';
import 'package:mekuru/features/viewer/presentation/widgets/viewer_top_bar.dart';
import 'package:mekuru/features/viewer/presentation/widgets/viewer_bottom_bar.dart';

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
  
  ScrollController? _scrollController;
  final ValueNotifier<double> _progressNotifier = ValueNotifier<double>(0.0);
  
  Timer? _debounceTimer;
  
  // Phase 1: Lightweight dynamic radar
  final Map<int, GlobalKey> _activeKeys = {};
  
  bool _initialized = false;
  int _lastSavedPacked = -1;

  late final dynamic _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)).notifier);
  }
  
  @override
  void dispose() {
    _debounceTimer?.cancel();
    _saveProgress(); // GUARANTEED PERSISTENCE ON EXIT
    _scrollController?.dispose();
    _progressNotifier.dispose();
    super.dispose();
  }
  
  int _currentAnchorIndex = 0;
  double _currentAnchorOffset = 0.0;

  void _calculateCurrentAnchor() {
    if (_activeKeys.isEmpty || _scrollController == null || !_scrollController!.hasClients) return;
    
    final context = _scrollController!.position.context.notificationContext;
    if (context == null) return;
    final viewportBox = context.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;

    double? bestOffset;
    int bestIndex = 0;

    for (final entry in _activeKeys.entries) {
      final key = entry.value;
      if (key.currentContext != null) {
        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
          final top = position.dy;
          final bottom = top + renderBox.size.height;
          
          if (bottom > 0) { 
            if (top <= 0 && bottom > 0) {
              _currentAnchorIndex = entry.key;
              _currentAnchorOffset = -top;
              return;
            } else if (top > 0) {
              if (bestOffset == null || top < bestOffset) {
                bestOffset = top;
                bestIndex = entry.key;
              }
            }
          }
        }
      }
    }
    
    if (bestOffset != null) {
      _currentAnchorIndex = bestIndex;
      _currentAnchorOffset = 0.0; 
    }
  }

  void _saveProgress() {
    int packed = (_currentAnchorIndex * 1000000) + _currentAnchorOffset.toInt();
    if (packed != _lastSavedPacked) {
      _lastSavedPacked = packed;
      _notifier.updateProgress(_currentAnchorIndex, _currentAnchorOffset);
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (_scrollController == null || !_scrollController!.hasClients) return false;
    
    _calculateCurrentAnchor();
    
    final offset = _scrollController!.offset;
    final minOffset = _scrollController!.position.minScrollExtent;
    final maxOffset = _scrollController!.position.maxScrollExtent;
    final totalRange = maxOffset - minOffset;
    
    if (totalRange > 0) {
       double percentage = ((offset - minOffset) / totalRange).clamp(0.0, 1.0);
       _progressNotifier.value = percentage;
    }

    if (notification is ScrollEndNotification) {
      _saveProgress();
    } else {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 800), () {
        _saveProgress();
      });
    }
    return false;
  }
  
  void _toggleUI() {
    setState(() {
      _showUI = !_showUI;
    });
  }

  void _showChapterList() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final detailsArg = (providerId: widget.providerId, comicId: widget.comicId);
            final currentDetailsState = ref.watch(comicDetailsProvider(detailsArg));
            
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SafeArea(
                child: ChapterListBottomSheet(
                  providerId: widget.providerId,
                  comicId: widget.comicId,
                  chapters: currentDetailsState.chapters,
                  lastReadChapterId: widget.chapterId,
                  readChapterIds: currentDetailsState.interaction?.readChapterIds ?? [],
                  isSortDescending: currentDetailsState.isChapterSortDescending,
                  onToggleSort: () => ref.read(comicDetailsProvider(detailsArg).notifier).toggleChapterSort(),
                  onChapterTap: (chapter) {
                    Navigator.pop(context);
                    _navigateToChapter(chapter.id);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _navigateToChapter(String chapterId) {
    _saveProgress(); 
    context.pushReplacement('/viewer/${widget.providerId}/${widget.comicId}/$chapterId');
  }

  @override
  Widget build(BuildContext context) {
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.watch(comicViewerProvider(arg));
    
    if (!_initialized && state.pages.isNotEmpty) {
      _scrollController = ScrollController(initialScrollOffset: state.initialAnchorOffset);
      _initialized = true;
      _currentAnchorIndex = state.initialAnchorIndex;
      _currentAnchorOffset = state.initialAnchorOffset;
      
      if (state.pages.length > 1) {
         _progressNotifier.value = state.initialAnchorIndex / (state.pages.length - 1);
      }
    }

    int initialIndex = state.initialAnchorIndex;
    if (initialIndex >= state.pages.length) initialIndex = state.pages.length - 1;
    if (initialIndex < 0) initialIndex = 0;
    
    final centerKey = const ValueKey('center_sliver');

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          state.isLoading && state.pages.isEmpty
              ? GestureDetector(
                  onTap: _toggleUI,
                  behavior: HitTestBehavior.opaque,
                  child: const Center(child: CircularProgressIndicator(color: AppColors.primary)),
                )
              : state.error != null
                  ? GestureDetector(
                      onTap: _toggleUI,
                      behavior: HitTestBehavior.opaque,
                      child: Center(child: Text('錯誤: ${state.error}', style: const TextStyle(color: Colors.white))),
                    )
                  : NotificationListener<ScrollNotification>(
                      onNotification: _onScrollNotification,
                      child: CustomScrollView(
                        controller: _scrollController,
                        cacheExtent: 500.0, // Reduced from 2500 since we have disk preloading
                        physics: const ClampingScrollPhysics(),
                        center: state.pages.isNotEmpty ? centerKey : null,
                        slivers: [
                          if (state.pages.isNotEmpty && initialIndex > 0)
                            SliverList.builder(
                              itemCount: initialIndex,
                              itemBuilder: (context, idx) {
                                final reversedIndex = initialIndex - 1 - idx;
                                return _buildPage(state.pages[reversedIndex].imageUrl, reversedIndex);
                              },
                            ),
                          if (state.pages.isNotEmpty)
                            SliverList.builder(
                              key: centerKey,
                              itemCount: state.pages.length - initialIndex,
                              itemBuilder: (context, idx) {
                                final realIndex = initialIndex + idx;
                                return _buildPage(state.pages[realIndex].imageUrl, realIndex);
                              },
                            ),
                        ],
                      ),
                    ),

          ViewerTopBar(
            isVisible: _showUI,
            comicTitle: state.comicTitle,
            chapterTitle: state.chapterTitle,
            onMenuPressed: () => _showChapterList(),
          ),

          ViewerBottomBar(
            isVisible: _showUI,
            progressNotifier: _progressNotifier,
            hasPages: state.pages.isNotEmpty,
            onPrevChapter: state.prevChapterId != null ? () => _navigateToChapter(state.prevChapterId!) : null,
            onNextChapter: state.nextChapterId != null ? () => _navigateToChapter(state.nextChapterId!) : null,
          ),
        ],
      ),
    );
  }
  
  Widget _buildPage(String imageUrl, int index) {
    final key = _activeKeys.putIfAbsent(index, () => GlobalKey());
    
    return GestureDetector(
      onTap: _toggleUI,
      behavior: HitTestBehavior.opaque,
      child: Container(
        key: key,
        width: double.infinity,
        color: Colors.transparent,
        child: ComicImage(
          imageUrl: imageUrl,
          providerId: widget.providerId,
          fit: BoxFit.fitWidth, 
          loadStateChanged: (ExtendedImageState imgState) {
            switch (imgState.extendedImageLoadState) {
              case LoadState.loading:
                return WebtoonImagePlaceholder(index: index);
              case LoadState.completed:
                return null; 
              case LoadState.failed:
                return SizedBox(
                  height: 200,
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
        ),
      ),
    );
  }
}
