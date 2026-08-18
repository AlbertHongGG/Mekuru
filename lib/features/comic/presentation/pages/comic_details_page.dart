import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';

class ComicDetailsPage extends ConsumerWidget {
  final String providerId;
  final String comicId;

  const ComicDetailsPage({
    super.key,
    required this.providerId,
    required this.comicId,
  });

  void _showChapterList(BuildContext context, WidgetRef ref, ComicDetailsState state, ComicDetailsNotifier notifier) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final bottomState = ref.watch(comicDetailsProvider((providerId: providerId, comicId: comicId)));
            final bottomNotifier = ref.read(comicDetailsProvider((providerId: providerId, comicId: comicId)).notifier);
            
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SafeArea(
                child: ChapterListBottomSheet(
                  providerId: providerId,
                  comicId: comicId,
                  chapters: bottomState.chapters,
                  lastReadChapterId: bottomState.interaction?.lastReadChapter,
                  isSortDescending: bottomState.isChapterSortDescending,
                  onToggleSort: () => bottomNotifier.toggleChapterSort(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arg = (providerId: providerId, comicId: comicId);
    final state = ref.watch(comicDetailsProvider(arg));
    final notifier = ref.read(comicDetailsProvider(arg).notifier);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      );
    }

    if (state.error != null || state.comic == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('發生錯誤: ${state.error ?? "找不到漫畫資料"}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => notifier.loadDetails(),
                child: const Text('重試'),
              ),
            ],
          ),
        ),
      );
    }

    final comic = state.comic!;
    final isFavorite = state.interaction?.isFavorite ?? false;
    final lastReadChapterId = state.interaction?.lastReadChapter;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: comic.coverUrl != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          comic.coverUrl!,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Theme.of(context).scaffoldBackgroundColor,
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(child: Icon(Icons.image_not_supported, size: 64)),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.redAccent : Colors.white,
                ),
                onPressed: () => notifier.toggleFavorite(),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic.title ?? '無標題',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (comic.tags != null && comic.tags!.isNotEmpty) ...[
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: comic.tags!.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark 
                                ? Colors.white10 
                                : Colors.black.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (comic.description != null && comic.description!.isNotEmpty)
                    Text(
                      comic.description!,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  const SizedBox(height: 40), // Spacer for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (state.chapters.isEmpty) return;
                    String targetChapterId = state.chapters.last.id; // Default to oldest/first chapter
                    
                    if (lastReadChapterId != null) {
                      // Validate if chapter still exists
                      final exists = state.chapters.any((c) => c.id == lastReadChapterId);
                      if (exists) targetChapterId = lastReadChapterId;
                    }
                    
                    context.push('/viewer/$providerId/$comicId/$targetChapterId');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    lastReadChapterId != null ? '繼續閱讀' : '開始閱讀',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Material(
                color: Theme.of(context).brightness == Brightness.dark 
                    ? Colors.white10 
                    : Colors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => _showChapterList(context, ref, state, notifier),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.format_list_bulleted_rounded,
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
