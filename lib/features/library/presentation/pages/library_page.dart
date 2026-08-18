import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/core/widgets/responsive_comic_grid.dart';
import 'package:mekuru/domain/models/user_interaction.dart';
import 'package:mekuru/features/library/presentation/providers/library_provider.dart';
import 'package:mekuru/core/widgets/search_dialog.dart';
import 'package:mekuru/core/widgets/app_bottom_sheet.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({super.key});

  @override
  ConsumerState<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends ConsumerState<LibraryPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _currentSortMode = 'added';
  
  final Map<String, String> _sortLabels = {
    'added': '近期加入',
    'updated': '最近更新',
    'read': '近期看過',
  };
  
  final Map<String, IconData> _sortIcons = {
    'added': Icons.add,
    'updated': Icons.local_fire_department,
    'read': Icons.schedule,
  };

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showSortBottomSheet() {
    AppBottomSheet.show(
      context: context,
      title: '排序方式',
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
          title: '近期看過',
          leadingIcon: Icons.schedule,
          value: 'read',
        ),
      ],
      selectedValue: _currentSortMode,
      onItemSelected: (val) {
        setState(() {
          _currentSortMode = val;
        });
      },
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = ref.watch(libraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_searchQuery.isNotEmpty ? '搜尋: $_searchQuery' : '書庫'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: _showSortBottomSheet,
          ),
          IconButton(
            icon: Icon(_searchQuery.isNotEmpty ? Icons.close_rounded : Icons.search_rounded),
            onPressed: () {
              if (_searchQuery.isNotEmpty) {
                _searchController.clear();
              } else {
                showDialog(
                  context: context,
                  builder: (_) => SearchDialog(
                    initialQuery: _searchQuery,
                    hintText: '在書庫中搜尋...',
                    onSearch: (query) {
                      _searchController.text = query;
                    },
                    onClear: () {
                      _searchController.clear();
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: state.isLoading && state.favorites.isEmpty
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : state.error != null
                ? Center(child: Text('發生錯誤: ${state.error}'))
                : _buildGridView(state.favorites, _currentSortMode),
      ),
    );
  }

  Widget _buildGridView(List<UserFavorite> favorites, String sortMode) {
    // 1. Filter
    var result = favorites.where((f) => f.comic != null).toList();
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      result = result.where((f) {
        final title = (f.comic!.title ?? '').toLowerCase();
        
        return title.contains(q);
      }).toList();
    }

    // 2. Sort
    result = List.from(result); // Copy to sort
    result.sort((a, b) {
      if (sortMode == 'added') {
        final timeA = DateTime.tryParse(a.addedAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
        final timeB = DateTime.tryParse(b.addedAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
        return timeB.compareTo(timeA);
      } else if (sortMode == 'read') {
        final timeA = a.lastReadAt != null ? (DateTime.tryParse(a.lastReadAt!) ?? DateTime.fromMillisecondsSinceEpoch(0)) : DateTime.fromMillisecondsSinceEpoch(0);
        final timeB = b.lastReadAt != null ? (DateTime.tryParse(b.lastReadAt!) ?? DateTime.fromMillisecondsSinceEpoch(0)) : DateTime.fromMillisecondsSinceEpoch(0);
        return timeB.compareTo(timeA);
      } else {
        // updated fallback to added
        final timeA = DateTime.tryParse(a.addedAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
        final timeB = DateTime.tryParse(b.addedAt ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
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
