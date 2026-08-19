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
import 'package:mekuru/core/widgets/app_bottom_sheet.dart';
import 'package:mekuru/core/widgets/comic_image.dart';

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
  
  // Radar system keys
  final GlobalKey _viewportKey = GlobalKey();
  List<GlobalKey> _sliverKeys = [];
  List<GlobalKey> _itemKeys = [];
  
  bool _initialized = false;
  int _lastSavedPacked = -1;

  @override
  void initState() {
    super.initState();
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
    if (_itemKeys.isEmpty) return;
    
    final viewportContext = _viewportKey.currentContext;
    if (viewportContext == null) return;
    
    final viewportBox = viewportContext.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;

    for (int i = 0; i < _itemKeys.length; i++) {
      final key = _itemKeys[i];
      if (key.currentContext != null) {
        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
          final top = position.dy;
          final bottom = top + renderBox.size.height;
          
          if (bottom > 0) { 
            _currentAnchorIndex = i;
            _currentAnchorOffset = top < 0 ? -top : 0.0;
            break;
          }
        }
      }
    }
  }

  void _saveProgress() {
    int packed = (_currentAnchorIndex * 1000000) + _currentAnchorOffset.toInt();
    if (packed != _lastSavedPacked) {
      _lastSavedPacked = packed;
      ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)).notifier)
          .updateProgress(_currentAnchorIndex, _currentAnchorOffset);
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (_scrollController == null || !_scrollController!.hasClients) return false;
    
    // 1. Instantly calculate visual anchor on every frame (O(N) where N is only loaded slivers - extremely fast)
    _calculateCurrentAnchor();
    
    // 2. UI Progress calculation
    final offset = _scrollController!.offset;
    final minOffset = _scrollController!.position.minScrollExtent;
    final maxOffset = _scrollController!.position.maxScrollExtent;
    final totalRange = maxOffset - minOffset;
    
    if (totalRange > 0) {
       double percentage = ((offset - minOffset) / totalRange).clamp(0.0, 1.0);
       _progressNotifier.value = percentage;
    }

    // 3. Debounce the actual Hive DB write
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
    if (_scrollController != null && _scrollController!.hasClients && _scrollController!.position.isScrollingNotifier.value) {
      return;
    }
    setState(() {
      _showUI = !_showUI;
    });
  }

  void _navigateToChapter(String chapterId) {
    _saveProgress(); // Save before navigating away
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
        bool isNativeDescending = false; 
        if (detailsState.chapters.length > 1) {
          final chaptersWithNumbers = detailsState.chapters.where((c) => RegExp(r'\d+').hasMatch(c.title)).toList();
          if (chaptersWithNumbers.length > 1) {
            final int1 = int.parse(RegExp(r'\d+').firstMatch(chaptersWithNumbers.first.title)!.group(0)!);
            final int2 = int.parse(RegExp(r'\d+').firstMatch(chaptersWithNumbers.last.title)!.group(0)!);
            if (int1 > int2) {
              isNativeDescending = true;
            }
          }
        }
        
        final chronologicallyPrevIndex = isNativeDescending ? index + 1 : index - 1;
        final chronologicallyNextIndex = isNativeDescending ? index - 1 : index + 1;

        if (chronologicallyPrevIndex >= 0 && chronologicallyPrevIndex < detailsState.chapters.length) {
          prevChapterId = detailsState.chapters[chronologicallyPrevIndex].id;
        }
        if (chronologicallyNextIndex >= 0 && chronologicallyNextIndex < detailsState.chapters.length) {
          nextChapterId = detailsState.chapters[chronologicallyNextIndex].id;
        }
      }
    }

    if (!_initialized && state.pages.isNotEmpty) {
      // Generate keys for the radar system
      _sliverKeys = List.generate(state.pages.length, (_) => GlobalKey());
      _itemKeys = List.generate(state.pages.length, (_) => GlobalKey());
      
      int targetIndex = state.initialAnchorIndex;
      if (targetIndex >= state.pages.length) targetIndex = state.pages.length - 1;
      if (targetIndex < 0) targetIndex = 0;
      
      _scrollController = ScrollController(initialScrollOffset: state.initialAnchorOffset);
      _initialized = true;
      
      // Calculate initial percentage UI 
      if (state.pages.length > 1) {
         _progressNotifier.value = targetIndex / (state.pages.length - 1);
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
                    : NotificationListener<ScrollNotification>(
                        onNotification: _onScrollNotification,
                        child: CustomScrollView(
                          key: _viewportKey,
                          controller: _scrollController,
                          cacheExtent: 5000.0, 
                          physics: const ClampingScrollPhysics(),
                          center: state.pages.isNotEmpty && _sliverKeys.isNotEmpty 
                              ? _sliverKeys[state.initialAnchorIndex < state.pages.length ? state.initialAnchorIndex : 0]
                              : null,
                          slivers: [
                            if (state.pages.isNotEmpty)
                              for (int i = 0; i < state.pages.length; i++)
                                SliverToBoxAdapter(
                                  key: _sliverKeys[i], // Center anchor key
                                  child: Container(
                                    key: _itemKeys[i], // Position radar key
                                    child: ComicImage(
                                      imageUrl: state.pages[i].imageUrl,
                                      providerId: widget.providerId,
                                      fit: BoxFit.fitWidth, 
                                      loadStateChanged: (ExtendedImageState imgState) {
                                        switch (imgState.extendedImageLoadState) {
                                          case LoadState.loading:
                                            return WebtoonImagePlaceholder(index: i);
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
                                ),
                          ],
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => context.pop(),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comicTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Outfit',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              chapterTitle,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontFamily: 'Outfit',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          final isDark = Theme.of(context).brightness == Brightness.dark;
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
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
                                    chapters: detailsState.chapters,
                                    lastReadChapterId: widget.chapterId,
                                    isSortDescending: detailsState.isChapterSortDescending,
                                    onToggleSort: () => ref.read(comicDetailsProvider((providerId: widget.providerId, comicId: widget.comicId)).notifier).toggleChapterSort(),
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
            bottom: _showUI ? 0 : -100,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withValues(alpha: 0.8),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bottom Left: Progress Percentage
                      Container(
                        constraints: const BoxConstraints(minWidth: 50),
                        child: state.pages.isNotEmpty
                            ? ValueListenableBuilder<double>(
                                valueListenable: _progressNotifier,
                                builder: (context, progress, child) {
                                  final percentStr = (progress * 100).toStringAsFixed(0);
                                  return Text(
                                    '$percentStr%',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Outfit',
                                    ),
                                  );
                                },
                              )
                            : const SizedBox.shrink(),
                      ),
                      
                      // Bottom Right: Chapter Navigation Icons
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                            onPressed: prevChapterId != null ? () => _navigateToChapter(prevChapterId!) : null,
                            color: prevChapterId != null ? Colors.white : Colors.white30,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: 32),
                          IconButton(
                            icon: const Icon(Icons.chevron_right, color: Colors.white, size: 28),
                            onPressed: nextChapterId != null ? () => _navigateToChapter(nextChapterId!) : null,
                            color: nextChapterId != null ? Colors.white : Colors.white30,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
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
