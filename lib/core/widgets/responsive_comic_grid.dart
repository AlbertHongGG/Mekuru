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
          SliverPadding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const _ShimmerComicCard();
                },
                childCount: 4, // Show 4 skeleton cards
              ),
            ),
          ),
      ],
    );
  }
}

class _ShimmerComicCard extends StatefulWidget {
  const _ShimmerComicCard();

  @override
  State<_ShimmerComicCard> createState() => _ShimmerComicCardState();
}

class _ShimmerComicCardState extends State<_ShimmerComicCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    _colorAnim = ColorTween(
      begin: isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.05),
      end: isDark ? Colors.white24 : Colors.black.withValues(alpha: 0.15),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnim,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: _colorAnim.value,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 14,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _colorAnim.value,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 12,
              width: 80,
              decoration: BoxDecoration(
                color: _colorAnim.value,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        );
      },
    );
  }
}
