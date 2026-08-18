import 'package:flutter/material.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/core/widgets/comic_card.dart';
import 'package:mekuru/core/theme/app_colors.dart';

class ResponsiveComicGrid extends StatelessWidget {
  final List<Comic> comics;
  final ScrollController? controller;
  final bool hasNext;
  final VoidCallback? onLoadMore;
  final void Function(Comic) onTap;

  const ResponsiveComicGrid({
    super.key,
    required this.comics,
    this.controller,
    this.hasNext = false,
    this.onLoadMore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final comic = comics[index];
                return ComicCard(
                  comic: comic,
                  onTap: () => onTap(comic),
                );
              },
              childCount: comics.length,
            ),
          ),
        ),
        if (hasNext)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 24),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
          ),
      ],
    );
  }
}
