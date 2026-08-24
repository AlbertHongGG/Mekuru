import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/features/library/presentation/providers/library_provider.dart';
import 'package:mekuru/core/widgets/search_dialog.dart';
import 'package:mekuru/core/widgets/app_bottom_sheet.dart';
import 'package:mekuru/data/sources/provider_registry.dart';

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

  void _showSortBottomSheet(String currentSortMode) {
    AppBottomSheet.show(
      context: context,
      title: '排序',
      items: [
        AppBottomSheetItemData(
          title: '近期加入',
          leadingIcon: Icons.add,
          value: 'added',
        ),
        AppBottomSheetItemData(
          title: '最近更新',
          leadingIcon: Icons.local_fire_department,
          value: 'updated',
        ),
        AppBottomSheetItemData(
          title: '近期閱讀',
          leadingIcon: Icons.schedule,
          value: 'read',
        ),
      ],
      selectedValue: currentSortMode,
      onItemSelected: (val) {
        ref.read(libraryProvider.notifier).setSortMode(val);
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
        child: state.isLoading && state.displayItems.isEmpty
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : state.error != null
                ? Center(child: Text('錯誤: ${state.error}'))
                : _buildGridView(state.displayItems),
      ),
    );
  }

  Widget _buildGridView(List<ComicCardData> displayItems) {
    if (displayItems.isEmpty) {
      return const Center(child: Text('書庫空空如也'));
    }

    return RefreshIndicator(
      onRefresh: () async => ref.read(libraryProvider.notifier).loadLibrary(),
      color: AppColors.primary,
      child: ResponsiveComicGrid(
        comics: displayItems,
        onTap: (data) {
          context.push('/details/${data.providerId}/${data.comicId}');
        },
      ),
    );
  }
}
