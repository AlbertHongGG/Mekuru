import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mekuru/core/theme/app_colors.dart';
import 'package:mekuru/features/comic/presentation/providers/comic_details_provider.dart';

class ComicDetailsPage extends ConsumerWidget {
  final String providerId;
  final String comicId;

  const ComicDetailsPage({
    super.key,
    required this.providerId,
    required this.comicId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arg = (providerId: providerId, comicId: comicId);
    final state = ref.watch(comicDetailsProvider(arg));
    final notifier = ref.read(comicDetailsProvider(arg).notifier);

    return Scaffold(
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : state.error != null
              ? Center(child: Text('發生錯誤: ${state.error}'))
              : _buildContent(context, ref, state, notifier),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, ComicDetailsState state, ComicDetailsNotifier notifier) {
    final comic = state.comic;
    if (comic == null) return const SizedBox.shrink();

    final isFavorite = state.interaction?.isFavorite ?? false;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (comic.coverUrl != null)
                  Image.network(comic.coverUrl!, fit: BoxFit.cover),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : null),
              onPressed: () => notifier.toggleFavorite(),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comic.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (comic.author != null) Text('作者: ${comic.author}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                if (comic.status != null) Text('狀態: ${comic.status}', style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 16),
                if (comic.tags != null && comic.tags!.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: comic.tags!.map((t) => Chip(label: Text(t), backgroundColor: Colors.grey.withOpacity(0.2))).toList(),
                  ),
                const SizedBox(height: 16),
                if (comic.description != null)
                  Text(comic.description!, style: const TextStyle(fontSize: 14, height: 1.5)),
                const SizedBox(height: 24),
                const Text('章節列表', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final chapter = state.chapters[index];
              return ListTile(
                title: Text(chapter.title),
                subtitle: chapter.publishedAt != null ? Text(chapter.publishedAt!) : null,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  context.push('/viewer/$providerId/$comicId/${chapter.id}');
                },
              );
            },
            childCount: state.chapters.length,
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
      ],
    );
  }
}
