import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';
import 'package:mekuru/core/widgets/comic_image.dart';
import 'package:mekuru/core/widgets/expandable_text.dart';

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
                  lastReadChapterId: bottomState.interaction?.lastReadChapterId,
                  readChapterIds: bottomState.interaction?.readChapterIds ?? [],
                  isSortDescending: bottomState.isChapterSortDescending,
                  onToggleSort: () => bottomNotifier.toggleChapterSort(),
                  onChapterTap: (chapter) async {
                    Navigator.pop(context);
                    await context.push('/viewer/$providerId/$comicId/${chapter.id}');
                  },
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
              Text('發生錯誤: ${state.error ?? "無法載入漫畫資訊"}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => notifier.loadDetails(),
                child: const Text('重新載入'),
              ),
            ],
          ),
        ),
      );
    }

    final comic = state.comic!;
    final isFavorite = state.interaction?.isFavorite ?? false;
    final lastReadChapterId = state.interaction?.lastReadChapterId;

    // Format last updated time
    String updatedTimeStr = '未知';
    if (state.interaction?.sourceUpdatedAt != null) {
      updatedTimeStr = DateFormat('yyyy-MM-dd').format(state.interaction!.sourceUpdatedAt!);
    } else if (state.chapters.isNotEmpty) {
      // Fallback to latest chapter's publishedAt
      final latest = state.isChapterSortDescending ? state.chapters.first : state.chapters.last;
      if (latest.publishedAt?.isNotEmpty == true) {
        updatedTimeStr = latest.publishedAt!.split(' ').first;
      }
    }

    // Build Status Chips
    final List<Widget> statusChips = [];
    
    // 1. Status (連載中 / 完結)
    if (comic.status.isNotEmpty) {
      statusChips.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? Colors.white24 : Colors.black12,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            comic.status,
            style: TextStyle(
              fontSize: 11, 
              color: isDark ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      );
      statusChips.add(const SizedBox(width: 8));
    }

    // 2. Chapters Count (更新至 X 話)
    if (state.chapters.isNotEmpty) {
      statusChips.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '更新至 ${state.chapters.length} 話',
            style: const TextStyle(
              fontSize: 11, 
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      );
      statusChips.add(const SizedBox(width: 8));
    }
    
    // 3. Date
    statusChips.add(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.update_rounded, size: 14, color: isDark ? Colors.white54 : Colors.black54),
          const SizedBox(width: 4),
          Text(
            updatedTimeStr,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white54 : Colors.black54,
            ),
          ),
        ],
      )
    );

    return Scaffold(
      body: Stack(
        children: [
          // 1. Fixed Blurred Background
          if (comic.coverUrl != null)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: ComicImage(
                  imageUrl: comic.coverUrl!,
                  providerId: comic.providerId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Darken overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.3),
            ),
          ),
          
          // 2. Scrollable Content
          CustomScrollView(
            slivers: [
              // Transparent AppBar
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: true,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.black.withValues(alpha: 0.4),
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 22),
                      onPressed: () => context.pop(),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.black.withValues(alpha: 0.4),
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: isFavorite ? Colors.redAccent : Colors.white,
                          size: 22,
                        ),
                        onPressed: () => notifier.toggleFavorite(),
                      ),
                    ),
                  ),
                ],
              ),
              
              // Spacer to expose the blurred background
              const SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
              
              // The White/Dark Card Wrapper
              SliverToBoxAdapter(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Card Background
                    Container(
                      margin: const EdgeInsets.only(top: 60), // Space for poster to pop out
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Structural Row for the Header
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Placeholder for the poster
                                const SizedBox(width: 120, height: 120), // 180 height - 60 popped out = 120 inside
                                const SizedBox(width: 16),
                                // Metadata (Title, Author, Status)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          comic.title,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            height: 1.3,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        if (comic.author != null && comic.author!.isNotEmpty)
                                          Text(
                                            comic.author!,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: isDark ? Colors.white54 : Colors.black54,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        const SizedBox(height: 12),
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          runSpacing: 8,
                                          children: statusChips,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Tags & Description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (comic.tags != null && comic.tags!.isNotEmpty) ...[
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: comic.tags!.map((tag) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: isDark 
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
                                  ExpandableText(
                                    text: comic.description!,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.6,
                                      color: isDark ? Colors.white70 : Colors.black87,
                                    ),
                                  ),
                                  
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // The Actual Poster overlapping the card bounds safely
                    Positioned(
                      top: 0,
                      left: 16,
                      child: Hero(
                        tag: 'cover_${comic.comicId}',
                        child: Container(
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: ComicImage(
                            imageUrl: comic.coverUrl ?? '',
                            providerId: comic.providerId,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                  onPressed: () async {
                    if (state.chapters.isEmpty) return;
                    String targetChapterId = state.chapters.first.id;
                    if (state.isChapterSortDescending) {
                      targetChapterId = state.chapters.last.id;
                    }
                    
                    if (lastReadChapterId != null) {
                      targetChapterId = lastReadChapterId;
                    }
                    
                    await context.push('/viewer/$providerId/$comicId/$targetChapterId');
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
                color: isDark 
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
                      color: isDark ? Colors.white : Colors.black87,
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
