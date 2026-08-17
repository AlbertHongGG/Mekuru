import 'package:flutter/material.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/core/widgets/comic_card.dart';

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
    // 根據使用者要求，強制變為 2 排，且間距縮小
    return GridView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75, // 調整比例讓卡片不會過長
        crossAxisSpacing: 8,
        mainAxisSpacing: 12,
      ),
      itemCount: comics.length + (hasNext ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == comics.length) {
          return const Center(child: CircularProgressIndicator());
        }
        final comic = comics[index];
        return ComicCard(
          comic: comic,
          onTap: () => onTap(comic),
        );
      },
    );
  }
}
