import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/cache/comic_image_pipeline.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';
import 'package:mekuru/features/viewer/domain/services/viewer_preload_scheduler.dart';
import 'package:mekuru/features/viewer/presentation/coordinators/viewer_scroll_tracker.dart';
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

  late final ViewerPreloadScheduler _preloadScheduler;
  ViewerScrollTracker? _scrollTracker;
  late final ComicViewerNotifier _notifier;

  @override
  void initState() {
    super.initState();
    // Configure high-performance image cache budget for comic reading
    PaintingBinding.instance.imageCache.maximumSizeBytes = 250 * 1024 * 1024; // 250MB
    PaintingBinding.instance.imageCache.maximumSize = 100;

    _preloadScheduler = ViewerPreloadScheduler();

    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    _notifier = ref.read(comicViewerProvider(arg).notifier);
  }

  void _setupScrollControllerAndTracker(double initialOffset, int initialIndex) {
    if (_scrollController != null) return;
    _scrollController = ScrollController(initialScrollOffset: initialOffset);

    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    _scrollTracker = ViewerScrollTracker(
      scrollController: _scrollController!,
      activeKeys: _activeKeys,
      getTotalPages: () => ref.read(comicViewerProvider(arg)).pages.length,
      initialIndex: initialIndex,
      initialOffset: initialOffset,
      onVisibleIndexChanged: (newIndex) {
        _currentIndexNotifier.value = newIndex;
        // Notify preloader immediately of the sliding window update
        _preloadScheduler.updateWindow(currentIndex: newIndex);
      },
      onSaveProgress: (anchorIndex, anchorOffset) async {
        await _notifier.updateProgress(anchorIndex, anchorOffset);
      },
    );

    _scrollController!.addListener(_onScroll);
  }

  void _onScroll() {
    _scrollTracker?.onScroll();
  }

  @override
  void dispose() {
    _scrollTracker?.dispose();
    _preloadScheduler.dispose();
    ComicImagePipeline.instance.resetSession();
    _scrollController?.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  void _updatePageHeight(int index, double height) {
    if (_pageHeights[index] != height) {
      _pageHeights[index] = height;
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
    _scrollTracker?.saveNow();
    _preloadScheduler.dispose();
    ComicImagePipeline.instance.resetSession();
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
      _setupScrollControllerAndTracker(state.initialAnchorOffset, state.initialAnchorIndex);

      // Start intelligent preloader immediately upon chapter load!
      try {
        final registry = ref.read(providerRegistryProvider);
        final provider = registry.getProvider(widget.providerId);
        _preloadScheduler.start(
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
                          // Rationalized cache extent: ~1 screen height to prevent initial network saturation
                          // ignore: deprecated_member_use
                          cacheExtent: 800.0,
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
