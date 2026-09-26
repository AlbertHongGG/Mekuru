import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';
import 'package:mekuru/features/viewer/presentation/coordinators/viewer_preload_coordinator.dart';
import 'package:mekuru/features/viewer/presentation/coordinators/viewer_progress_coordinator.dart';
import 'package:mekuru/features/viewer/presentation/providers/comic_viewer_provider.dart';
import 'package:mekuru/features/viewer/presentation/widgets/viewer_bottom_bar.dart';
import 'package:mekuru/features/viewer/presentation/widgets/viewer_image_tile.dart';
import 'package:mekuru/features/viewer/presentation/widgets/viewer_top_bar.dart';

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

  final Map<int, GlobalKey> _activeKeys = {};
  final Map<int, double> _pageHeights = {};

  bool _initialized = false;
  bool _targetImageLoaded = false;

  late final ViewerPreloadCoordinator _preloadCoordinator;
  late final ViewerProgressCoordinator _progressCoordinator;
  late final ComicViewerNotifier _notifier;

  @override
  void initState() {
    super.initState();
    // Configure high-performance image cache budget for comic reading
    PaintingBinding.instance.imageCache.maximumSizeBytes = 250 * 1024 * 1024; // 250MB
    PaintingBinding.instance.imageCache.maximumSize = 100;

    _preloadCoordinator = ViewerPreloadCoordinator();

    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    _notifier = ref.read(comicViewerProvider(arg).notifier);

    _progressCoordinator = ViewerProgressCoordinator(
      onSaveProgress: (anchorIndex, anchorOffset) async {
        await _notifier.updateProgress(anchorIndex, anchorOffset);
      },
    );
  }

  void _setupScrollController(double initialOffset) {
    if (_scrollController != null) return;
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
    _scrollController!.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController == null || !_scrollController!.hasClients) return;

    // 1. Calculate active UI index and immediately update preloader
    _calculateUIProgress();

    // 2. Calculate save anchor and notify debounced progress coordinator
    _calculateSaveAnchor();
  }

  @override
  void dispose() {
    _progressCoordinator.dispose();
    _preloadCoordinator.dispose();
    _scrollController?.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  void _updatePageHeight(int index, double height) {
    if (_pageHeights[index] != height) {
      _pageHeights[index] = height;
    }
  }

  void _calculateSaveAnchor() {
    if (!_targetImageLoaded || _activeKeys.isEmpty || _scrollController == null || !_scrollController!.hasClients) return;

    final context = _scrollController!.position.context.notificationContext;
    if (context == null) return;
    final viewportBox = context.findRenderObject() as RenderBox?;
    if (viewportBox == null) return;

    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final totalPages = ref.read(comicViewerProvider(arg)).pages.length;
    if (totalPages == 0) return;

    final currentIndex = _currentIndexNotifier.value;
    final startIndex = (currentIndex - 3).clamp(0, totalPages > 0 ? totalPages - 1 : 0);
    final endIndex = (currentIndex + 3).clamp(0, totalPages > 0 ? totalPages - 1 : 0);

    double? bestOffset;
    int bestIndex = 0;

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
              _progressCoordinator.onAnchorChanged(i, -top);
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
      _progressCoordinator.onAnchorChanged(bestIndex, 0.0);
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
      // Preload sliding window updates immediately without artificial debounce!
      _preloadCoordinator.onCurrentIndexChanged(newIndex);
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
    _progressCoordinator.saveNow();
    _preloadCoordinator.dispose();
    context.pushReplacement('/viewer/${widget.providerId}/${widget.comicId}/$chapterId');
  }

  @override
  Widget build(BuildContext context) {
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.watch(comicViewerProvider(arg));

    final screenWidth = MediaQuery.of(context).size.width;

    if (!_initialized && state.pages.isNotEmpty) {
      _initialized = true;
      _currentIndexNotifier.value = state.initialAnchorIndex;

      if (state.initialAnchorOffset <= 0.0) {
        _targetImageLoaded = true;
      }
      _setupScrollController(state.initialAnchorOffset);

      // Start intelligent preloader immediately upon chapter load!
      try {
        final registry = ref.read(providerRegistryProvider);
        final provider = registry.getProvider(widget.providerId);
        _preloadCoordinator.start(
          provider: provider,
          pages: state.pages,
          initialIndex: state.initialAnchorIndex,
        );
      } catch (e) {
        debugPrint('[ComicViewerPage] Failed to start preloader: $e');
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
                  : Stack(
                      children: [
                        CustomScrollView(
                          controller: _scrollController,
                          // Standard smooth virtualization cache extent (2.5 ~ 3 screens)
                          // ignore: deprecated_member_use
                          cacheExtent: 2500.0,
                          physics: const ClampingScrollPhysics(),
                          center: state.pages.isNotEmpty ? centerKey : null,
                          slivers: [
                            if (state.pages.isNotEmpty && initialIndex > 0)
                              SliverList.builder(
                                itemCount: initialIndex,
                                itemBuilder: (context, idx) {
                                  final reversedIndex = initialIndex - 1 - idx;
                                  return _buildTile(
                                    state.pages[reversedIndex].imageUrl,
                                    reversedIndex,
                                    state.initialAnchorIndex,
                                    screenWidth,
                                  );
                                },
                              ),
                            if (state.pages.isNotEmpty)
                              SliverList.builder(
                                key: centerKey,
                                itemCount: state.pages.length - initialIndex,
                                itemBuilder: (context, idx) {
                                  final realIndex = initialIndex + idx;
                                  return _buildTile(
                                    state.pages[realIndex].imageUrl,
                                    realIndex,
                                    state.initialAnchorIndex,
                                    screenWidth,
                                  );
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

  Widget _buildTile(String imageUrl, int index, int initialAnchorIndex, double screenWidth) {
    final key = _activeKeys.putIfAbsent(index, () => GlobalKey());

    return ViewerImageTile(
      key: ValueKey('page_$index'),
      itemKey: key,
      index: index,
      imageUrl: imageUrl,
      providerId: widget.providerId,
      screenWidth: screenWidth,
      estimatedHeight: _pageHeights[index],
      onToggleUI: _toggleUI,
      onHeightMeasured: (measuredIndex, actualHeight) {
        _updatePageHeight(measuredIndex, actualHeight);
        if (measuredIndex == initialAnchorIndex && !_targetImageLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _targetImageLoaded = true;
              });
            }
          });
        }
      },
    );
  }
}
