import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/features/explore/presentation/providers/explore_provider.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(exploreProvider.notifier).loadExplore(loadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exploreProvider);
    final notifier = ref.read(exploreProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: '搜尋漫畫來源...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey.shade400),
          ),
          onSubmitted: (val) => notifier.search(val),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => notifier.search(_searchController.text),
          ),
        ],
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(ExploreState state) {
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
              onPressed: () => ref.read(exploreProvider.notifier).loadExplore(),
              child: const Text('重試'),
            ),
          ],
        ),
      );
    }

    if (state.isLoading && state.comics.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (state.comics.isEmpty) {
      return const Center(child: Text('找不到相關漫畫'));
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(exploreProvider.notifier).loadExplore(),
      color: AppColors.primary,
      child: ResponsiveComicGrid(
        controller: _scrollController,
        comics: state.comics,
        hasNext: state.hasNext,
        onTap: (comic) {
          context.push('/details/${comic.providerId ?? "comicwifi"}/${comic.comicId}');
        },
      ),
    );
  }
}
