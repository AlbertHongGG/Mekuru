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
                imageFilter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: ComicImage(
                  imageUrl: comic.coverUrl!,
                  providerId: comic.providerId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Darken overlay to ensure text contrast for app bar icons
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              color: isDark ? Colors.black.withValues(alpha: 0.6) : Colors.white.withValues(alpha: 0.3),
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
              
              // Spacer to expose the blurred background above the card
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              
              // The White/Dark Card Wrapper
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    // Card Background
                    Container(
                      margin: const EdgeInsets.only(top: 100), // Push card down to let poster pop out
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 15,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      // Card Content
                      child: Padding(
                        // Poster height = 196. Poster top = 0. Card top = 100.
                        // Overlap into card = 96. Padding = 96 + 24 = 120.
                        padding: const EdgeInsets.fromLTRB(24, 120, 24, 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Title
                            Text(
                              comic.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            
                            // Author
                            Text(
                              comic.author,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: isDark ? Colors.white60 : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Status & Date Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (comic.status.isNotEmpty) ...[
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.05),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: isDark ? Colors.white24 : Colors.black12,
                                      ),
                                    ),
                                    child: Text(
                                      comic.status,
                                      style: TextStyle(
                                        fontSize: 12, 
                                        color: isDark ? Colors.white : Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                                Icon(Icons.update_rounded, size: 16, color: isDark ? Colors.white54 : Colors.black54),
                                const SizedBox(width: 6),
                                Text(
                                  updatedTimeStr,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isDark ? Colors.white54 : Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 28),
                            
                            // Tags
                            if (comic.tags != null && comic.tags!.isNotEmpty) ...[
                              Wrap(
                                alignment: WrapAlignment.center,
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
                              const SizedBox(height: 32),
                            ],
                            
                            // Description (Left aligned for better readability)
                            if (comic.description != null && comic.description!.isNotEmpty) ...[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ExpandableText(
                                  text: comic.description!,
                                  maxLines: 4,
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.8, // Slightly taller line height for readability
                                    color: isDark ? Colors.white70 : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                            
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                    
                    // Centered Poster Overlapping the Card
                    Positioned(
                      top: 0,
                      child: Hero(
                        tag: 'cover_${comic.comicId}',
                        child: Container(
                          width: 140,
                          height: 196,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
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
