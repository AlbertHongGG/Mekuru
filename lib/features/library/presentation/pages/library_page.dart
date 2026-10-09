import 'package:mekuru/features/library/domain/models/library_sort_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/features/comic/domain/models/comic_card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/features/library/presentation/providers/library_provider.dart';
import 'package:mekuru/core/widgets/search_dialog.dart';
import 'package:mekuru/core/widgets/app_bottom_sheet.dart';
import 'package:mekuru/features/comic/data/sources/provider_registry.dart';
import 'package:mekuru/features/library/presentation/providers/library_update_provider.dart';
import 'package:mekuru/core/notifications/presentation/controllers/notification_controller.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({super.key});

  @override
  ConsumerState<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends ConsumerState<LibraryPage> {
  
  void _showProviderFilterBottomSheet(LibraryState state, ProviderRegistry registry) {
    final items = [
      AppBottomSheetItemData(
        title: '全部來源',
        leadingIcon: Icons.all_inclusive,
        value: 'ALL',
      )
    ];

    for (final providerId in state.availableProviders) {
      String name = providerId;
      try {
        name = registry.getProvider(providerId).providerName;
      } catch (_) {}
      
      items.add(AppBottomSheetItemData(
        title: name,
        leadingIcon: Icons.source,
        value: providerId,
      ));
    }

    AppBottomSheet.show(
      context: context,
      title: '來源篩選',
      items: items,
      selectedValue: state.activeProviderFilter ?? 'ALL',
      onItemSelected: (val) {
        ref.read(libraryProvider.notifier).setProviderFilter(val == 'ALL' ? null : val);
      },
    );
  }

  void _showSortBottomSheet(LibrarySortMode currentSortMode) {
    AppBottomSheet.show(
      context: context,
      title: '排序',
      items: LibrarySortMode.values.map((mode) => AppBottomSheetItemData(
        title: mode.label,
        leadingIcon: mode.icon,
        value: mode,
      )).toList(),
      selectedValue: currentSortMode,
      onItemSelected: (val) {
        ref.read(libraryProvider.notifier).setSortMode(val);
      },
    );
  }

  void _showQuickActionBottomSheet(ComicCardData comic) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white24 : Colors.black12,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                Text(
                  comic.title ?? '漫畫操作',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.info_outline_rounded, color: AppColors.primary, size: 20),
                  ),
                  title: const Text('查看詳情', style: TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pop(ctx);
                    context.push('/details/${comic.providerId}/${comic.comicId}');
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.heart_broken_rounded, color: Colors.redAccent, size: 20),
                  ),
                  title: const Text(
                    '從書庫移除 (取消最愛)',
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
                  ),
                  onTap: () async {
                    Navigator.pop(ctx);
                    final success = await ref.read(libraryProvider.notifier).removeFavorite(comic.providerId, comic.comicId);
                    if (mounted) {
                      final notif = ref.read(notificationProvider.notifier);
                      if (success) {
                        notif.showInfo('已從書庫移除');
                      } else {
                        notif.showError('移除失敗');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(libraryProvider);
    final registry = ref.watch(providerRegistryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.searchQuery.isNotEmpty ? '搜尋: ${state.searchQuery}' : '書庫'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.filter_list_rounded),
                if (state.activeProviderFilter != null)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () => _showProviderFilterBottomSheet(state, registry),
          ),
          IconButton(
            icon: const Icon(Icons.sort_rounded),
            onPressed: () => _showSortBottomSheet(state.sortMode),
          ),
          IconButton(
            icon: Icon(state.searchQuery.isNotEmpty ? Icons.close_rounded : Icons.search_rounded),
            onPressed: () {
              if (state.searchQuery.isNotEmpty) {
                ref.read(libraryProvider.notifier).setSearchQuery('');
              } else {
                showDialog(
                  context: context,
                  builder: (_) => SearchDialog(
                    initialQuery: state.searchQuery,
                    hintText: '在書庫中搜尋...',
                    onSearch: (query) {
                      ref.read(libraryProvider.notifier).setSearchQuery(query);
                    },
                    onClear: () {
                      ref.read(libraryProvider.notifier).setSearchQuery('');
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final updateState = ref.watch(libraryUpdateProvider);
                if (!updateState.isUpdating) return const SizedBox.shrink();
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  color: AppColors.primary.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Checking for updates (${updateState.completedTasks}/${updateState.totalTasks})...',
                        style: const TextStyle(fontSize: 12, color: AppColors.primary),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: state.isLoading && state.displayItems.isEmpty
                  ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                  : state.error != null
                      ? Center(child: Text('Error: ${state.error}'))
                      : _buildGridView(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(LibraryState state) {
    if (state.displayItems.isEmpty) {
      if (state.rawFavorites.isNotEmpty) {
        return const Center(child: Text('找不到符合篩選條件的漫畫'));
      }
      return const Center(child: Text('書庫空空如也'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        final favorites = state.rawFavorites;
        await ref.read(libraryUpdateProvider.notifier).updateAll(favorites);
      },
      color: AppColors.primary,
      child: ResponsiveComicGrid(
        scrollKey: const PageStorageKey('library_grid_scroll'),
        comics: state.displayItems,
        onTap: (data) {
          context.push('/details/${data.providerId}/${data.comicId}');
        },
        onLongPress: (data) => _showQuickActionBottomSheet(data),
      ),
    );
  }
}
