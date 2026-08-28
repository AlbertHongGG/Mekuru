import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/domain/models/chapter.dart';

class ChapterListBottomSheet extends StatefulWidget {
  final String providerId;
  final String comicId;
  final List<Chapter> chapters;
  final String? lastReadChapterId;
  final List<String> readChapterIds;
  final bool isSortDescending;
  final VoidCallback onToggleSort;
  final void Function(Chapter)? onChapterTap;

  const ChapterListBottomSheet({
    super.key,
    required this.providerId,
    required this.comicId,
    required this.chapters,
    required this.lastReadChapterId,
    this.readChapterIds = const [],
    required this.isSortDescending,
    required this.onToggleSort,
    this.onChapterTap,
  });

  @override
  State<ChapterListBottomSheet> createState() => _ChapterListBottomSheetState();
}

class _ChapterListBottomSheetState extends State<ChapterListBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryTextColor = isDark ? Colors.white54 : Colors.black54;

    return Column(
      children: [
        // Handle
        Center(
          child: Container(
            width: 48,
            height: 5,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isDark ? Colors.white24 : Colors.black12,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            height: 36,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Left: Chapter Count
                Positioned(
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.5),
                    child: Text(
                      '共 ${widget.chapters.length} 話',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                ),
                // Center: Title
                Text(
                  '章節列表',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                // Right: Sort Icon
                Positioned(
                  right: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: widget.onToggleSort,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              widget.isSortDescending ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                              size: 16,
                              color: isDark ? Colors.white70 : Colors.black87,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.isSortDescending ? '最新' : '最舊',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white70 : Colors.black87,
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
          ),
        ),
        const SizedBox(height: 16),
        // List
        Expanded(
          child: widget.chapters.isEmpty
              ? Center(
                  child: Text(
                    '尚無章節資料',
                    style: TextStyle(color: secondaryTextColor),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: widget.chapters.length,
                  itemBuilder: (context, index) {
                    final chapter = widget.chapters[index];
                    final isLastRead = chapter.id == widget.lastReadChapterId;
                    final isRead = widget.readChapterIds.contains(chapter.id);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            if (widget.onChapterTap != null) {
                              widget.onChapterTap!(chapter);
                            } else {
                              context.push('/viewer/${widget.providerId}/${widget.comicId}/${chapter.id}');
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isLastRead 
                                  ? AppColors.primary.withValues(alpha: 0.1) 
                                  : (isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.03)),
                              borderRadius: BorderRadius.circular(12),
                              border: isLastRead
                                  ? Border.all(color: AppColors.primary.withValues(alpha: 0.5), width: 1)
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    chapter.title,
                                    style: TextStyle(
                                      fontWeight: isLastRead ? FontWeight.bold : FontWeight.w500,
                                      color: isLastRead 
                                          ? AppColors.primary 
                                          : isRead 
                                              ? (isDark ? Colors.white30 : Colors.black38)
                                              : (isDark ? Colors.white : Colors.black87),
                                    ),
                                  ),
                                ),
                                if (isLastRead)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      '上次觀看',
                                      style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                else if (chapter.publishedAt != null)
                                  Text(
                                    chapter.publishedAt!,
                                    style: TextStyle(fontSize: 12, color: secondaryTextColor),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
