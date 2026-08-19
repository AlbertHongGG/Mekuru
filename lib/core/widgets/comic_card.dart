import 'package:flutter/material.dart';
import 'package:mekuru/domain/models/comic.dart';
import 'package:mekuru/core/widgets/comic_image.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;
  final VoidCallback? onTap;

  const ComicCard({
    super.key,
    required this.comic,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(0.2),
              ),
              clipBehavior: Clip.antiAlias,
              child: comic.coverUrl != null && comic.coverUrl!.isNotEmpty
                  ? ComicImage(
                      imageUrl: comic.coverUrl!,
                      providerId: comic.providerId,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Icon(Icons.image_not_supported)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            comic.title ?? '未知標題',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              if (comic.author != null && comic.author!.isNotEmpty) ...[
                const Icon(Icons.person_outline, size: 12, color: Colors.grey),
                const SizedBox(width: 2),
                Flexible(
                  flex: 1,
                  child: Text(
                    comic.author!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
              if (comic.author != null && comic.author!.isNotEmpty && comic.tags != null && comic.tags!.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('•', style: TextStyle(color: Colors.grey, fontSize: 10)),
                ),
              if (comic.tags != null && comic.tags!.isNotEmpty)
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark 
                          ? Colors.white10 
                          : Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      comic.tags!.first,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),    );
  }
}
