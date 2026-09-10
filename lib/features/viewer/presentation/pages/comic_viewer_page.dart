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
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  
  Timer? _actionDebounceTimer;
  
  final Map<int, GlobalKey> _activeKeys = {};
  final Map<int, double> _pageHeights = {};
  
  bool _initialized = false;
  bool _targetImageLoaded = false;
  int _lastSavedPacked = -1;

  late final dynamic _notifier;

  int _currentAnchorIndex = 0;
  double _currentAnchorOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(comicViewerProvider((providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId)).notifier);
  }
  
  void _setupScrollController(double initialOffset) {
    if (_scrollController != null) return;
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
    _scrollController!.addListener(() {
      _calculateUIProgress();
      _calculateSaveAnchor();
      
      // 【效能徹底解放】: 當畫面在滑動時，絕對不進行任何重度運算。
      // 只有當手指離開、且畫面完全靜止 500 毫秒後，才在背景存檔與預載。
      _actionDebounceTimer?.cancel();
      _actionDebounceTimer = Timer(const Duration(milliseconds: 500), () {
        _saveProgress();
        _notifier.triggerPreload(_currentIndexNotifier.value);
      });
    });
  }

  @override
  void dispose() {
    _actionDebounceTimer?.cancel();
    _saveProgress(); 
    _scrollController?.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  void _updatePageHeight(int index, double height) {
    if (_pageHeights[index] != height) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _pageHeights[index] = height;
          });
        }
      });
    }
  }

  void _calculateSaveAnchor() {
    if (!_targetImageLoaded || _activeKeys.isEmpty || _scrollController == null || !_scrollController!.hasClients) return;
    
    final context = _scrollController!.position.context.notificationContext;
    if (context == null) return;
    final viewportBox = context.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;

    double? bestOffset;
    int bestIndex = 0;

    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final totalPages = ref.read(comicViewerProvider(arg)).pages.length;
    if (totalPages == 0) return;

    final currentIndex = _currentIndexNotifier.value;
    final startIndex = (currentIndex - 3).clamp(0, totalPages > 0 ? totalPages - 1 : 0);
    final endIndex = (currentIndex + 3).clamp(0, totalPages > 0 ? totalPages - 1 : 0);

    for (int i = startIndex; i <= endIndex; i++) {
      final key = _activeKeys[i];
      if (key != null && key.currentContext != null) {
        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
          final top = position.dy;
          final bottom = top + renderBox.size.height;
          
          if (bottom > 0) { 
            if (top <= 0 && bottom > 0) {
              _currentAnchorIndex = i;
              _currentAnchorOffset = -top;
              return;
            } else if (top > 0) {
              if (bestOffset == null || top < bestOffset) {
                bestOffset = top;
                bestIndex = i;
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

  void _calculateUIProgress() {
    if (!_targetImageLoaded || _activeKeys.isEmpty || _scrollController == null || !_scrollController!.hasClients) return;
    
    final context = _scrollController!.position.context.notificationContext;
    if (context == null) return;
    final viewportBox = context.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;
    
    final viewportHeight = viewportBox.size.height;
    
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.read(comicViewerProvider(arg));
    final totalPages = state.pages.length;
    if (totalPages == 0) return;

    final position = _scrollController!.position;
    
    if (position.pixels >= position.maxScrollExtent - 2) {
      _updateUiIndex(totalPages - 1);
      return;
    }
    
    if (position.pixels <= position.minScrollExtent + 2) {
      _updateUiIndex(0);
      return;
    }

    int maxAreaIndex = _currentIndexNotifier.value;
    double maxArea = -1.0;

    final currentIndex = _currentIndexNotifier.value;
    final startIndex = (currentIndex - 3).clamp(0, totalPages > 0 ? totalPages - 1 : 0);
    final endIndex = (currentIndex + 3).clamp(0, totalPages > 0 ? totalPages - 1 : 0);

    for (int i = startIndex; i <= endIndex; i++) {
      final key = _activeKeys[i];
      if (key != null && key.currentContext != null) {
        final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final renderPosition = renderBox.localToGlobal(Offset.zero, ancestor: viewportBox);
          final top = renderPosition.dy;
          final bottom = top + renderBox.size.height;
          
          if (bottom > 0 && top < viewportHeight) {
            final visibleTop = top < 0 ? 0.0 : top;
            final visibleBottom = bottom > viewportHeight ? viewportHeight : bottom;
            final visibleHeight = visibleBottom - visibleTop;
            
            if (visibleHeight > maxArea) {
               maxArea = visibleHeight;
               maxAreaIndex = i;
            }
          }
        }
      }
    }
    
    _updateUiIndex(maxAreaIndex);
  }

  void _updateUiIndex(int newIndex) {
    if (_currentIndexNotifier.value != newIndex) {
      _currentIndexNotifier.value = newIndex;
    }
  }

  void _saveProgress() {
    int packed = (_currentAnchorIndex * 1000000) + _currentAnchorOffset.toInt();
    if (packed != _lastSavedPacked) {
      _lastSavedPacked = packed;
      _notifier.updateProgress(_currentAnchorIndex, _currentAnchorOffset);
    }
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
    _actionDebounceTimer?.cancel();
    _saveProgress(); 
    context.pushReplacement('/viewer/${widget.providerId}/${widget.comicId}/$chapterId');
  }

  @override
  Widget build(BuildContext context) {
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.watch(comicViewerProvider(arg));
    
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultHeight = screenWidth > 0 ? screenWidth * 1.5 : 800.0;

    if (!_initialized && state.pages.isNotEmpty) {
      _initialized = true;
      _currentAnchorIndex = state.initialAnchorIndex;
      _currentAnchorOffset = state.initialAnchorOffset;
      
      _currentIndexNotifier.value = _currentAnchorIndex;
      if (_currentAnchorOffset <= 0.0) {
        _targetImageLoaded = true;
      }
      _setupScrollController(state.initialAnchorOffset);
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
                  : Stack(
                        children: [
                          CustomScrollView(
                            controller: _scrollController,
                            // 【邊界鎖死】: 強迫掛載整話空殼，徹底剝奪 Flutter 在邊界瞎猜高度的權力，根除瞬間位移
                            // ignore: deprecated_member_use
                            cacheExtent: double.infinity,
                            physics: const ClampingScrollPhysics(), 
                            center: state.pages.isNotEmpty ? centerKey : null,
                            slivers: [
                              // 【完美跳轉架構】: 回歸原生 centerKey 雙向列表，確保絕對無損精準跳轉
                              if (state.pages.isNotEmpty && initialIndex > 0)
                                SliverList.builder(
                                  itemCount: initialIndex,
                                  itemBuilder: (context, idx) {
                                    final reversedIndex = initialIndex - 1 - idx;
                                    return _buildPage(state.pages[reversedIndex].imageUrl, reversedIndex, state.initialAnchorIndex, screenWidth, defaultHeight);
                                  },
                                ),
                              if (state.pages.isNotEmpty)
                                SliverList.builder(
                                  key: centerKey,
                                  itemCount: state.pages.length - initialIndex,
                                  itemBuilder: (context, idx) {
                                    final realIndex = initialIndex + idx;
                                    return _buildPage(state.pages[realIndex].imageUrl, realIndex, state.initialAnchorIndex, screenWidth, defaultHeight);
                                  },
                                ),
                            ],
                          ),
                          if (!_targetImageLoaded)
                            Container(
                              color: Colors.black,
                              child: const Center(
                                child: CircularProgressIndicator(color: AppColors.primary),
                              ),
                            ),
                        ],
                      ),

          ViewerTopBar(
            isVisible: _showUI,
            comicTitle: state.comicTitle,
            chapterTitle: state.chapterTitle,
            onMenuPressed: () => _showChapterList(),
          ),

          ViewerBottomBar(
            isVisible: _showUI,
            currentIndexNotifier: _currentIndexNotifier,
            totalPages: state.pages.length,
            hasPages: state.pages.isNotEmpty,
            onPrevChapter: state.prevChapterId != null ? () => _navigateToChapter(state.prevChapterId!) : null,
            onNextChapter: state.nextChapterId != null ? () => _navigateToChapter(state.nextChapterId!) : null,
          ),
        ],
      ),
    );
  }
  
  Widget _buildPage(String imageUrl, int index, int initialAnchorIndex, double screenWidth, double defaultHeight) {
    final key = _activeKeys.putIfAbsent(index, () => GlobalKey());
    
    // 【極限資源虛擬化】: 利用 ValueListenableBuilder 單獨更新此元件，防爆 OOM
    return GestureDetector(
      onTap: _toggleUI,
      behavior: HitTestBehavior.opaque,
      child: ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (context, currentIndex, child) {
          final isNear = (index - currentIndex).abs() <= 5;
          final exactHeight = _pageHeights[index] ?? defaultHeight;

          // 如果超出視角 5 頁外，立刻卸載真實圖片，只留下輕量的精確高度空殼
          if (!isNear) {
            return Container(
              key: key,
              width: double.infinity,
              height: exactHeight,
              color: Colors.transparent,
            );
          }

          return Container(
            key: key,
            width: double.infinity,
            color: Colors.transparent,
            child: ComicImage(
              imageUrl: imageUrl,
              providerId: widget.providerId,
              fit: BoxFit.fitWidth, 
              loadStateChanged: (ExtendedImageState imgState) {
                final loadState = imgState.extendedImageLoadState;
                
                if (loadState == LoadState.completed || loadState == LoadState.failed) {
                  if (index == initialAnchorIndex && !_targetImageLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        setState(() {
                          _targetImageLoaded = true;
                        });
                      }
                    });
                  }
                }

                if (loadState == LoadState.completed) {
                  final imgInfo = imgState.extendedImageInfo;
                  if (imgInfo != null && screenWidth > 0) {
                     final image = imgInfo.image;
                     final actualHeight = screenWidth * (image.height / image.width);
                     _updatePageHeight(index, actualHeight);
                  }
                  return null; 
                }

                switch (loadState) {
                  case LoadState.loading:
                    return SizedBox(
                      height: exactHeight,
                      child: WebtoonImagePlaceholder(index: index),
                    );
                  case LoadState.completed:
                    return null; 
                  case LoadState.failed:
                    return SizedBox(
                      height: exactHeight,
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
          );
        },
      ),
    );
  }
}
