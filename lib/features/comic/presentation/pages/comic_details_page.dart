import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';
import 'package:mekuru/features/archive/presentation/providers/archive_provider.dart';
import 'package:mekuru/features/comic/presentation/widgets/chapter_list_bottom_sheet.dart';
import 'package:mekuru/core/widgets/comic_image.dart';
import 'package:mekuru/core/widgets/expandable_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mekuru/features/archive/presentation/widgets/backup_task_dialog.dart';
import 'package:mekuru/features/archive/presentation/providers/backup_task_provider.dart';
import 'package:mekuru/core/widgets/swipe_to_obliterate_button.dart';

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
      extendBody: true,
      body: Stack(
        children: [
          // 1. Fixed Blurred Background (Scaled up to hide bleed, Clipped to prevent transition ghosting)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRect(
              child: Transform.scale(
                scale: 1.15,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 25, sigmaY: 25, tileMode: TileMode.mirror),
                  child: ComicImage(
                    imageUrl: comic.coverUrl,
                    providerId: comic.providerId,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
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
                  if (providerId == 'local')
                    _buildActionButton(
                      icon: Icons.update_rounded,
                      onPressed: () async {
                        final notificationCtrl = ref.read(notificationProvider.notifier);
                        final added = await ref.read(comicDetailsProvider((providerId: providerId, comicId: comicId)).notifier).checkLocalUpdate();
                        if (added == null) {
                          notificationCtrl.showError('檢查更新失敗');
                        } else if (added == 0) {
                          notificationCtrl.showInfo('已是最新版本');
                        } else {
                          notificationCtrl.showSuccess('成功追加 $added 尚未封存章節');
                        }
                      },
                    ),
                  if (providerId != 'local')
                    Consumer(
                      builder: (context, ref, _) {
                        final archiveState = ref.watch(archiveProvider);
                        final originalProviderId = comic.providerId;
                        final isQueued = archiveState.tasks.any((t) => t.comicId == comicId && t.providerId == (providerId == 'local' ? originalProviderId : providerId));
                        
                        return _buildActionButton(
                          icon: isQueued ? Icons.cloud_done_rounded : Icons.download_rounded,
                          color: isQueued ? Colors.greenAccent : Colors.white,
                          onPressed: () async {
                            final notificationCtrl = ref.read(notificationProvider.notifier);
                            if (isQueued) {
                              notificationCtrl.showInfo('已在下載佇列');
                              return;
                            }
                            final targetProvider = providerId == 'local' ? originalProviderId : providerId;
                            final error = await ref.read(archiveProvider.notifier).startDownload(targetProvider, comicId);
                            if (error == null) {
                              notificationCtrl.showSuccess('已加入下載任務');
                            } else {
                              notificationCtrl.showError('加入失敗: $error');
                            }
                          },
                        );
                      },
                    ),
                  if (providerId == 'local')
                    _buildActionButton(
                      icon: Icons.ios_share_rounded,
                      onPressed: () async {
                        final selectedDirectory = await FilePicker.getDirectoryPath(dialogTitle: '選擇匯出資料夾');
                        if (selectedDirectory != null) {
                          if (!context.mounted) return;
                          final notificationCtrl = ref.read(notificationProvider.notifier);
                          await runWithBackupDialog(context, ref, () async {
                            await ref.read(comicDetailsProvider((providerId: providerId, comicId: comicId)).notifier).exportLocalComic(selectedDirectory);
                          });
                          
                          final backupState = ref.read(backupTaskProvider);
                          if (backupState.error != null) {
                            notificationCtrl.showError('匯出漫畫失敗: ${backupState.error}');
                          } else {
                            notificationCtrl.showSuccess('漫畫匯出完成');
                          }
                        }
                      },
                    ),
                  _buildActionButton(
                    icon: isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    color: isFavorite ? Colors.redAccent : Colors.white,
                    onPressed: () => notifier.toggleFavorite(),
                  ),
                  _buildActionButton(
                    icon: Icons.format_list_bulleted_rounded,
                    onPressed: () => _showChapterList(context, ref, state, notifier),
                  ),
                  if (providerId == 'local')
                    _buildActionButton(
                      icon: Icons.delete_outline_rounded,
                      color: Colors.redAccent,
                      padding: const EdgeInsets.only(left: 4.0, right: 12.0, top: 8.0, bottom: 8.0),
                      onPressed: () => _showDeleteBottomSheet(context, ref, comicId),
                    ),
                  if (providerId != 'local')
                    const SizedBox(width: 8.0),
                ],
              ),
              
              // Spacer to expose the blurred background above the card
              const SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
              
              // The White/Dark Card Wrapper
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    // Card Background
                    Container(
                      margin: const EdgeInsets.only(top: 150), // Push card down to let poster pop out
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
                        // Poster height = 252. Poster top = 0. Card top = 150.
                        // Overlap into card = 102. Padding = 102 + 24 = 126.
                        padding: const EdgeInsets.fromLTRB(24, 126, 24, 40),
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
                            
                            // Description (Left aligned for better readability)
                            if (comic.description.isNotEmpty) ...[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ExpandableText(
                                  text: comic.description,
                                  maxLines: 4,
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.8,
                                    color: isDark ? Colors.white70 : Colors.black87,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                            
                            // Tags (Horizontal scroll, below description)
                            if (comic.tags.isNotEmpty)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    children: comic.tags.map((tag) {
                                      return Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: isDark 
                                              ? Colors.white.withValues(alpha: 0.08) 
                                              : Colors.blueGrey.withValues(alpha: 0.08),
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                            color: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.05),
                                          ),
                                        ),
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: isDark ? Colors.white60 : Colors.blueGrey[700],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            
                            // Bottom padding for FAB space
                            const SizedBox(height: 80),
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
                          width: 180,
                          height: 252,
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
                            imageUrl: comic.coverUrl,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // 1. Ultra-Rich Vast Aurora (Faint, highly transparent mesh)
          Positioned(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                width: 220,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: SweepGradient(
                    center: Alignment.center,
                    colors: [
                      const Color(0xFF81D4FA).withValues(alpha: 0.5), // Light Blue
                      const Color(0xFFB39DDB).withValues(alpha: 0.5), // Soft Purple
                      const Color(0xFFF48FB1).withValues(alpha: 0.5), // Vibrant Pink
                      const Color(0xFFFFE082).withValues(alpha: 0.5), // Soft Peach/Yellow
                      const Color(0xFF80CBC4).withValues(alpha: 0.5), // Teal/Cyan
                      const Color(0xFF81D4FA).withValues(alpha: 0.5), // Back to Light Blue
                    ],
                    stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                  ),
                ),
              ),
            ),
          ),
          
          // 2. Crystal Clear Glass Button
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                decoration: BoxDecoration(
                  // Extremely low white opacity to allow the aurora to completely dye the glass
                  color: isDark 
                      ? Colors.white.withValues(alpha: 0.05) 
                      : Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isDark ? Colors.white30 : Colors.white.withValues(alpha: 0.8),
                    width: 1.5,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.menu_book_rounded, 
                            color: isDark ? Colors.white : const Color(0xFF455A64), // Crisp slate color
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            lastReadChapterId != null ? '繼續閱讀' : '開始閱讀',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF455A64),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color color = Colors.white,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
  }) {
    return Padding(
      padding: padding,
      child: Material(
        color: Colors.black.withValues(alpha: 0.4),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: IconButton(
          icon: Icon(icon, color: color, size: 22),
          onPressed: onPressed,
        ),
      ),
    );
  }

  void _showDeleteBottomSheet(BuildContext context, WidgetRef ref, String comicId) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? Colors.white24 : Colors.black12,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                '徹底刪除漫畫',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SwipeToObliterateButton(
              title: '滑動以刪除',
              isLoading: false,
              activeColor: Colors.redAccent,
              onConfirmed: () async {
                Navigator.pop(ctx);
                await ref.read(comicDetailsProvider((providerId: 'local', comicId: comicId)).notifier).confirmDeleteLocalComic();
                if (context.mounted) {
                  context.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}