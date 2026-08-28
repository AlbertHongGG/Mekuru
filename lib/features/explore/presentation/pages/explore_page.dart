import 'package:go_router/go_router.dart';
import 'package:mekuru/features/comic/domain/models/comic_card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/features/explore/presentation/providers/explore_provider.dart';
import 'package:mekuru/core/widgets/search_dialog.dart';
import 'package:mekuru/core/widgets/app_multi_select_bottom_sheet.dart';
import 'package:mekuru/features/settings/presentation/providers/settings_provider.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      final currentSourceId = ref.read(settingsProvider).currentSourceId;
      ref.read(exploreProvider(currentSourceId).notifier).loadExplore(loadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSourceId = ref.watch(settingsProvider.select((s) => s.currentSourceId));
    final state = ref.watch(exploreProvider(currentSourceId));
    final notifier = ref.read(exploreProvider(currentSourceId).notifier);

    // Apply client-side tag filtering
    List<ComicCardData> displayComics = state.comics;
    if (state.activeTags.isNotEmpty) {
      displayComics = displayComics.where((comic) {
        if (state.isExcludeMode) {
          // If any of the comic's tags is in activeTags, exclude it
          return !comic.tags.any((tag) => state.activeTags.contains(tag));
        } else {
          // Comic must contain ALL active tags
          return state.activeTags.every((tag) => comic.tags.contains(tag));
        }
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(state.searchQuery.isNotEmpty ? '搜尋: ${state.searchQuery}' : '探索'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.filter_list_rounded),
                if (state.activeTags.isNotEmpty)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: state.isExcludeMode ? Colors.redAccent : AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${state.activeTags.length}',
                        style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
                builder: (context) => Consumer(
                  builder: (context, ref, _) {
                    final bottomState = ref.watch(exploreProvider(currentSourceId));
                    final bottomNotifier = ref.read(exploreProvider(currentSourceId).notifier);
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: SafeArea(
                        child: AppMultiSelectBottomSheet(
                          title: '標籤過濾',
                          items: bottomState.knownTags,
                          selectedItems: bottomState.activeTags,
                          isExcludeMode: bottomState.isExcludeMode,
                          onToggleItem: (tag) => bottomNotifier.toggleTag(tag),
                          onToggleMode: () => bottomNotifier.toggleExcludeMode(),
                          onClearAll: () => bottomNotifier.clearTags(),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(state.searchQuery.isNotEmpty ? Icons.close_rounded : Icons.search_rounded),
            onPressed: () {
              if (state.searchQuery.isNotEmpty) {
                notifier.search('');
              } else {
                showDialog(
                  context: context,
                  builder: (_) => SearchDialog(
                    initialQuery: state.searchQuery,
                    hintText: '在探索中搜尋...',
                    onSearch: (query) {
                      _searchController.text = query;
                      notifier.search(query);
                    },
                    onClear: () {
                      _searchController.clear();
                      notifier.search('');
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: _buildBody(state, displayComics, notifier),
    );
  }

  Widget _buildBody(ExploreState state, List<ComicCardData> displayComics, ExploreNotifier notifier) {
    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('發生錯誤: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => notifier.loadExplore(),
              child: const Text('重試'),
            ),
          ],
        ),
      );
    }

    if (state.isLoading && displayComics.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (displayComics.isEmpty) {
      return const Center(child: Text('沒有找到相關漫畫'));
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => notifier.loadExplore(),
      child: ResponsiveComicGrid(
        controller: _scrollController,
        comics: displayComics,
        hasNext: state.hasNext,
        
        onTap: (data) {
          context.push('/details/${data.providerId}/${data.comicId}');
        },
      ),
    );
  }
}
