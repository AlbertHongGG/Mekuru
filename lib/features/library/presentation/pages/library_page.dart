import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/domain/models/user_interaction.dart';
import 'package:mekuru/features/library/presentation/providers/library_provider.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({super.key});

  @override
  ConsumerState<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends ConsumerState<LibraryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(libraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: '在書庫中搜尋...',
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.add, size: 18), text: '近期加入'),
            Tab(icon: Icon(Icons.local_fire_department, size: 18), text: '最近更新'),
            Tab(icon: Icon(Icons.schedule, size: 18), text: '近期看過'),
          ],
        ),
      ),
      body: state.isLoading && state.favorites.isEmpty
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : state.error != null
              ? Center(child: Text('發生錯誤: ${state.error}'))
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildGridView(state.favorites, 'added'),
                    _buildGridView(state.favorites, 'updated'),
                    _buildGridView(state.favorites, 'read'),
                  ],
                ),
    );
  }

  Widget _buildGridView(List<UserFavorite> favorites, String sortMode) {
    // 1. Filter
    var result = favorites.where((f) => f.comic != null).toList();
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      result = result.where((f) {
        final title = f.comic!.title.toLowerCase();
        final author = f.comic!.author?.toLowerCase() ?? '';
        return title.contains(q) || author.contains(q);
      }).toList();
    }

    // 2. Sort
    result = List.from(result); // Copy to sort
    result.sort((a, b) {
      if (sortMode == 'added') {
        final timeA = DateTime.tryParse(a.addedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
        final timeB = DateTime.tryParse(b.addedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
        return timeB.compareTo(timeA);
      } else if (sortMode == 'read') {
        final timeA = a.lastReadAt != null ? (DateTime.tryParse(a.lastReadAt!) ?? DateTime.fromMillisecondsSinceEpoch(0)) : DateTime.fromMillisecondsSinceEpoch(0);
        final timeB = b.lastReadAt != null ? (DateTime.tryParse(b.lastReadAt!) ?? DateTime.fromMillisecondsSinceEpoch(0)) : DateTime.fromMillisecondsSinceEpoch(0);
        return timeB.compareTo(timeA);
      } else {
        // updated fallback to added
        final timeA = DateTime.tryParse(a.addedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
        final timeB = DateTime.tryParse(b.addedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
        return timeB.compareTo(timeA);
      }
    });

    if (result.isEmpty) {
      return const Center(child: Text('書庫空空如也'));
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(libraryProvider.notifier).loadLibrary(),
      color: AppColors.primary,
      child: ResponsiveComicGrid(
        comics: result.where((e) => e.comic != null).map((e) => e.comic!).toList(),
        onTap: (comic) {
          context.push('/details/${comic.providerId ?? "comicwifi"}/${comic.comicId}');
        },
      ),
    );
  }
}
