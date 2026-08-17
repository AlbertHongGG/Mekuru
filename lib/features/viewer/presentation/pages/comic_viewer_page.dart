import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extended_image/extended_image.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/viewer/presentation/providers/comic_viewer_provider.dart';

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
  bool _showUI = true;

  final ScrollController _scrollController = ScrollController();
  int _lastReportedPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Basic estimation based on scroll position (assuming rough height per image)
    // A more precise way would be using scrollable_positioned_list, but this is a simple approximation
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.read(comicViewerProvider(arg));
    if (state.pages.isEmpty) return;
    
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll <= 0) return;
    
    final percentage = currentScroll / maxScroll;
    final estimatedPage = (percentage * state.pages.length).clamp(0, state.pages.length - 1).toInt();
    
    if (estimatedPage != _lastReportedPage && estimatedPage > _lastReportedPage) {
      _lastReportedPage = estimatedPage;
      ref.read(comicViewerProvider(arg).notifier).updateReadPage(estimatedPage);
    }
  }


  void _toggleUI() {
    setState(() {
      _showUI = !_showUI;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arg = (providerId: widget.providerId, comicId: widget.comicId, chapterId: widget.chapterId);
    final state = ref.watch(comicViewerProvider(arg));

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: _showUI
          ? AppBar(
              backgroundColor: Colors.black.withOpacity(0.7),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      body: GestureDetector(
        onTap: _toggleUI,
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : state.error != null
                ? Center(child: Text('發生錯誤: ${state.error}', style: const TextStyle(color: Colors.white)))
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
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return const SizedBox(
                                  height: 300,
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              case LoadState.completed:
                                return null; // Uses the default image
                              case LoadState.failed:
                                return SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(Icons.refresh, color: Colors.white),
                                      onPressed: () => state.reLoadImage(),
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
    );
  }
}
