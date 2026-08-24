import 'package:flutter/material.dart';
import 'package:mekuru/core/models/comic_card_data.dart';
import 'package:mekuru/core/widgets/comic_card.dart';
import 'package:mekuru/core/theme/app_colors.dart';

class ResponsiveComicGrid extends StatelessWidget {
  final List<ComicCardData> comics;
  final ScrollController? controller;
  final bool hasNext;
  final VoidCallback? onLoadMore;
  final void Function(ComicCardData) onTap;

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
          // Unified padding for the entire list
          padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: hasNext ? 24 : 12),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Unified polymorphic builder sink
                if (index < comics.length) {
                  final data = comics[index];
                  return ComicCard(
                    data: data,
                    onTap: () => onTap(data),
                  );
                } else {
                  return const _ShimmerComicCard();
                }
              },
              // Total count includes both data items and loading skeletons
              childCount: comics.length + (hasNext ? 4 : 0),
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
