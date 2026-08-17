import 'package:flutter/material.dart';
import 'package:mekuru/domain/models/comic.dart';

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
              child: comic.coverUrl != null
                  ? Image.network(comic.coverUrl!, fit: BoxFit.cover)
                  : const Center(child: Icon(Icons.image_not_supported)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            comic.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            (comic.tags != null && comic.tags!.isNotEmpty) ? comic.tags!.first : (comic.author ?? ''),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),    );
  }
}
