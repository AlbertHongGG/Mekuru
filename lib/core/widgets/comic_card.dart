import 'package:flutter/material.dart';
import 'package:mekuru/core/models/comic_card_data.dart';
import 'package:mekuru/core/widgets/comic_image.dart';

class ComicCard extends StatelessWidget {
  final ComicCardData data;
  final VoidCallback? onTap;

  const ComicCard({
    super.key,
    required this.data,
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
                color: Colors.grey.withValues(alpha: 0.2),
              ),
              clipBehavior: Clip.antiAlias,
              child: data.coverUrl != null && data.coverUrl!.isNotEmpty
                  ? ComicImage(
                      imageUrl: data.coverUrl!,
                      providerId: data.providerId,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Icon(Icons.image_not_supported)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.title ?? '未知標題',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 16,
            child: Row(
              children: [
                if (data.author.isNotEmpty) ...[
                  const Icon(Icons.person_outline, size: 12, color: Colors.grey),
                  const SizedBox(width: 2),
                  Flexible(
                    flex: 1,
                    child: Text(
                      data.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
                if (data.author.isNotEmpty && data.tags.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('•', style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ),
                if (data.tags.isNotEmpty)
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark 
                            ? Colors.white10 
                            : Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        data.tags.first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                if (data.progressLabel != null) ...[
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark 
                          ? Colors.blue.withValues(alpha: 0.2) 
                          : Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      data.progressLabel!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.blue[300] : Colors.blue[800], 
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
